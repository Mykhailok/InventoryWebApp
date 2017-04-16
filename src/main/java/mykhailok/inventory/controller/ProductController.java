package mykhailok.inventory.controller;

import mykhailok.inventory.model.Product;
import mykhailok.inventory.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.math.BigInteger;
import java.util.Set;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "products", method = RequestMethod.GET)
    public String listProducts(Model model){
        model.addAttribute("product", new Product());
        model.addAttribute("listProducts", this.productService.getAll());
        return "product";
    }

    @RequestMapping(value = "/products/add", method = RequestMethod.POST)
    public String addProduct(@ModelAttribute("products") Product product, HttpServletRequest request){
        String owner_id = request.getParameter("listOfOwners");

        if(product.getId() == null){
            product.setOwner_id(BigInteger.valueOf(Long.parseLong(owner_id)));
            this.productService.add(product);
            this.productService.saveOwnerId(BigInteger.valueOf(Long.parseLong(owner_id)), product.getId());
        }else {
            this.productService.update(product);
        }

        return "redirect:/products";
    }

    @RequestMapping("/removeProduct/{id}")
    public String removeProduct(@PathVariable("id") BigInteger id){
        this.productService.delete(id);
        return "redirect:/products";
    }

    @RequestMapping("editProduct/{id}")
    public String editProduct(@PathVariable("id") BigInteger id, Model model){
        model.addAttribute("product", this.productService.getById(id));
        model.addAttribute("listProducts", this.productService.getAll());
        return "product";
    }

    @RequestMapping("productdata/{id}")
    public String productData(@PathVariable("id") BigInteger id, Model model){
        model.addAttribute("product", this.productService.getById(id));
        return "productData";
    }
}
