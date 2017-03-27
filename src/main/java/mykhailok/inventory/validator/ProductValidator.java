package mykhailok.inventory.validator;


import mykhailok.inventory.model.Product;
import mykhailok.inventory.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class ProductValidator implements Validator {

    @Autowired
    private ProductService productService;

    @Override
    public boolean supports(Class<?> aClass) {
        return Product.class.equals(aClass);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Product product = (Product) target;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "productName", "Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "owner", "Required");

        if (product.getProductName().length() < 1 || product.getProductName().length() > 32) {
            errors.rejectValue("productName", "Size.productForm.name");
        }

        if (productService.findByProductName(product.getProductName()) != null) {
            errors.rejectValue("productName", "Duplicate.productForm.name");
        }

    }
}
