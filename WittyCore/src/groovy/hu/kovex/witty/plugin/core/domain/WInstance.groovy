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
        def allLang = instance?.wproperties[property]?.value["all"]
        allLang?: instance?.wproperties[property]?.value[lang]
    }
}

class WProperty {
    WType type
    def value
}
