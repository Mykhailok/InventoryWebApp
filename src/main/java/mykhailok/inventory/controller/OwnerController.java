package mykhailok.inventory.controller;

import mykhailok.inventory.model.Owner;
import mykhailok.inventory.service.OwnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.math.BigInteger;

@Controller
public class OwnerController {

    @Autowired
    private OwnerService ownerService;

    @RequestMapping(value = "owners", method = RequestMethod.GET)
    public String listOwners(Model model){
        model.addAttribute("owner", new Owner());
        model.addAttribute("listOwners", this.ownerService.getAllOwners());
        return "owner";
    }

    @RequestMapping(value = "/owners/add", method = RequestMethod.POST)
    public String addOwner(@ModelAttribute("owners") Owner product){
        if(product.getId() == null){
            this.ownerService.add(product);
        }else {
            this.ownerService.update(product);
        }
        return "redirect:/owners";
    }

    @RequestMapping("/removeOwner/{id}")
    public String removeOwner(@PathVariable("id") BigInteger id){
        this.ownerService.delete(id);
        return "redirect:/owners";
    }

    @RequestMapping("editOwner/{id}")
    public String editOwner(@PathVariable("id") BigInteger id, Model model){
        model.addAttribute("owner", this.ownerService.get(id));
        model.addAttribute("listOwners", this.ownerService.getAllOwners());
        return "owner";
    }

    @RequestMapping("ownerdata/{id}")
    public String ownerData(@PathVariable("id") BigInteger id, Model model){
        model.addAttribute("owner", this.ownerService.get(id));
        return "ownerData";
    }

}
