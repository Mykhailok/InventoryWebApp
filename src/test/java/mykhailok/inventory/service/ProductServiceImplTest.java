package mykhailok.inventory.service;

import mykhailok.inventory.dao.ProductDAO;
import mykhailok.inventory.model.Product;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class ProductServiceImplTest {

    private FileSystemXmlApplicationContext applicationContext;
    int startRows, currentRows, afterDelete;
    private Product product = new Product();
    private Product fromDB;
    private ProductService productService;
    private ProductDAO productDAO;

    @BeforeEach
    void setUp() {
        applicationContext = new FileSystemXmlApplicationContext("src/main/webapp/WEB-INF/appconfig-root.xml");
        productService = applicationContext.getBean(ProductService.class);
    }

    @AfterEach
    void tearDown() {
        applicationContext.close();
    }

    @Test
    void addTest() {
        startRows = productService.findMaxId();
        product.setName("add_Test");
        product.setProductDescription("add_Description");
        product.setProductManufacturer("add_Manufacturer");
        product.setPrice(111);
        productService.add(product);
        fromDB = productService.get(product.getId());
        assertNotNull(fromDB);
        assertEquals("add_Test", product.getName());
        assertEquals("add_Description", product.getProductDescription());
        assertEquals("add_add_Manufacturer", product.getProductManufacturer());
        assertEquals(111, product.getPrice());
        currentRows = productService.findMaxId();
        assertEquals(startRows + 1, currentRows);
    }

    @Test
    void updateTest() {
        product.setName("Test_Update");
        product.setProductDescription("Description_Update");
        product.setProductManufacturer("Manufacturer_Update");
        product.setPrice(222);
        productService.add(product);
        fromDB = productService.get(product.getId());
        assertNotNull(fromDB);
        assertEquals("Test_Update", product.getName());
        assertEquals("Description_Update", product.getProductDescription());
        assertEquals("Manufacturer_Update", product.getProductManufacturer());
        assertEquals(222, product.getPrice());
    }

    void deleteTest() {
        System.out.println("!!!!!!!!!!!!!!!!!!!!" + productService.findMaxId());
        productDAO.delete(productService.findMaxId()+1);
    }

    //@Test
    void findMaxId(){
        System.out.println("!!!!!!!!!!!!!!!!!!!! MAX" + productService.findMaxId());
        System.out.println("!!!!!!!!!!!!!!!!!!!! CURRENT" + currentRows);
    }

    @Test
    void getTest() {
        fromDB = productService.get(1);
        assertNotNull(fromDB);
        assertEquals("Test", fromDB.getName());
        assertEquals("User", fromDB.getOwner());
        assertEquals("Description", fromDB.getProductDescription());
        assertEquals("Manufacturer", fromDB.getProductManufacturer());
        assertEquals(100, fromDB.getPrice());
    }

    @Test
    void getAllTest() {
        List<Product> fromDBList = productService.getAll();
        assertEquals(productService.findMaxId(), fromDBList.size());
    }

}