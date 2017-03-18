package mykhailok.inventory.model;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;

@MappedSuperclass
@Access(AccessType.FIELD)
public class NamedEntity {

    public static final String ID = "id";

    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    @Column(name = NamedEntity.ID)
    @Access(value = AccessType.PROPERTY)
    protected Integer id;

    @NotEmpty
    @Column(name = "name", nullable = false)
    protected String name;


    public static String getID() {
        return ID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isNew() {
        return (getId() == null);
    }
}
