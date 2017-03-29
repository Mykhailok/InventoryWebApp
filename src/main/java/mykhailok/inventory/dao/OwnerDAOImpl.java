package mykhailok.inventory.dao;


import mykhailok.inventory.model.Owner;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.Query;
import java.math.BigInteger;
import java.util.List;
import java.util.Set;

@Repository
public class OwnerDAOImpl extends JpaGenericDAOImpl<Owner> implements OwnerDAO {

    private Owner owner;

    private static final Logger logger = LoggerFactory.getLogger(OwnerDAOImpl.class);

    @Override
    public Owner findByOwnerLastName(String ownerLastName) {
        Query query = em.createQuery("SELECT o FROM Owner o WHERE o.lastName=:name", Owner.class)
                .setParameter("name", ownerLastName);
        try {
            if (query.getResultList().size() != 0) {
                owner = (Owner) query.getSingleResult();
            }
        } catch (NoResultException e) {
            logger.error("Cannot find entity by name: " + ownerLastName);
        } catch (NonUniqueResultException e) {
            logger.error("Error! Name should be unique! Several entities has been found by name: " + ownerLastName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return owner;
    }

    @Override
    public BigInteger countRow() {
        Query nativeQuery = em.createNativeQuery("SELECT COUNT(id) FROM owners");
        BigInteger countRow = (BigInteger) nativeQuery.getSingleResult();
        return countRow;
    }

    @Override
    public List<Owner> getAllOwners() {
        List<Owner> owners = em.createQuery("from Owner", Owner.class).getResultList();
        if (owners == null) {
            logger.error("Search for companies has failed.");
        } else {
            logger.info("Search for all companies has been successful.");
        }
        return owners;
    }
}
