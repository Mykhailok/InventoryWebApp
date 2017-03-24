package mykhailok.inventory.dao;

import mykhailok.inventory.model.Product;
import org.springframework.transaction.annotation.Transactional;

public interface ProductDAO extends AbstractDAO<Product> {

    @Transactional
    int findMaxId();

    @Transactional
    Product findByProductName(String name);
}
