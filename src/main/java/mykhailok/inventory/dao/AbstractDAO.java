package mykhailok.inventory.dao;

import org.springframework.transaction.annotation.Transactional;

import java.math.BigInteger;
import java.util.Collection;

public interface AbstractDAO<T> {

    @Transactional
    T save(T product);

    @Transactional
    void delete(BigInteger id);

    @Transactional
    T get(BigInteger id);

    @Transactional
    Collection<T> getAll();

}
