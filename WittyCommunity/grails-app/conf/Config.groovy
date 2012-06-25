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

// configuration for plugin testing - will not be included in the plugin zip

// set per-environment serverURL stem for creating absolute links
environments {
    production {
        grails.serverURL = "http://www.wittypad.com"
        grails.serverName = "wittypad.com"
    }
    development {
        //To run witty in development mode, you need to add some extra configuration line to your hosts file.
        //This is required because localhost is not accessible from other computers and the witty communities are
        //working with sub domains
        grails.serverURL = "http://wittypad.local:8088/${appName}"
        grails.serverName = "wittypad.local:8088/WittyCommunity"
        profile.images="/Users/szpetip/Projects/Witty/server-uploads/witties"
    }
    test {
        grails.serverURL = "http://localhost:8088/${appName}"
        grails.serverName = "localhost:8088"
    }
    demo {
        grails.app.context = "/"
        grails.serverURL = "http://wittypad.com"
        grails.gsp.enable.reload = true
        grails.serverName = "wittypad.com"
    }

}


log4j = {
    // Example of changing the log pattern for the default console
    // appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error 'org.codehaus.groovy.grails.web.servlet',  //  controllers
            'org.codehaus.groovy.grails.web.pages', //  GSP
            'org.codehaus.groovy.grails.web.sitemesh', //  layouts
            'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
            'org.codehaus.groovy.grails.web.mapping', // URL mapping
            'org.codehaus.groovy.grails.commons', // core / classloading
            'org.codehaus.groovy.grails.plugins', // plugins
            'org.springframework'

    warn 'org.mortbay.log'
}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"

grails.witty.plugin.community.defaultXml = "/hu/kovex/witty/plugin/community/defaults.xml"
