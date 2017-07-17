package mykhailok.inventory.model;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import java.math.BigInteger;

@MappedSuperclass
@Access(AccessType.FIELD)
public class NamedEntity {

    public static final String ID = "id";

    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    @Column(name = NamedEntity.ID)
    @Access(value = AccessType.PROPERTY)
    protected BigInteger id;

    /*@NotEmpty
    @Column(name = "name", nullable = false)
    protected String name;*/


    public static String getID() {
        return ID;
    }

    public BigInteger getId() {
        return id;
    }

    public void setId(BigInteger id) {
        this.id = id;
    }

    /*public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }*/

    public boolean isNew() {
        return (getId() == null);
    }

    @Override
    public String toString() {
        return "NamedEntity{" +
                "id=" + id +
                //", name='" + name + '\'' +
                '}';
    }
}
