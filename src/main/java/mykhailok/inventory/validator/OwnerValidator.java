package mykhailok.inventory.validator;

import mykhailok.inventory.model.Owner;
import mykhailok.inventory.service.OwnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class OwnerValidator implements Validator {

    @Autowired
    private OwnerService ownerService;

    @Override
    public boolean supports(Class<?> aClass) {
        return Owner.class.equals(aClass);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Owner owner = (Owner) target;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "Required");

        if (owner.getLastName().length() < 4 || owner.getLastName().length() > 32) {
            errors.rejectValue("lastName", "Size.ownerForm.name");
        }

        if (ownerService.findByOwnerLastName(owner.getLastName()) != null) {
           errors.rejectValue("lastName", "Duplicate.ownerForm.name");
        }

    }
}
