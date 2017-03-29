package mykhailok.inventory.dao;

import mykhailok.inventory.dao.builder.OwnerBuilder;
import mykhailok.inventory.model.Owner;
import mykhailok.inventory.service.OwnerService;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;

import javax.xml.ws.Response;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.*;

class JpaGenericDAOImplTest {

   private Owner owner;


    AbstractDAO abstractDAO;


    private JpaGenericDAOImpl jpaGenericDAO;

    @BeforeEach
    void setUp() {
       abstractDAO = mock(AbstractDAO.class);
       owner = new Owner();
    }

    @AfterEach


    @Test
    void saveTest() throws Exception {

    }

    @Test
    void deleteTest() {
    }

    @Test
    void getTest() {
       owner.setId(BigInteger.valueOf(1));
       owner.setFirstName("set_firstName");
       owner.setLastName("set_lastName");

        when(abstractDAO.get(BigInteger.valueOf(1)))
                .thenReturn(new Owner(BigInteger.valueOf(1), "set_firstName", "set_lastName"));
        Owner found = (Owner) abstractDAO.get(BigInteger.valueOf(1));
        assertNotNull(found);
        assertEquals(BigInteger.valueOf(1), found.getId());
        assertEquals("set_firstName", found.getFirstName());
        assertEquals("set_lastName", found.getLastName());
    }

    @Test
    void getAllTest() {
        List<Owner> all = new ArrayList<>();
        all.add(new Owner(BigInteger.valueOf(1), "John", "Doe"));
        all.add(new Owner(BigInteger.valueOf(2),"Jane","Doe"));
        when(abstractDAO.getAll()).thenReturn(all);
        List result = abstractDAO.getAll();
        verify(abstractDAO).getAll();
    }

}