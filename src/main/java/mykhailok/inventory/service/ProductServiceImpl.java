package mykhailok.inventory.service;

import mykhailok.inventory.dao.ProductDAO;
import mykhailok.inventory.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDAO productDAO;

    @Override
    @Transactional
    public void add(Product product) {
        productDAO.save(product);
    }

    @Override
    @Transactional
    public void update(Product product) {
        productDAO.save(product);
    }

    @Override
    @Transactional
    public void delete(int id) {
        productDAO.delete(id);
    }

    @Override
    @Transactional
    public Product get(int id) {
        return productDAO.get(id);
    }

    @Override
    @Transactional
    public List<Product> getAll() {
        return productDAO.getAll();
    }

    @Override
    public int findMaxId() {
        return productDAO.findMaxId();
    }

    @Override
    public Product findByProductName(String name) {
        return productDAO.findByProductName(name);
    }

}
