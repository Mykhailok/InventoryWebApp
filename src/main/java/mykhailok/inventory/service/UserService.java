package mykhailok.inventory.service;

import mykhailok.inventory.model.User;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigInteger;


public interface UserService {

    void save(User user);

    @Transactional
    void deleteById(BigInteger id);

    User findByUsername(String username);

    BigInteger findMaxId();
    
}
