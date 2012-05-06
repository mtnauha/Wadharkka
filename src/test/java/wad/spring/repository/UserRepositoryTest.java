/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package wad.spring.repository;

import org.junit.*;
import static org.junit.Assert.*;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import wad.spring.domain.Image;
import wad.spring.domain.User;

/**
 *
 * @author mtnauha
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/spring-context-test.xml", "classpath:/spring-database-test.xml"})
public class UserRepositoryTest {

    @Autowired
    UserRepository userRepository;

    public UserRepositoryTest() {
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

    @Test
    public void createIncrementsElementCountByOne() {
        long countAtStart = userRepository.count();

        User u = new User();
        u.setUsername("matti");
        u.setPassword("passw");
        userRepository.save(u);

        long countAtEnd = userRepository.count();
        Assert.assertTrue("User count should be increased by one when adding an element.",
                countAtStart + 1 == countAtEnd);
    }

    @Test
    public void createAddsUserWithName() {

        User u = new User();
        u.setUsername("seppo");
        u.setPassword("passw");
        userRepository.save(u);

        Assert.assertTrue("User repository should have user called seppo", userRepository.findByUsername("seppo") != null);
    }
}
