package hu.kovex.witty.plugin.community;

import grails.test.GrailsUnitTestCase
import org.junit.Test
import org.codehaus.groovy.tools.shell.IO
import javax.imageio.ImageIO;

/**
 * Created by IntelliJ IDEA.
 * User: szpetip
 * Date: 5/16/12
 * Time: 9:58 PM
 */
public class CommunityImageGeneratorTest extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    @Test
    void testImageGeneration() {
        CommunityImageGenerator generator = new CommunityImageGenerator()
//        Map images = generator.generateCommunityImages(new FileInputStream("D:\\Dropbox\\Images\\aurora-wallpapers_14803_1920x1200.jpg"))
//        Map images = generator.generateCommunityImages(new FileInputStream("D:\\Pictures\\ny\\P1020913.jpg"))
//        Map images = generator.generateCommunityImages(new FileInputStream("D:\\Pictures\\ny\\P1020748.jpg"))
        Map images = generator.generateCommunityImages(new FileInputStream("D:\\Pictures\\DCIM\\IMG_0004.jpg"))



//        Map images = generator.generateCommunityImages(new FileInputStream("D:\\Dropbox\\t3.png"))


        images*.value.each {
            println "${it.width} x ${it.height}"
            ImageIO.write(it,"png",new File("D:\\Temp\\${new Date().time}${it.width}.png"))
        }


    }
}
