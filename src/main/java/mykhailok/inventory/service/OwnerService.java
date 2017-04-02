package mykhailok.inventory.service;

import mykhailok.inventory.model.Owner;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigInteger;
import java.util.Collection;
import java.util.List;
import java.util.Set;

public interface OwnerService {

    void add(Owner owner);

    void update(Owner owner);

    void delete(BigInteger id);

    Owner get(BigInteger id);

    List<Owner> getAll();

    Collection<Owner> getAllOwners();

    BigInteger countRow();

    Owner findByOwnerLastName(String ownerLastName);

}
