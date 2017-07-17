package mykhailok.inventory.dao;

import mykhailok.inventory.model.Owner;
import mykhailok.inventory.model.Product;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigInteger;
import java.util.List;
import java.util.Set;

public interface ProductDAO extends AbstractDAO<Product> {

    @Transactional
    BigInteger findMaxId();

    @Transactional
    Product findByProductName(String name);

    @Transactional
    Set<Product> getAllProducts();

    @Transactional
    Product getById(BigInteger id);
    
    @Transactional
    void saveWithOwner(Product product);
    
    @Transactional
    void updateWithOwner(Product product);

    @Transactional
    void saveOwnerId(BigInteger owner_id, BigInteger product_id);

    @Transactional
    void updateOwnerId(BigInteger owner_id, BigInteger product_id);

}
