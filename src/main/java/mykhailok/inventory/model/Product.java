package mykhailok.inventory.model;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.math.BigInteger;
import java.util.Set;

@Entity
@Table(name = "product")

public class Product extends NamedEntity {

    public static final String NAME = "productname";
    public static final String OWNER_ID = "owner_id";

    @Column(name = Product.NAME)
    private String productName;

    @ManyToMany
    @Fetch(FetchMode.JOIN)
    @JoinTable(
            name = "owner_product",
            joinColumns = @JoinColumn(name = "owner_id"),
            inverseJoinColumns = @JoinColumn(name = "product_id")
    )
    private Set<Owner> owners;

    /*@ManyToOne(optional=false)
    @JoinColumn(name = Product.OWNER_ID)*/
    @Column(name = Product.OWNER_ID)
    @LazyCollection(value = LazyCollectionOption.FALSE)
    private BigInteger owner_id;

    @Column(name = "manufacturer")
    private String productManufacturer;

    @Column(name = "price")
    private float price;

    @Column(name = "description")
    private String productDescription;

    public Product() {

    }

    public static String getNAME() {
        return NAME;
    }

    public BigInteger getOwner_id() {
        return owner_id;
    }

    public void setOwner_id(BigInteger owner_id) {
        this.owner_id = owner_id;
    }

    public static String getOwnerId() {
        return OWNER_ID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Set<Owner> getOwners() {
        return owners;
    }

    public void setOwners(Set<Owner> owners) {
        this.owners = owners;
    }

    public String getProductManufacturer() {
        return productManufacturer;
    }

    public void setProductManufacturer(String productManufacturer) {
        this.productManufacturer = productManufacturer;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public void addOwner (Owner owner){
        this.owners.add(owner);
    }

    @Override
    public String toString() {
        return "Product{" +
                "productName='" + productName + '\'' +
                ", id=" + id +
                ", owners=" + owners +
                ", owner_id=" + owner_id +
                ", productManufacturer='" + productManufacturer + '\'' +
                ", price=" + price +
                ", productDescription='" + productDescription + '\'' +
                '}';
    }
}
