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

    List<Product> getAll();

    BigInteger findMaxId();

    List<Product> getAllProducts();

    Product findByProductName(String name);
}
