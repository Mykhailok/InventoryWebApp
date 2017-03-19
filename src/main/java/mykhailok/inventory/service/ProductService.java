package mykhailok.inventory.service;

import mykhailok.inventory.model.Product;

import java.util.List;

public interface ProductService {

    void add(Product product);

    void update(Product product);

    void delete(int id);

    Product get(int id);

    List<Product> getAll();

    int findMaxId();
}
