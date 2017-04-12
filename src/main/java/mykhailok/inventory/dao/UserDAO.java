package mykhailok.inventory.dao;

import mykhailok.inventory.model.User;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigInteger;
import java.util.Collection;
import java.util.Set;


public interface UserDAO extends AbstractDAO<User>  {
    @Transactional
    User findByUsername(String username);

    @Transactional
    BigInteger findMaxId();

    @Transactional
    Collection<User> getAllUsers();

    @Transactional
    User getById(BigInteger id);
}
