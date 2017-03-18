package mykhailok.inventory.dao;

import java.util.List;

public interface AbstractDAO<T> {

    T save(T product);

    void delete(int id);

    T get(int id);

    List<T> getAll();

}
