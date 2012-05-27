package hu.kovex.witty.plugin.community

class CommunityTagLib {
    static def namespace = "comm"

    def image = { attrs, body ->
        def communityName = attrs.community
        def alt = attrs.alt?: ""
        def size = attrs.size ?: "large"
        CommunityService communityService = new CommunityService()
        def community = communityService.getCommunity(communityName)
        switch (size) {
            case 'small':
                out << """<img src="${community?.wproperties?.image_small?.value?.all}" alt="${alt}"/>"""
                break;
            case 'large':
                out << """<img src="${community?.wproperties?.image_large?.value?.all}" alt="${alt}"/>"""
                break;
        }
    }

    def link = {attrs, body ->
        out << """http://${attrs.community}.${org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.serverName}"""
    }

    def tile = {attrs, body ->
        def communityName = attrs.community
        def size = attrs.size ?: "large"

        out << """
        <div></div>
        """

    }
}
