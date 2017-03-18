package mykhailok.inventory.service;


import jdk.nashorn.internal.ir.annotations.Ignore;

import mykhailok.inventory.dao.UserDAO;
import mykhailok.inventory.model.User;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import static org.junit.Assert.assertNotNull;
import static org.junit.jupiter.api.Assertions.*;

@Ignore
class UserServiceImplTest {
    private User user = new User();
    private FileSystemXmlApplicationContext applicationContext;
    private UserDAO userDAO;
    private UserService userService;



    @BeforeEach
    void setUp() {
        applicationContext = new FileSystemXmlApplicationContext("src/main/webapp/WEB-INF/appconfig-root.xml");
        userService = applicationContext.getBean(UserService.class);
        //userDAO = applicationContext.getBean(UserDAO.class);

    }

    @AfterEach
    void tearDown() {
        applicationContext.close();

    }

    @Test
    void saveAndDeleteTest() {

        int startRows, currentRows, afterDelete;
        user.setUsername("Test");
        user.setPassword("111");
        startRows = userService.findMaxId();
        userService.save(user);
        currentRows = userService.findMaxId();
        assertEquals(startRows + 1, currentRows);
        userService.findByUsername("Test");
        assertNotNull(user);
        assertEquals("Test", user.getUsername());
        userService.deleteById(user.getId());
        afterDelete = userService.findMaxId();
        assertEquals(startRows, afterDelete);

    }

    /*@Test
    void  addUserTest(){
        User user = new User();
        user.setUsername("Test");
        user.setPassword("111");
        userService.save(user);
        assertNotNull(user);
        assertEquals("Test", user.getUsername());
    }*/

    /*@Test
    void getMaxIdTest(){
        System.out.println("!!!!!!!! Current Rows = " + userService.findMaxId());
    }*/

    /*@Test
    void removeUserTestWithoutId(){
        applicationContext = new FileSystemXmlApplicationContext("src/main/webapp/WEB-INF/appconfig-root.xml");
        userService = applicationContext.getBean(UserService.class);
        userService.deleteById(3);
    }*/

    //@Test
    //@Transactional
    void removeUserTest(int id){
        userDAO.delete(id);
    }

    @Test
    void findMaxId(){
        userService.findMaxId();
    }

    @Test
    void findByUsernameTrue() {
        User user = userService.findByUsername("admin");
        assertNotNull(user);
        assertEquals("admin", user.getUsername());
    }

    @Test
    void findByUsernameFalse() {
        User user = userService.findByUsername("adminn");
        assertNull(user);
        //assertNotEquals("adminn", user.getUsername());
    }
}