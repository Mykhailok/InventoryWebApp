package mykhailok.inventory.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "owners")
@AttributeOverride(name = "name", column = @Column(name = "firstname"))
public class Owner extends NamedEntity {

    //@Column(name = "firstname")
    //private String firstName;

    @Column(name = "lastname")
    private String lastName;

    //@CollectionTable(name = "owner_product", joinColumns = @JoinColumn(name = "owner_id"))
    ///@Column(name = "product_id")
    @OneToMany
    @JoinColumn(name = Product.NAME)
    @ElementCollection(fetch = FetchType.EAGER)
    private Set<Owner> products;

    public String getFirstName() {
        return name;
    }

    public void setFirstName(String firstName) {
        this.name = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Set<Owner> getProducts() {
        return products;
    }

    public void setProducts(Set<Owner> products) {
        this.products = products;
    }
}
