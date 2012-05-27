package hu.kovex.witty.plugin.core.converter.xml

import groovy.xml.MarkupBuilder
import hu.kovex.witty.plugin.core.converter.WXMLConverter

/**
 * Created by IntelliJ IDEA.
 * User: szpetip
 * Date: 4/2/12
 * Time: 10:04 AM
 */
class WClassXMLConverter implements WXMLConverter {
    def static final instance = new WClassXMLConverter()

    static WClassXMLConverter getConverter() {
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
        xml.wclass(clazzId: map.clazzId, lang: map.lang) {
            map.wproperties.each { id, attributes ->
                xml.wproperty(
                        id: id,
                        type: attributes.type,
                        readonly: attributes.readonly,
                        required: attributes.required) {
                    attributes.name.each { lang, value ->
                        xml.name(lang: lang, value)
                    }
                }
            }
        }
    }

    @Override
    Map toMap(Node node) {
        if ((node.name() as String).toLowerCase() != 'wclass') return [:]
        Map clazz = [
                clazzId: node."@clazzId",
                lang: node."@lang", wproperties: [:]]
        node.wproperty.each { propertyNode ->
            Map names = [:]
            propertyNode.name.each { value ->
                names += [("${value."@lang"}" as String): value.text()]
            }
            clazz.wproperties += [
                    ("${propertyNode."@id"}" as String): [type: propertyNode."@type",
                            readonly: propertyNode."@readonly" as boolean,
                            required: propertyNode."@required" as boolean,
                            name: names]
            ]
        }
        clazz
    }
}
