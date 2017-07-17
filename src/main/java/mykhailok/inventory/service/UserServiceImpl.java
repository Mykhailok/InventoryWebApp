package mykhailok.inventory.service;

import mykhailok.inventory.dao.UserDAO;
import mykhailok.inventory.model.Role;
import mykhailok.inventory.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigInteger;
import java.util.*;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private BCryptPasswordEncoder encoder;

    @Override
    @Transactional
    public void save(User user) {
        user.setPassword(encoder.encode(user.getPassword()));
        user.setRoles(new HashSet<>(Collections.singletonList(Role.ROLE_USER)));
        userDAO.save(user);
    }

    @Override
    @Transactional
    public void update(User user) {userDAO.save(user);}

    @Override
    @Transactional
    public Collection<User> getAllUsers() {return userDAO.getAllUsers();}

    @Override
    @Transactional
    public User findByUsername(String name) {
        return userDAO.findByUsername(name);
    }

    @Override
    @Transactional
    public BigInteger findMaxId() {
        return userDAO.findMaxId();
    }


    @Override
    @Transactional
    public void deleteById (BigInteger id){
        userDAO.delete(id);
    }

    @Override
    @Transactional
    public User getById(BigInteger id) {
        return userDAO.getById(id);
    }
}