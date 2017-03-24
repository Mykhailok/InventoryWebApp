package mykhailok.inventory.model;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.util.List;


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
    @LazyCollection(value = LazyCollectionOption.FALSE)
    private List<Owner> products;

    public Owner() {
    }

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

    public List<Owner> getProducts() {
        return products;
    }

    public void setProducts(List<Owner> products) {
        this.products = products;
    }

    @Override
    public String toString() {
        return "Owner{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", lastName='" + lastName + '\'' +
                ", products=" + products +
                '}';
    }
}
