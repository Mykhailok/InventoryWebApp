package mykhailok.inventory.service;

import mykhailok.inventory.model.Product;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigInteger;
import java.util.List;

public interface ProductService {

    void add(Product product);

    void update(Product product);

    void delete(BigInteger id);

    @Transactional
    Product getById(BigInteger id);
    @Transactional
    List<Product> getAll();
    @Transactional
    BigInteger findMaxId();
    @Transactional
    List<Product> getAllProducts();
    @Transactional
    Product findByProductName(String name);

    void saveWithOwner(Product product);
    
    void updateWithOwner(Product product);
}
