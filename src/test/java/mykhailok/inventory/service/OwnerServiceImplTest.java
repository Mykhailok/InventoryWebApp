package mykhailok.inventory.service;

import mykhailok.inventory.dao.OwnerDAO;
import mykhailok.inventory.model.Owner;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class OwnerServiceImplTest {

    private FileSystemXmlApplicationContext applicationContext;
    BigInteger startRows, currentRows, afterDelete;
    private Owner owner = new Owner();
    private Owner fromDB;
    private OwnerService ownerService;
    private OwnerDAO ownerDAO;

    @BeforeEach
    void setUp() {
        applicationContext = new FileSystemXmlApplicationContext("src/main/webapp/WEB-INF/appconfig-root.xml");
        ownerService = applicationContext.getBean(OwnerService.class);
    }

    @AfterEach
    void tearDown() {
        applicationContext.close();
    }

    @Test
    void addOwnerTest() {
        startRows = ownerService.countRow();
        owner.setFirstName("add_FirstName");
        owner.setLastName("add_LastName");
        ownerService.add(owner);
        fromDB = ownerService.get(owner.getId());
        assertNotNull(fromDB);
        assertEquals("add_FirstName", owner.getFirstName());
        assertEquals("add_LastName", owner.getLastName());
        currentRows = ownerService.countRow();
        assertEquals(startRows.add(BigInteger.valueOf(1)), currentRows);
    }

    @Test
    void getAllTest() {
        
        List<Owner> fromDBList = ownerService.getAllOwners();
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!! " + fromDBList.toString());
        assertEquals(ownerService.countRow(), BigInteger.valueOf(fromDBList.size()));
    }

    @Test
    void countRow() {
    }

    @Test
    void findByOwnerLastName() {
    }

}