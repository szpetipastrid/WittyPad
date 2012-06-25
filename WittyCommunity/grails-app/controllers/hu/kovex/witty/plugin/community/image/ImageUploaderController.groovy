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

import uk.co.desirableobjects.ajaxuploader.AjaxUploaderService
import javax.servlet.http.HttpServletRequest
import grails.converters.JSON
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.MultipartFile
import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH


class ImageUploaderController {
    AjaxUploaderService ajaxUploaderService

    def index = { }


    def saveProfileImage = {
        try {
            def root = CH.config.profile.images as String
            String fileName = "witty.profile.${new Date().time}.${request.getParameter("qqfile")}"
            File uploaded = new File("${root}/${fileName}")
            println "${uploaded.getAbsolutePath()} saved"
            InputStream inputStream = selectInputStream(request)
            ajaxUploaderService.upload(inputStream, uploaded)
            println "...save completed!"
            return render (text: [success: true,result:[status:"success", file:fileName]] as JSON, contentType: 'text/json')

        } catch (Exception e) {
            log.error("Failed to upload file.", e)
            return render(text: [success: false] as JSON, contentType: 'text/json')

        }
    }

    private InputStream selectInputStream(HttpServletRequest request) {
        if (request instanceof MultipartHttpServletRequest) {
            MultipartFile uploadedFile = ((MultipartHttpServletRequest) request).getFile('qqfile')
            return uploadedFile.inputStream
        }
        return request.inputStream
    }

}
