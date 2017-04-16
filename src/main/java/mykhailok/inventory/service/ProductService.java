package mykhailok.inventory.service;

import mykhailok.inventory.model.Product;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigInteger;
import java.util.Collection;
import java.util.Set;

public interface ProductService {

    void add(Product product);

    void update(Product product);

    void delete(BigInteger id);

    @Transactional
    Product getById(BigInteger id);
    @Transactional
    Collection<Product> getAll();
    @Transactional
    BigInteger findMaxId();
    @Transactional
    Set<Product> getAllProducts();
    @Transactional
    Product findByProductName(String name);

    void saveWithOwner(Product product);
    
    void updateWithOwner(Product product);

    @Transactional
    void saveOwnerId(BigInteger owner_id, BigInteger product_id);

    @Transactional
    void updateOwnerId(BigInteger owner_id, BigInteger product_id);

}
