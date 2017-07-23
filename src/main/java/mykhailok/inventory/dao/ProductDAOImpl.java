package mykhailok.inventory.dao;

import mykhailok.inventory.model.Owner;
import mykhailok.inventory.model.Product;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.Query;
import java.math.BigInteger;
import java.util.Set;

@Repository
public class ProductDAOImpl extends JpaGenericDAOImpl<Product> implements ProductDAO {
    private Product product;
    private static final Logger logger = LoggerFactory.getLogger(ProductDAOImpl.class);

    @Override
    public BigInteger findMaxId() {
        Query query = em.createQuery("from Product where id = (select max(id) from Product)");
        product = (Product) query.getSingleResult();
        BigInteger maxId = product.getId();
        return maxId;
    }

    @Override
    public Product findByProductName(String name) {
        Query query = em.createQuery("SELECT p FROM Product p WHERE p.productname=:productname", Product.class)
                .setParameter("productname", name);
        try {
            if (query.getResultList().size() != 0) {
                product = (Product) query.getSingleResult();
            }
        } catch (NoResultException e) {
            logger.error("Cannot find entity by name: " + name);
        } catch (NonUniqueResultException e) {
            logger.error("Error! Name should be unique! Several entities has been found by name: " + name);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }

    @Override
    public Set<Product> getAllProducts() {
        /*List<Product> products = (List<Product>) em.
                createNativeQuery("SELECT productname, owner_id, manufacturer, price, description " +
                        "FROM product, owners WHERE owners.id = product.owner_id;").getResultList();*/
        Set<Product> products = (Set<Product>) em.createQuery("from Product", Product.class).getResultList();
        if (products == null) {
            logger.error("Search for products has failed.");
        } else {
            logger.info("Search for all products has been successful.");
        }
        return products;
    }

    /*@Override
    public Product getById(BigInteger id) {
        Product product = em.find(Product.class, id);
        return product;
    }*/

    @Override
    public Product getById(BigInteger id) {
        Query query = em.createQuery("SELECT p FROM Product p WHERE p.id=:id", Product.class)
                .setParameter("id", id);
        product = (Product) query.getSingleResult();
        return product;
    }

    @Override
    public void saveWithOwner(Product product) {

    }

    @Override
    public void updateWithOwner(Product product) {
        
    }

    @Override
    public void saveOwnerId(BigInteger owner_id, BigInteger product_id) {
        Query query = em.createNativeQuery("INSERT INTO owner_product (owner_id, product_id) VALUES (?,?)");
        query.setParameter(1, owner_id);
        query.setParameter(2, product_id);
        query.executeUpdate();

    }

    @Override
    public void updateOwnerId(BigInteger owner_id, BigInteger product_id) {
        Query query = em.createNativeQuery("UPDATE owner_product " +
                "SET (owner_id, product_id) = (?,?) WHERE owner_id=? AND product_id=?");
        query.setParameter(1, owner_id);
        query.setParameter(2, product_id);

        query.executeUpdate();
    }








    /*@Override
    public Product getById(BigInteger prod_id) {
        Product result;
        Query query = em.createNativeQuery("SELECT product.id, product.productname" +
                ", product.owner, product.manufacturer, product.description, product.price FROM product " +
                "JOIN owner_product ON product.id = owner_product.product_id " +
                "JOIN owners ON owners.id=owner_product.owner_id WHERE product.id=:id", Product.class);
        query.setParameter("id", prod_id);
        result = (Product) query.getSingleResult();
        return result;
    }*/

}
