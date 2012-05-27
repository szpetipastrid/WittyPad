package hu.kovex.witty.plugin.core

import hu.kovex.witty.plugin.core.domain.WInstance

class ShortenerTagLib {
  static namespace = "sh"

    def winstance = { attrs, body ->
        Map instance = attrs.obj
        String property = attrs.val
        String lang = attrs.lang ?: request.getAttribute("selectedShortLang")
        out << WInstance.prop(instance, property, lang)
    }
}
