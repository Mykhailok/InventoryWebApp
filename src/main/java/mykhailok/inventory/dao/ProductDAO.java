package mykhailok.inventory.dao;

import mykhailok.inventory.model.Product;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigInteger;
import java.util.List;

public interface ProductDAO extends AbstractDAO<Product> {

    @Transactional
    BigInteger findMaxId();

    @Transactional
    Product findByProductName(String name);

    @Transactional
    List<Product> getAllProducts();

    @Transactional
    Product getById(BigInteger id);
}
