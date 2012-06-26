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
            def value
            /* all lang first for international and system properties */
            value = instance?.wproperties[property]?.value["all"]

            /* Requested language is the 2nd */
            value = value ?: instance?.wproperties[property]?.value[lang]

            /* English language is the 3nd */
            value = value ?: instance?.wproperties[property]?.value["en"]

            value

        } catch (Exception e) {
            null
        }
    }
}

class WProperty {
    WType type
    def value
}
