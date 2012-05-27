package hu.kovex.witty.plugin.core.converter.xml

import groovy.xml.MarkupBuilder
import hu.kovex.witty.plugin.core.converter.WXMLConverter

/**
 * Created by IntelliJ IDEA.
 * User: szpetip
 * Date: 4/2/12
 * Time: 9:50 AM
 */
class WInstanceXMLConverter implements WXMLConverter {
    def static final instance = new WInstanceXMLConverter()

    static WInstanceXMLConverter getConverter() {
        instance
    }

    @Override
    String toXML(Map map) {
        def sw = new StringWriter()
        def xml = new MarkupBuilder(sw)
        toXML(xml, map)
        sw
    }

    @Override
    String toXML(MarkupBuilder xml, Map map) {
        xml.winstance(wclass: map.wclass, lang: map.lang, template: map.template) {
            map.wproperties.each { id, attributes ->
                xml.wproperty(id: id) {
                    attributes.value.each { lang, value ->
                        xml.value(lang: lang, value)
                    }
                }
            }
        }
    }

    @Override
    Map toMap(Node node) {
        if ((node.name() as String).toLowerCase() != 'winstance') return [:]
        Map instance = [wclass: node."@wclass", lang: node."@lang", template: node."@template", wproperties: [:]]
        node.wproperty.each { propertyNode ->
            Map values = [:]
            propertyNode.value.each { value ->
                values += [("${value."@lang"}" as String): value.text()]
            }
            instance.wproperties += [("${propertyNode."@id"}" as String): [value: values]]
        }
        instance
    }
}
