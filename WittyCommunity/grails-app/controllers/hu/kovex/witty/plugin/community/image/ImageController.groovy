/*
 * Copyright (c) 2012. Witty Project.
 * Peter Szilagyi
 * szpetip@gmail.com
 *
 * Witty is a a knowledge-management, open source community portal.
 * Witty is available under the http://wittypad.com.
 * Witty is a free software distributed under the GNU General Public Licence.
 * Witty and WittyPad are the name of the software, please do not use it to other purposes.
 */



package hu.kovex.witty.plugin.community.image

import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH

import hu.kovex.witty.plugin.community.CommunityImageGenerator
import java.awt.image.BufferedImage
import javax.imageio.ImageIO

class ImageController {

    def index = {
        try {
            ImageCommand image = new ImageCommand()
            bindData(image, params)
            response.setHeader("Content-disposition", "attachment; filename=${image.file}")
            response.contentType = "image/png" //'image/jpeg' will do too
            ImageIO.write(image.image, "png", response.outputStream)
//            response.outputStream << image.imag
            response.outputStream.flush()
        } finally {
            response.outputStream.close()
        }
    }
}

class ImageCommand {
    CommunityImageGenerator imageGenerator = new CommunityImageGenerator()
    String file
    Integer width
    Integer height

    BufferedImage getImage() {
        def root = CH.config.profile.images as String
//        new File("${root}/${file}").bytes
//        def root = CH.config.profile.images as String
        def source = new File("${root}/${file}")
        BufferedImage img
        try {
            /* TODO: This code causes Too many open files exception on Mac OSX, but works well on other OS */
            img = ImageIO.read(source)
        } finally {
        }
        imageGenerator.transformImage(img, [width: width, height: height])
    }
}
