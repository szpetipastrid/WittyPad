package hu.kovex.witty.plugin.community

import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH

import com.gmongo.GMongo
import hu.kovex.witty.plugin.core.converter.xml.XmlBeanLoader
import hu.kovex.witty.plugin.core.domain.WClass
import org.springframework.transaction.annotation.Transactional

class CommunityService {

    def beanLoader
    def mongo = new GMongo()
    def db = mongo.getDB("witty-dev")

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

    def saveCommunity(Map community) {
        db."${WClass.CLASS_COMMUNITY}".insert(community)
    }

    @Transactional(readOnly = true)
    Map getCommunity(def uri) {
        db."${WClass.CLASS_COMMUNITY}".findOne(["wproperties.prop_uri.value.all": uri]);
    }
}
