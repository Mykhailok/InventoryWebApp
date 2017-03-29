package mykhailok.inventory.dao.builder;


import mykhailok.inventory.model.Owner;
import org.springframework.test.util.ReflectionTestUtils;

public class OwnerBuilder {
    private Owner model;

    public OwnerBuilder() {
        model = new Owner();
    }

    public OwnerBuilder id(Long id) {
        ReflectionTestUtils.setField(model, "id", id);
        return this;
    }

    public OwnerBuilder firstName(String firstName) {
        model.setFirstName(firstName);
        return this;
    }

    public OwnerBuilder lastName(String lastName) {
        model.setLastName(lastName);
        return this;
    }

    public Owner build() {
        return model;
    }

}
