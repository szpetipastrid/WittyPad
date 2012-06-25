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

package hu.kovex.witty.plugin.core.domain

/**
 * Created by IntelliJ IDEA.
 * User: szpetip
 * Date: 3/31/12
 * Time: 9:24 PM
 */
class WInstance {
    String clazz
    String lang
    Map<String, List<WProperty>> properties

    static def prop(Map instance, String property, String lang) {
        try {
            def allLang = instance?.wproperties[property]?.value["all"]
            allLang ?: instance?.wproperties[property]?.value[lang]
        } catch (Exception e) {
            null
        }
    }
}

class WProperty {
    WType type
    def value
}
