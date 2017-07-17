package mykhailok.inventory.dao;

import mykhailok.inventory.model.Owner;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigInteger;
import java.util.Collection;
import java.util.List;
import java.util.Set;

public interface OwnerDAO extends AbstractDAO<Owner> {

    @Transactional
    Owner findByOwnerLastName(String ownerLastName);

    @Transactional
    BigInteger countRow();

    @Transactional
    Collection<Owner> getAllOwners();

}
