package net.kzn.onlineshopping.controller;

import net.kzn.onlineshopping.dao.ProductDAO;
import net.kzn.onlineshopping.dto.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/json/data")
public class JsonDataController {

    private final ProductDAO productDAO;

    @Autowired
    public JsonDataController(ProductDAO productDAO) {
        this.productDAO = productDAO;
    }

    @RequestMapping("/all/products")
    @ResponseBody
    public List<Product> getAllProducts() {

        return productDAO.listActiveProducts();
    }

    @RequestMapping("/admin/all/products")
    @ResponseBody
    public List<Product> getAllProductsForAdmin() {

        return productDAO.list();
    }

    @RequestMapping("/category/{id}/products")
    @ResponseBody
    public List<Product> getProductsByCategory(@PathVariable int id) {
        return productDAO.listActiveProductsByCategory(id);
    }

}
