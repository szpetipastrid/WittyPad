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

import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH

import com.gmongo.GMongo
import hu.kovex.witty.plugin.core.converter.xml.XmlBeanLoader
import hu.kovex.witty.plugin.core.domain.WClass

class CommunityService {
    static def transactional = false
    def beanLoader
    static def mongo = new GMongo()
    static def db = mongo.getDB("witty-dev")

    CommunityService() {
        beanLoader = new XmlBeanLoader(CH.config.grails.witty.plugin.community.defaultXml)
    }

    Map getCommunityClass() {
        def community = db."${"WClasses"}".findOne(["clazzId": WClass.CLASS_COMMUNITY]);
        if (!community) {
            community = beanLoader.get("Community")
            println community.toString()
            db.WClasses.insert(community)
        }
        community
    }

    Map getDefaultCommunity() {
        def defCommunity = getCommunity("witty")
        if (!defCommunity) {
            defCommunity = beanLoader.get("WittyCommunity")
            db."${WClass.CLASS_COMMUNITY}".insert(defCommunity)
        }
        defCommunity
    }

    def loadFromDefaultAndSave(String name) {
        saveCommunity(beanLoader.get(name))
    }

    def delete(String address) {
        db."${WClass.CLASS_COMMUNITY}".remove(["wproperties.prop_uri.value.all": address]);
    }

    def saveCommunity(Map community) {
        db."${WClass.CLASS_COMMUNITY}".insert(community)
    }

    def saveProperty(String address, String property, String value) {
        def scope = "en"
        if (property in ['prop_uri', 'prop_profimage', 'prop_created', 'prop_owner', 'prop_status', 'prop_access']) {
            scope = "all"
        }


        db."${WClass.CLASS_COMMUNITY}".update(["wproperties.prop_uri.value.all": address], ["\$set": ["wproperties.${property}.value.${scope}": value]])
        //db.users.update({"_id" : ObjectId("4b253b067525f35f94b60a31")}, ... {"$set" : {"favorite book" : "war and peace"}})
    }

    Map getCommunity(def uri) {
        db."${WClass.CLASS_COMMUNITY}".findOne(["wproperties.prop_uri.value.all": uri]);
    }

    List listCommunities() {
        List result = []
        db."${WClass.CLASS_COMMUNITY}".find().each {
            result << it
        }
        result
    }
}
