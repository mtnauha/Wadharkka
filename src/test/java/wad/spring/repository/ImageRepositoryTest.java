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
import wad.spring.domain.Image;

/**
 *
 * @author mtnauha
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/spring-context-test.xml", "classpath:/spring-database-test.xml"})
public class ImageRepositoryTest {

    @Autowired
    ImageRepository imageRepository;

    public ImageRepositoryTest() {
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
        long countAtStart = imageRepository.count();

        Image i = new Image();
        i.setDescription("kuva");
        imageRepository.save(i);

        long countAtEnd = imageRepository.count();
        Assert.assertTrue("User count should be increased by one when adding an element.",
                countAtStart + 1 == countAtEnd);
    }
}
