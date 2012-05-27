import grails.util.GrailsUtil
import hu.kovex.witty.plugin.community.CommunityService

class BootStrap {

    def init = { servletContext ->
        println """
        *************************************************************
        * Witty project is in early developlent stage.              *
        * Please, keep it in your mind, when you browse the source. *
        *************************************************************
        """

        switch (GrailsUtil.environment) {
            case "development":
                def communityService = new CommunityService()
                /* Generate community class and the default instance */
                communityService.getCommunityClass()
                communityService.getDefaultCommunity()

                def szpetipCommunity = [
                        wclass: "clazz_Community",
                        lang: "hu",
                        template: "community",
                        wproperties: [
                                prop_name: [value: [hu: "Szilágyi Peti, személyes", en: "Peter Szilagyi, personal"]],
                                prop_uri: [value: [all: "szpetip"]],
                                prop_description: [value: [hu: "Szilágyi Péter a Witty portál ötletgazdája és fejlesztője.",
                                        en: "Peter Szilagyi is the inventor and the developer of the witty portal."]],
                                image_small: [value:[all:"http://dl.dropbox.com/u/13371372/witty/szpetip/szpetip-logo-small.png"]],
                                image_large: [value:[all:"http://dl.dropbox.com/u/13371372/witty/szpetip/szpetip-logo-large.png"]],
                                html_css: [value:[all:"http://dl.dropbox.com/u/13371372/witty/szpetip/szpetip.css"]],
                                html_style: [value:[all:"""
                                body {
                                /* See szpetip.css */
                                }
                                """]]
                        ]
                ]
                communityService.saveCommunity(szpetipCommunity)
        }

    }
    def destroy = {
    }
}
