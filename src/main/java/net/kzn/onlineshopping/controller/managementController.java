package net.kzn.onlineshopping.controller;

import net.kzn.onlineshopping.dao.CategoryDAO;
import net.kzn.onlineshopping.dao.ProductDAO;
import net.kzn.onlineshopping.dto.Category;
import net.kzn.onlineshopping.dto.Product;
import net.kzn.onlineshopping.util.fileUploadUtility;
import net.kzn.onlineshopping.validator.ProductValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/manage")
public class managementController {

    @Autowired
    private CategoryDAO categoryDAO;

    @Autowired
    private ProductDAO productDAO;

    private static final Logger logger = LoggerFactory.getLogger(managementController.class);

    @RequestMapping(value = "/products", method = RequestMethod.GET)
    public ModelAndView showManageProducts(@RequestParam(name = "operation", required = false) String operation) {

    ModelAndView mv = new ModelAndView("page");

    mv.addObject("userClickManageProducts", true);
    mv.addObject("title", "Manage Products");
    Product nProduct = new Product();

    // set few of the fields
    nProduct.setSupplierId(1);
    nProduct.setActive(true);

    mv.addObject("product", nProduct);

    if(operation!=null) {
        if(operation.equals("product")) {
            mv.addObject("message", "Product Submitted Successfully!");
        }
        else if(operation.equals("category")) {
            mv.addObject("message", "Category Submitted Successfully!");
        }
    }
    return mv;
}

// Edit administrator (Manage Product)
@RequestMapping(value = "/{id}/product", method = RequestMethod.GET)
public ModelAndView showEditProducts(@PathVariable int id) {

    ModelAndView mv = new ModelAndView("page");

    mv.addObject("userClickManageProducts", true);
    mv.addObject("title", "Manage Products");
    // fetch the product from the database
    Product nProduct = productDAO.get(id);
    // set the product fetch from database
    mv.addObject("product", nProduct);
    return mv;
}


     //handing product submission
     @RequestMapping(value = "/products", method = RequestMethod.POST)
     public String handleProductSubmission(@Valid @ModelAttribute("product") Product mProduct, BindingResult results, Model model,
     HttpServletRequest request) {

        // handle image validation for new products
         if(mProduct.getId() == 0) {
             new ProductValidator().validate(mProduct, results);
         }
         else {
             if(!mProduct.getFile().getOriginalFilename().equals("")) {
                 new ProductValidator().validate(mProduct, results);
             }
         }

        // check if there are any errors
         if(results.hasErrors()) {

             model.addAttribute("userClickManageProducts", true);
             model.addAttribute("title", "Manage Products");
             model.addAttribute("message", "Validation failed for Product submission!");

             return "page";
         }

        logger.info(mProduct.toString());

         if(mProduct.getId() == 0){
             // create a new product record if ID is 0
             productDAO.add(mProduct);
         }
         else {
             // update the product if ID is not 0
             productDAO.update(mProduct);
         }
        if(!mProduct.getFile().getOriginalFilename().equals("")) {
           fileUploadUtility.uploadFile(request, mProduct.getFile(), mProduct.getCode());
        }

        return "redirect:/manage/products?operation=product";
     }

     @RequestMapping(value = "/product/{id}/activation", method = RequestMethod.POST)
     @ResponseBody
     public String handleProductActivation(@PathVariable int id) {
        // is going to fetch the product from database
         Product product = productDAO.get(id);
         boolean isActive = product.isActive();
        // activation and deactivating base on the value of active field
         product.setActive(!product.isActive());
        // updating the product
         productDAO.update(product);

         return (isActive)?
                 "You have successfully deactivated the product with id " + product.getId()
                 : "You have successfully activated the product with id " + product.getId();

     }

     // to handle category submission
    @RequestMapping(value = "/category", method = RequestMethod.POST)
    public String handleCategorySubmission(@ModelAttribute Category category) {

        // add the new category
        categoryDAO.add(category);

        return "redirect:/manage/products?operation=category";
    }

    // return categories for all the request mapping
    @ModelAttribute("categories")
    public List getCategories() {

        return categoryDAO.list();
    }

    @ModelAttribute("category")
    public Category getCategory() {
        return new Category();

    }

}