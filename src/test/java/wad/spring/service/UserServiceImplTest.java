/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package wad.spring.service;

import java.util.List;
import org.junit.*;
import static org.junit.Assert.*;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import wad.spring.domain.User;

/**
 *
 * @author mtnauha
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/spring-context-test.xml", "classpath:/spring-database-test.xml"})
public class UserServiceImplTest {

    @Autowired
    private UserService userService;

    public UserServiceImplTest() {
    }

    @BeforeClass
    public static void setUpClass() throws Exception {
    }

    @AfterClass
    public static void tearDownClass() throws Exception {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of addUser method, of class UserServiceImpl.
     */
    @Test
    public void testAddUser() {
        System.out.println("addUser");
        User user = new User();
        user.setUsername("useri");
        boolean expResult = true;
        boolean result = userService.addUser(user);
        assertEquals(expResult, result);
    }

    /**
     * Test of listUsers method, of class UserServiceImpl.
     */
    @Test
    public void testListUsers() {
        System.out.println("listUsers");
        List<User> result = userService.listUsers();
        for (User u : result) {
            System.out.println(u.getUsername());
        }
        Assert.assertTrue(result.size() >= 0);
    }

    /**
     * Test of getUser method, of class UserServiceImpl.
     */
    @Test
    public void testGetUser() {
        System.out.println("getUser");

        User user = new User();
        user.setUsername("user0");
        userService.addUser(user);

        User userZero = userService.getUser("user0");
        Assert.assertEquals("user0", userZero.getUsername());
    }
}
