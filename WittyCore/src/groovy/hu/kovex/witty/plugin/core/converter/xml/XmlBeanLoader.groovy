package hu.kovex.witty.plugin.core.converter.xml

import hu.kovex.witty.plugin.core.converter.WConverter

/**
 * Created by IntelliJ IDEA.
 * User: szpetip
 * Date: 4/7/12
 * Time: 12:30 PM
 */
class XmlBeanLoader {
    static final def converters = [wclass: WClassXMLConverter.converter, winstance: WInstanceXMLConverter.converter]

    URI uri
    Map beans

    XmlBeanLoader() { }

    XmlBeanLoader(String uri) {
        this.uri = getClass().getResource(uri).toURI()
        reload()
    }

    /**
     * Load xml from the given uri and convert the xml content to map-based representation of the classes.
     * @param uri URI of the xml document to process.
     * @return Map with the map-based representation of the classes.
     */
    def loadXml(URI uri) {
        loadXml(new XmlParser().parse(new File(uri)))
    }

    /**
     * Convert the xml content to map-based representation of the classes.
     * @param source String, contains the xml-based representation of the classes.
     * @return Map with the map-based representation of the classes.
     */
    def loadXml(String source) {
        loadXml(new XmlParser().parseText(source))
    }

    /**
     * Load xml and convert the xml content to map-based representation of the classes.
     * @param node Xml node to convert map-based.
     * @return Map with the map-based representation of the classes.
     */
    def loadXml(Node node) {
        node.bean.each { Node bean ->
            Node objXml = bean.children().first() as Node
            def value
            switch (objXml.name().toString().toLowerCase()) {
                case "wclass":
                    value = (converters.wclass as WConverter).toMap(objXml)
                    break
                case "winstance":
                    value = (converters.winstance as WConverter).toMap(objXml)
                    break
            }
            def key = "${bean."@id"}".toString()
            beans[key] = value
        }
        beans
    }

    /**
     * Reload the object from the source, if that is an uri
     * @throws IllegalStateException Exception threw, when the source isn't an uri
     */
    void reload() {
        if (uri == null) throw new IllegalStateException("method reload() can be applied to uri source")
        beans = [:]
        loadXml(uri)
    }

    /**
     * Return the requested bean by id
     * @param id Defined identifier in the xml file
     * @return Bean defined in the xml, converted to map format
     */
    def get(String id) {
        beans[id]
    }
}


