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

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "owner", "Required");

        if (product.getName().length() < 4 || product.getName().length() > 32) {
            errors.rejectValue("name", "Size.userForm.name");
        }

        if (productService.findByUsername(product.getName()) != null) {
            errors.rejectValue("name", "Duplicate.userForm.username");
        }

    }
}
