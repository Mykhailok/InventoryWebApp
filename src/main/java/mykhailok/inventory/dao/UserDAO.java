package mykhailok.inventory.dao;

import mykhailok.inventory.model.User;
import org.springframework.transaction.annotation.Transactional;



public interface UserDAO extends AbstractDAO<User>  {
    @Transactional
    User findByUsername(String username);

    @Transactional
    int findMaxId();
}
