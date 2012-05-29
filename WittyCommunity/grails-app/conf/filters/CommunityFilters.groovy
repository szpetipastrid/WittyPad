package filters

import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH

import hu.kovex.witty.plugin.community.CommunityService

class CommunityFilters {

    public static def reservedSubDomains = [
            'www', /* www can't be sub domain */
    ]

    /*
        Layout names are reserved sub domains too
     */
    public static def layouts = [
            'm', 'mobile', /* Mobile layout */
            't', 'tab', 'tablet', /* Tablet layout */
            'd', 'desktop' /* Desktop layout, default */
    ]


    def filters = {
        subDomain(uri: "/**") {
            before = {
                def domainName = (request.getRequestURL() as String).substring(7)
                def domainIndex = domainName.indexOf(CH.config.grails.serverName as String)
                def subDomain = null
                def layout = null
//                assert domainIndex >= 0
                if (domainIndex > 0) {
                    def subDomainCandidate = domainName.substring(0, domainIndex - 1).toLowerCase()

                    if (layouts.contains(subDomainCandidate)) {
                        //This is not a sub domain, it's a layout definition
                        layout = subDomainCandidate
                    } else if (!reservedSubDomains.contains(subDomainCandidate)) {
                        //This is a real sub domain, but may contains layout information
                        layouts.each {
                            if (subDomainCandidate.startsWith("${it}.")) {
                                layout = it
                                subDomain = subDomainCandidate.substring(it.length() + 1)
                            }
                        }
                        if (layout == null) {
                            layout = 'desktop'
                            subDomain = subDomainCandidate
                        }
                    }
                }
                if (layout == null) layout = "desktop"
                request.setAttribute("layout", layout)
                request.setAttribute("subDomain", subDomain)
                def community = new CommunityService().getCommunity(subDomain)
                request.setAttribute("community", community)

            }
        }
    }

}
