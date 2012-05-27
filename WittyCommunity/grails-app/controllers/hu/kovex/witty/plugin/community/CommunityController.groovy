package hu.kovex.witty.plugin.community

import grails.converters.XML

class CommunityController {

    def index = {
        forward action: "home"
    }

    def home = {
    }

    def pluginInfo = {
        render """

        """ as XML
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
            [type:'community', visibility:'community']
    }

    def validate_uri = {
        def communityUri = params.uri
        def result = CommunityURIValidator.validate(communityUri)
        def id = "tipsy${new Date().time}"
        def msg
        switch (result) {
            case 'regexp':
                msg = message(code: "witty.plugin.community.create.wizard.step.1.community.address.valid.regexp")
                break
            case 'length':
                msg = message(code: "witty.plugin.community.create.wizard.step.1.community.address.valid.length")
                break
            case 'prohibited':
                msg = message(code: "witty.plugin.community.create.wizard.step.1.community.address.valid.prohibited")
                break
            case 'valid':
            default:
                msg = message(code: "witty.plugin.community.create.wizard.step.1.community.address.valid.valid")
        }
        [id: id, result: result, resultMessage: msg]
    }
}
