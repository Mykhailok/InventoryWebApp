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

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "products", method = RequestMethod.GET)
    public String listGoods(Model model){
        model.addAttribute("product", new Product());
        model.addAttribute("listProducts", this.productService.getAll());
        return "product";
    }

    @RequestMapping(value = "/products/add", method = RequestMethod.POST)
    public String addGoods(@ModelAttribute("products") Product product){
        if(product.getId() == null){
            this.productService.add(product);
        }else {
            this.productService.update(product);
        }
        return "redirect:/products";
    }

    @RequestMapping("/remove/{id}")
    public String removeGoods(@PathVariable("id") int id){
        this.productService.delete(id);
        return "redirect:/products";
    }

    @RequestMapping("edit/{id}")
    public String editGoods(@PathVariable("id") int id, Model model){
        model.addAttribute("product", this.productService.get(id));
        model.addAttribute("listProduct", this.productService.getAll());
        return "product";
    }

    @RequestMapping("productdata/{id}")
    public String goodsData(@PathVariable("id") int id, Model model){
        model.addAttribute("product", this.productService.get(id));
        return "productData";
    }
}
