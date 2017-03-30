package mykhailok.inventory.model;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.math.BigInteger;
import java.util.List;


@Entity
@Table(name = "owners")
public class Owner extends NamedEntity {

    @Column(name = "firstname")
    private String firstName;

    @Column(name = "lastname")
    private String lastName;

    @OneToMany
    @JoinColumn(name = Product.OWNER_ID, insertable=false, updatable=false)
    @LazyCollection(value = LazyCollectionOption.FALSE)
    private List<Product> products;


    public Owner() {
    }

    public Owner(BigInteger bigInteger, String firstName, String lastName) {

    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }


    /*@Override
    public String toString() {
        return "Owner{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                '}';
    }*/

    @Override
    public String toString(){
        return firstName + " " + lastName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Owner)) return false;

        Owner owner = (Owner) o;

        if (firstName != null ? !firstName.equals(owner.firstName) : owner.firstName != null) return false;
        if (!lastName.equals(owner.lastName)) return false;
        return products != null ? products.equals(owner.products) : owner.products == null;
    }

    @Override
    public int hashCode() {
        int result = firstName != null ? firstName.hashCode() : 0;
        result = 31 * result + lastName.hashCode();
        result = 31 * result + (products != null ? products.hashCode() : 0);
        return result;
    }
}
