package mykhailok.inventory.service;

import mykhailok.inventory.model.User;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigInteger;
import java.util.List;


public interface UserService {

    void save(User user);

    void update(User user);

    @Transactional
    List<User> getAllUsers();

    @Transactional
    void deleteById(BigInteger id);

    @Transactional
    User getById(BigInteger id);

    User findByUsername(String username);

    BigInteger findMaxId();
}
