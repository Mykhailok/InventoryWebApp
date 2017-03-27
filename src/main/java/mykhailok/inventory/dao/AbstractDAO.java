package mykhailok.inventory.dao;

import mykhailok.inventory.model.Product;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigInteger;
import java.util.List;

public interface AbstractDAO<T> {

    T save(T product);

    void delete(BigInteger id);
    @Transactional
    T get(BigInteger id);

    @Transactional
    List<T> getAll();

}
