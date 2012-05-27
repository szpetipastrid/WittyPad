package hu.kovex.witty.plugin.community

import javax.imageio.ImageIO
import java.awt.image.BufferedImage
import java.awt.geom.AffineTransform
import java.awt.image.AffineTransformOp

/**
 * Created by IntelliJ IDEA.
 * User: szpetip
 * Date: 5/16/12
 * Time: 9:11 PM
 */
class CommunityImageGenerator {
    static final Map IMAGE_SMALL = [width: 155, height: 100]
    static final Map IMAGE_LARGE = [width: 320, height: 320]


    Map generateCommunityImages(InputStream source) {
        BufferedImage image = ImageIO.read(source)
        BufferedImage smallImage = transformImage(image, IMAGE_SMALL)
        BufferedImage largeImage = transformImage(image, IMAGE_LARGE)
        [small: smallImage, large: largeImage]
    }

    def transformImage(BufferedImage image, Map params) {
        def requiredWidth = params.width
        def requiredHeight = params.height
        double requiredRatio = requiredWidth / requiredHeight
        def ratio = image.width / image.height
        double scale

        if (ratio > requiredRatio) {
            scale = requiredHeight / image.height
        } else if (ratio < requiredRatio) {
            scale = requiredWidth / image.width
        } else {
            scale = requiredWidth / image.width
        }
        println "Scale to ${scale}"
        BufferedImage after = new BufferedImage(Math.round(scale * image.width) as Integer, requiredHeight, BufferedImage.TYPE_INT_ARGB);
        AffineTransform at = new AffineTransform();
        at.scale(scale, scale);
        AffineTransformOp scaleOp = new AffineTransformOp(at, AffineTransformOp.TYPE_NEAREST_NEIGHBOR);
        scaleOp.filter(image, after);
        cropImage(after, requiredRatio)
    }

    BufferedImage cropImage(BufferedImage src, double requiredRatio) {
        def ratio = src.width / src.height
        println "RATIO: ${requiredRatio}"
        if (ratio > requiredRatio) {
            //Image is wider
            Integer width = (src.height * requiredRatio)
            Integer left = (src.width - width) / 2
            println "Width: ${width}, left: ${left}, size: ${src.width}x${src.height}"
            src.getSubimage(left, 0, width, src.height);
        } else if (ratio > requiredRatio) {
            //Image is higher
            Integer height = (src.width * requiredRatio)
            Integer top = (src.height - height) / 2
            src.getSubimage(0, top, src.width, height);
        } else {
            src
        }
    }
}
