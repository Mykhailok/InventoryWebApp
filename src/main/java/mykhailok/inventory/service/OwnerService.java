package mykhailok.inventory.service;
//Service for owners
import mykhailok.inventory.model.Owner;

import java.math.BigInteger;
import java.util.Collection;

public interface OwnerService {

    void add(Owner owner);

    void update(Owner owner);

    void delete(BigInteger id);

    Owner get(BigInteger id);

    Collection<Owner> getAll();

    Collection<Owner> getAllOwners();

    BigInteger countRow();

    Owner findByOwnerLastName(String ownerLastName);

}
