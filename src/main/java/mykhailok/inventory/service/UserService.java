package mykhailok.inventory.service;

import mykhailok.inventory.model.User;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigInteger;
import java.util.Collection;
import java.util.List;
import java.util.Set;


public interface UserService {

    void save(User user);

    void update(User user);

    @Transactional
    Collection<User> getAllUsers();

    @Transactional
    void deleteById(BigInteger id);

    @Transactional
    User getById(BigInteger id);
    @Transactional
    User findByUsername(String username);
    @Transactional
    BigInteger findMaxId();
}
