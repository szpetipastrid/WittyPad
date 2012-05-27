package hu.kovex.witty.plugin.core.converter

import groovy.xml.MarkupBuilder

/**
 * Created by IntelliJ IDEA.
 * User: szpetip
 * Date: 4/7/12
 * Time: 2:06 PM
 */
interface WConverter<T> {
    /**
     * Convert from source format to map format
     * @param source
     * @return
     */

    Map toMap (T source)
}

interface WXMLConverter extends WConverter<Node> {

    String toXML(Map source)

    String toXML(MarkupBuilder xml, Map map)
}