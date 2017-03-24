package mykhailok.inventory.dao;

import mykhailok.inventory.model.Owner;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigInteger;
import java.util.List;

public interface OwnerDAO extends AbstractDAO<Owner> {

    @Transactional
    Owner findByOwnerLastName(String ownerLastName);

    @Transactional
    BigInteger countRow();

    @Transactional
    List<Owner> getAllOwners();

}
