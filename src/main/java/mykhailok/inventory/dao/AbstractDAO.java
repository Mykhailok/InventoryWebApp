package mykhailok.inventory.dao;

import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface AbstractDAO<T> {

    T save(T product);

    void delete(int id);

    T get(int id);

    @Transactional
    List<T> getAll();

}
