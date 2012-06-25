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

package hu.kovex.witty.plugin.community

import org.springframework.validation.Errors
import grails.converters.JSON
import hu.kovex.witty.plugin.core.domain.WInstance

class CommunityController {
    CommunityService communityService

    def index = {
        redirect action: "home"
    }

    def home = {
        def witty = request.getAttribute("witty")
        if ( witty == null ||  WInstance.prop(witty, "prop_status", "all") =="new" ) {
            forward action: "community_error"
        }
    }

    def tile = {
        def communityName = params.community
        CommunityService communityService = new CommunityService()
        def community = communityService.getCommunity(communityName)
        def id = "tileLink${new Date().time}"
        def size = params.size ?: "small"
        def tileClass = "${size}_tile"
        def image = sh.winstance(obj: community, val: "image_${size}")
        def title = sh.winstance(obj: community, val: "prop_name")
        def link = """http://${params.community}.${org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.serverName}?lang=${request.getAttribute('selectedLang')}"""
        [id: id, tileClass: tileClass, image: image, title: title, link: link, community: community]
    }

    def create = {
        [community: new CommunityCreateCommand()]
    }

    def community_error = {
        def witty = request.getAttribute("witty")
        String msg = ""

        if ( witty == null ) {
            msg= ":-( Requested witty is not avaiable yet!"
        } else if ( WInstance.prop(witty, "prop_status", "all") =="new" ) {
            msg= ":-( Requested witty is not activated"
        }
        [message:msg]

    }

    def validate_property = {
        def property = params.property
        def value = params.value
        def result = null
        if (property == "name") {
            result = CommunityTitleValidator.validate(value)
        } else if (property == "address") {
            result = CommunityAddressValidator.validate(value)
        }
        if (result) {
            [resultMessage: message(code: result)]
        } else {
            [resultMessage: ""]
        }
    }

    def save_property = {
        println "REQUESTED"
        def saveProperty = new SavePropertyCommand()
        bindData(saveProperty, params)
        def r;
        String validationResult = saveProperty.validate()
        if (validationResult) {
            r = [result: [status: "error", message: message(code: validationResult)]]
        } else {
            try {

                communityService.saveProperty(saveProperty.address, saveProperty.property, saveProperty.value)
                r = [result: [status: "success"]]
            } catch (Exception ex) {
                r = [result: [status: "error", message: ex.getMessage()]]
            }

        }
        render r as JSON

    }

    def save = {
        def community = new CommunityCreateCommand()
        bindData(community, params)
        println "Community: ${community}"
        if (community.validate()) {
            communityService.saveCommunity(community.toMap())
            def r = [result: [status: "success"]]
            render r as JSON
        } else {
            def r = [result: [status: "error", messsage: community.errors]]
            render r as JSON
        }
    }

    def delete = {
        println "DELETE"
        def address = params.id
        communityService.delete(address)
        def r = [result: [status: "success"]]
        render r as JSON
    }
}
class CommunityCreateCommand {
    String lang = "en"
    String name
    String address
    Errors errors

    boolean validate() {
        def titleResult = CommunityTitleValidator.validate(name)
        if (titleResult) errors.rejectValue("name", titleResult)

        def addressResult = CommunityAddressValidator.validate(address)
        if (addressResult) errors.rejectValue("address", addressResult)
        !(titleResult || addressResult)
    }

    Map toMap() {
        [wclass: "clazz_Community",
                en: lang,
                template: "community",
                wproperties: [
                        prop_name: [value: [en: name]],
                        prop_uri: [value: [all: address]],
                        prop_status: [value: [all: "new"]],
                        prop_created: [value: [all: new Date()]],
                        prop_owner: [value: [all: "szpetip"]]
                ]
        ]
    }

    String toString() {
        toMap() as String
    }
}

class SavePropertyCommand {
    String address
    String property
    String value

    String validate() {
        switch (property) {
            case "prop_name":
                return CommunityTitleValidator.validate(value)
                break
            case "prop_uri":
                return CommunityAddressValidator.validate(value)
                break
            case "prop_description":
                return CommunityDescriptionValidator.validate(value)
                break
        }
        null
    }

}