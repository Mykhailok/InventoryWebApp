package mykhailok.inventory.service;

import mykhailok.inventory.dao.ProductDAO;
import mykhailok.inventory.model.Owner;
import mykhailok.inventory.model.Product;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import java.math.BigInteger;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class ProductServiceImplTest {

    private FileSystemXmlApplicationContext applicationContext;
    BigInteger startRows, currentRows, afterDelete;
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
        product.setProductName("add_Test");
        product.setOwner_id(BigInteger.valueOf(1));
        product.setProductDescription("add_Description");
        product.setProductManufacturer("add_Manufacturer");
        product.setPrice(111);
        productService.add(product);
        fromDB = productService.getById(product.getId());
        assertNotNull(fromDB);
        assertEquals("add_Test", product.getProductName());
        assertEquals("add_Description", product.getProductDescription());
        assertEquals("add_Manufacturer", product.getProductManufacturer());
        assertEquals(111, product.getPrice());
        currentRows = productService.findMaxId();
        assertEquals(startRows.add(BigInteger.valueOf(1)), currentRows);
    }

    @Test
    void updateTest() {
        product.setProductName("Test_Update");
        product.setProductDescription("Description_Update");
        product.setProductManufacturer("Manufacturer_Update");
        product.setPrice(222);
        productService.add(product);
        fromDB = productService.getById(product.getId());
        assertNotNull(fromDB);
        assertEquals("Test_Update", product.getProductName());
        assertEquals("Description_Update", product.getProductDescription());
        assertEquals("Manufacturer_Update", product.getProductManufacturer());
        assertEquals(222, product.getPrice());
    }

    void deleteTest() {
        System.out.println("!!!!!!!!!!!!!!!!!!!!" + productService.findMaxId());
        productDAO.delete(productService.findMaxId().add(BigInteger.valueOf(1)));
    }

    @Test
    void findMaxId(){
        System.out.println("!!!!!!!!!!!!!!!!!!!! MAX" + productService.findMaxId());
        System.out.println("!!!!!!!!!!!!!!!!!!!! CURRENT" + currentRows);
    }

    @Test
    void getByIdTest() {
        fromDB = productService.getById(BigInteger.valueOf(1));
        assertNotNull(fromDB);
        assertEquals("Notebook", fromDB.getProductName());
        assertEquals(BigInteger.valueOf(1), fromDB.getOwner_id());
        assertEquals("Black", fromDB.getProductDescription());
        assertEquals("Asus", fromDB.getProductManufacturer());
        assertEquals(100, fromDB.getPrice());
    }

    @Test
    void getAllTest() {
        List<Product> fromDBList = productService.getAllProducts();
        System.out.println("@@@@@@@@@@@@@@@@@@@@@ " + fromDBList.toString());
        for (Product p : fromDBList){
            System.out.println("!!!!!!!!!!!!!!!!!!!!!!!! " + p);
        }
        assertEquals(productService.findMaxId(), BigInteger.valueOf(fromDBList.size()));
    }

}