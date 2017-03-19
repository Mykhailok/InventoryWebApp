package mykhailok.inventory.dao;

import mykhailok.inventory.model.Product;
import org.springframework.stereotype.Repository;

import javax.persistence.Query;

@Repository
public class ProductDAOImpl extends JpaGenericDAOImpl<Product> implements ProductDAO {
    private Product product;

    @Override
    public int findMaxId() {
        Query query = em.createQuery("from Product where id = (select max(id) from Product)");
        product = (Product) query.getSingleResult();
        int maxId = product.getId();
        return maxId;
    }
}
