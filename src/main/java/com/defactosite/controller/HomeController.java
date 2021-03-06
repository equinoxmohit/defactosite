package com.defactosite.controller;

import com.defactosite.dao.ProductDao;
import com.defactosite.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

/**
 * Created by equinoxmohit on 2/14/17.
 */
@Controller
public class HomeController {

    //add path here to set path later
    Path path;

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

    //BindingResult should be used before httpservletrequest
    @RequestMapping(value = "/admin/addproducts",method = RequestMethod.POST)
    public String adminAddProducts(@Valid @ModelAttribute("product") Product product,
                                   BindingResult result,HttpServletRequest request ) {

        if(result.hasErrors()){
            return "admin/addproducts";
        }

        productDao.insert(product);

        //----------main thing to upload image--------------//
        MultipartFile productImage = product.getProductImage();
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        path = Paths.get(rootDirectory + "/WEB-INF/resources/images/" + product.getProductId() +".png");

        if (productImage != null && !productImage.isEmpty()) {
            try {
                productImage.transferTo(new File(path.toString()));
            } catch (IOException e) {
                e.printStackTrace();

            }
        }
        //------------------------------------------------------//
            return "redirect:/admin/products?success";
    }

    @RequestMapping("/admin/delete/{productId}")
    public String deleteProduct(@PathVariable int productId,HttpServletRequest request){

        //----To delete image when needed to delete---//
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        path = Paths.get(rootDirectory + "/WEB-INF/resources/images/" +productId +".png");


        if (Files.exists(path)){
            try{
                Files.delete(path);
            }catch (IOException ex){
                ex.printStackTrace();
            }
        }

        productDao.delete(productId);

        return "redirect:/admin/products?deletesuccess";

    }

    @RequestMapping("/admin/update/{productId}")
    public String updateProduct(@PathVariable("productId") int productId,Model model)  {



        Product product=productDao.getById(productId);

        model.addAttribute(product);


        return "admin/updateproduct";
    }

    //---after adding the image we need to update in this way in method post---//
    @RequestMapping(value = "/admin/update", method = RequestMethod.POST)
    public String updateProduct(@Valid @ModelAttribute("product") Product product, BindingResult result,
                                HttpServletRequest request){

        if(result.hasErrors()){
            return "admin/updateproduct";
        }

        MultipartFile productImage=product.getProductImage();
        String rootDirectory=request.getSession().getServletContext().getRealPath("/");
        path=Paths.get(rootDirectory+"/WEB-INF/resources/images/"+product.getProductId()+".png");
        if(productImage!=null && !productImage.isEmpty()){
            try{
                productImage.transferTo(new File(path.toString()));
            }catch (IOException ex){
                ex.printStackTrace();
            }
        }

        productDao.update(product);

        return "redirect:/admin/products?updatesuccess";
    }


}
