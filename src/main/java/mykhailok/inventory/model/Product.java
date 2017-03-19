package mykhailok.inventory.model;

import javax.persistence.AttributeOverride;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "product")
@AttributeOverride(name = "name", column = @Column(name = Product.NAME))
public class Product extends NamedEntity {

    public static final String NAME = "name";

    @Column(name = "owner")
    private String owner;

    @Column(name = "manufacturer")
    private String productManufacturer;

    @Column(name = "price")
    private float price;

    @Column(name = "description")
    private String productDescription;

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
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

    @Override
    public String toString() {
        return "Product{" +
                "ID='" + getID() + '\'' +
                ", product_name='" + getName() + '\'' +
                ", owner='" + owner + '\'' +
                ", productManufacturer='" + productManufacturer + '\'' +
                ", price=" + price +
                ", productDescription='" + productDescription + '\'' +
                '}';
    }
}
