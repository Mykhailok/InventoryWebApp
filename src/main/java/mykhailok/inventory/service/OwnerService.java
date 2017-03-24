package mykhailok.inventory.service;

import mykhailok.inventory.model.Owner;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigInteger;
import java.util.List;

public interface OwnerService {

    void add(Owner owner);

    void update(Owner owner);

    void delete(int id);

    Owner get(int id);

    List<Owner> getAll();

    List<Owner> getAllOwners();

    BigInteger countRow();

    Owner findByOwnerLastName(String ownerLastName);

}
