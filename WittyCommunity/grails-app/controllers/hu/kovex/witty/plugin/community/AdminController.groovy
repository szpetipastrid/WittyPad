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

import hu.kovex.witty.plugin.core.domain.WInstance

class AdminController {
    CommunityService communityService

    def index = {
        def subDomain = request.getAttribute("subDomain")
        subDomain = subDomain == null ? null : subDomain as String
        if (subDomain == null) {
            forward action: "admin_home"
        } else {
            forward action: "admin_witty"
        }

    }

    def admin_home = {

    }

    def overview = {
//        if (WInstance.prop(request.getAttribute("witty"), 'prop_status', 'all') == "new") {
//            forward action: "getting_started"
//        }

    }

    def admin_witty = {
    }

    def wittyList = {
        def wittyList = communityService.listCommunities()
        [wittyList: wittyList]
    }

    def my_interests = {

    }

    def getting_started = {

    }

    def settings_basic = {

    }

    def settings_others = {

    }
}
