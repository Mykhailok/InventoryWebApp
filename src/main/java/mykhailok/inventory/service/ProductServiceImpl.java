package mykhailok.inventory.service;

import mykhailok.inventory.dao.ProductDAO;
import mykhailok.inventory.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigInteger;
import java.util.List;
import java.util.Set;

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
    public void delete(BigInteger id) {
        productDAO.delete(id);
    }

    @Override
    @Transactional
    public Product getById(BigInteger id) {
        return productDAO.getById(id);
    }

    @Override
    @Transactional
    public List<Product> getAll() {
        return productDAO.getAll();
    }

    @Override
    public BigInteger findMaxId() {
        return productDAO.findMaxId();
    }

    @Override
    public Set<Product> getAllProducts() {return productDAO.getAllProducts();}

    @Override
    public Product findByProductName(String name) {
        return productDAO.findByProductName(name);
    }

    @Override
    public void saveWithOwner(Product product) {
        productDAO.saveWithOwner(product);
    }

    @Override
    public void updateWithOwner(Product product) {
        productDAO.updateWithOwner(product);
    }


}
