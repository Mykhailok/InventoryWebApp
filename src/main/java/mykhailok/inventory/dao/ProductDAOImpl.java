package mykhailok.inventory.dao;

import mykhailok.inventory.model.Product;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.Query;

@Repository
public class ProductDAOImpl extends JpaGenericDAOImpl<Product> implements ProductDAO {
    private Product product;
    private static final Logger logger = LoggerFactory.getLogger(ProductDAOImpl.class);

    @Override
    public int findMaxId() {
        Query query = em.createQuery("from Product where id = (select max(id) from Product)");
        product = (Product) query.getSingleResult();
        int maxId = product.getId();
        return maxId;
    }

    @Override
    public Product findByProductName(String name) {
        Query query = em.createQuery("SELECT p FROM Product p WHERE p.name=:name", Product.class)
                .setParameter("name", name);
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
}
