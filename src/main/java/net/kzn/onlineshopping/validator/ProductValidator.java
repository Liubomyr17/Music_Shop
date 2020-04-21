package net.kzn.onlineshopping.validator;

import net.kzn.onlineshopping.dto.Product;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;


public class ProductValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return Product.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {

        Product product = (Product) target;

        if(product.getFile() == null ||
                product.getFile().getOriginalFilename().equals("")) {
            errors.rejectValue("file", null,"Please select image file to upload!");
            return;
        }
        if(! (
                product.getFile().getContentType().equals("image/jpeg") ||
                        product.getFile().getContentType().equals("image/png") ||
                        product.getFile().getContentType().equals("image/gif") ||
                        product.getFile().getContentType().equals("image/jpn")
        )) {
            errors.rejectValue("file", null, "Please use only an image file to upload!");
        }
    }
}