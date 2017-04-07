package mykhailok.inventory.controller;

import mykhailok.inventory.model.User;
import mykhailok.inventory.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.math.BigInteger;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "users", method = RequestMethod.GET)
    public String listUsers (Model model){
        model.addAttribute("user", new User());
        model.addAttribute("listUsers", this.userService.getAllUsers());
        return "user";
    }

    @RequestMapping(value = "/users/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("users")User user){
        if (user.getId() == null){
            this.userService.save(user);
        } else {
            this.userService.update(user);
        }
        return  "redirect:/users";
    }

    @RequestMapping("/removeUser/{id}")
    public String removeUser(@PathVariable("id")BigInteger id){
        this.userService.deleteById(id);
        return "redirect:/users";
    }

    @RequestMapping("editUser/{id}")
    public String editUser(@PathVariable("id") BigInteger id, Model model){
    model.addAttribute("user", this.userService.getById(id));
    model.addAttribute("listUsers",this.userService.getAllUsers());
    return "user";
    }

    @RequestMapping("userdata/{id}")
    public String productData(@PathVariable("id") BigInteger id, Model model){
        model.addAttribute("user", this.userService.getById(id));
        return "userData";
    }
}
