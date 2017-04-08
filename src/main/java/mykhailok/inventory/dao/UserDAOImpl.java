package mykhailok.inventory.dao;

import mykhailok.inventory.model.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.Query;
import java.math.BigInteger;
import java.util.Set;

@Repository
public class UserDAOImpl extends JpaGenericDAOImpl<User> implements UserDAO {
    private static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);
    private User user = null;
    //private SessionFactory sessionFactory;

    @Override
    public User findByUsername(String username) {

        Query query = em.createQuery("SELECT u FROM User u WHERE u.username=:name", User.class)
                .setParameter("name", username);
        try {
            if (query.getResultList().size() != 0) {
                user = (User) query.getSingleResult();
            }
        } catch (NoResultException e) {
            logger.error("Cannot find entity by name: " + username);
        } catch (NonUniqueResultException e) {
            logger.error("Error! Name should be unique! Several entities has been found by name: " + username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public BigInteger findMaxId() {
        Query query = em.createQuery("FROM User where id = (select max(id) from User)");
        user = (User) query.getSingleResult();
        BigInteger maxId = user.getId();
        return maxId;
    }

    @Override
    public Set<User> getAllUsers() {
        Set<User> users = (Set<User>) em.createQuery("FROM User", User.class).getResultList();
        if (users == null) {
            logger.error("Search for users has failed.");
        } else {
            logger.info("Search for all users has been successful.");
        }
        return users;
    }

    @Override
    public User getById(BigInteger id) {
        Query query = em.createQuery("SELECT u FROM User u WHERE u.id=:id", User.class)
                .setParameter("id", id);
        user = (User) query.getSingleResult();
        return user;
    }
}
