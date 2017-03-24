package mykhailok.inventory.model;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.util.List;

@NamedQueries({
        @NamedQuery(name = Owner.DELETE_BY_ID, query = "DELETE FROM Owner o WHERE o.id=:id"),
        @NamedQuery(name = Owner.DELETE_ALL, query = "DELETE FROM Owner o"),
        @NamedQuery(name = Owner.LOAD_BY_COMPANY_NAME, query = "SELECT o FROM Owner o WHERE o.name=:name"),
        //@NamedQuery(name = Owner.LOAD_ALL_OWNERS, query = "SELECT o FROM Owner o"),
})

@NamedNativeQueries({
        @NamedNativeQuery(name = Owner.LOAD_ALL_OWNERS, query = "SELECT * FROM product, owners, owner_product WHERE\n" +
                "  product.id = owner_product.product_id AND owners.id = owner_product.owner_id;")
})

@Entity
@Table(name = "owners")
@AttributeOverride(name = "name", column = @Column(name = "firstname"))
public class Owner extends NamedEntity {

    public static final String DELETE_BY_ID = "Owner.delete";
    public static final String DELETE_ALL = "Owner.deleteAll";
    public static final String LOAD_BY_COMPANY_NAME = "Owner.loadByName";
    public static final String LOAD_ALL_OWNERS = "Owner.loadAllOwners";

    //@Column(name = "firstname")
    //private String firstName;

    @Column(name = "lastname")
    private String lastName;

    //@CollectionTable(name = "owner_product", joinColumns = @JoinColumn(name = "owner_id"))
    ///@Column(name = "product_id")
    @OneToMany
    @JoinColumn(name = Product.NAME)
    @LazyCollection(value = LazyCollectionOption.FALSE)
    //@ElementCollection(fetch = FetchType.EAGER)
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

}
