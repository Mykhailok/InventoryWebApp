package mykhailok.inventory.dao;

import mykhailok.inventory.model.User;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigInteger;


public interface UserDAO extends AbstractDAO<User>  {
    @Transactional
    User findByUsername(String username);

    @Transactional
    BigInteger findMaxId();

}
