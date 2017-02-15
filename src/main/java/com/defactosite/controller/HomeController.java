package com.defactosite.controller;

import com.defactosite.dao.ProductDao;
import com.defactosite.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by equinoxmohit on 2/14/17.
 */
@Controller
public class HomeController {

    @Autowired
    ProductDao productDao;


    @RequestMapping("/")
    public String landingPage() {
        return "index";
    }

    @RequestMapping("/products")
    public String productList(Model model) {
        List<Product> productList=productDao.getAllProduct();
        model.addAttribute("products",productList);
        return "products";
    }

    @RequestMapping("/products/product/{productId}")
    public String product(@PathVariable int productId, Model model){
        Product product=productDao.getById(productId);
        model.addAttribute("product",product);
        return "product";
    }

    @RequestMapping("/admin")
    public String adminLandingPage(){

        return "admin/admin";
    }

    @RequestMapping("/admin/products")
    public String adminProductsPage(Model model){
        List<Product> productList=productDao.getAllProduct();
        model.addAttribute("products",productList);
        return "admin/products";
    }

    @RequestMapping("/admin/addproducts")
    public String adminAddProducts(Model model){
        Product product=new Product();
        model.addAttribute(product);
        return "admin/addproducts";
    }

    @RequestMapping(value = "/admin/addproducts",method = RequestMethod.POST)
    public String adminAddProducts(@ModelAttribute("product") Product product){
        productDao.insert(product);
        return "redirect:/admin/products?success";
    }


    @RequestMapping("/admin/delete/{productId}")
    public String deleteProduct(@PathVariable int productId){
        productDao.delete(productId);
        return "redirect:/admin/products?deletesuccess";
    }


}
