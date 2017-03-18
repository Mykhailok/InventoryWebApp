package mykhailok.inventory.service;

import mykhailok.inventory.model.User;
import org.springframework.transaction.annotation.Transactional;


public interface UserService {

    void save(User user);

    @Transactional
    void deleteById(int id);

    User findByUsername(String username);

    int findMaxId();
}
