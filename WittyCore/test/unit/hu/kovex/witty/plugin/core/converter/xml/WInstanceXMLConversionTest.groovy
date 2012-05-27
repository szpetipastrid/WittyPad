package hu.kovex.witty.plugin.core.converter.xml

import org.junit.Test

/**
 * Created by IntelliJ IDEA.
 * User: szpetip
 * Date: 5/4/12
 * Time: 10:30 PM
 */
class WInstanceXMLConversionTest {
    def xml
    WInstanceXMLConverter converter

    static def XML_SAMPLE = """
        <winstance wclass='clazz_Community' lang='hu' template='community'>
            <wproperty id='prop_name'>
                <value lang='hu'>WebGlossary</value>
                <value lang='en'>WebGlossary</value>
            </wproperty>
            <wproperty id='prop_uri'>
                <value lang='hu'>www</value>
                <value lang='en'>www</value>
            </wproperty>
            <wproperty id='prop_description'>
                <value lang='hu'>A WebGlossary építők lelkes közössége</value>
                <value lang='en'>Community of the WebGlossary builders</value>
            </wproperty>
        </winstance>
    """

    static def wInstance = [
            wclass: "clazz_Community",
            lang: "hu",
            template: "community",
            wproperties: [
                    prop_name: [value: [hu: "WebGlossary", en: "WebGlossary"]],
                    prop_uri: [value: [hu: "www", en: "www"]],
                    prop_description: [value: [hu: "A WebGlossary építők lelkes közössége", en: "Community of the WebGlossary builders"]]
            ]
    ]

    protected void setUp() {
        println "Setting up Converter..."
        xml = new XmlParser().parseText(XML_SAMPLE)
        assert xml.name() as String == 'winstance': "Root element of the xml must be 'wclass'!"

        println "Getting converter instance..."
        converter = WInstanceXMLConverter.getConverter()
        assert converter != null: "Converter instance cannot be null!"

        println "Converting xml document to map-based representation"
    }

    @Test
    void testToMap() {
        Map m = converter.toMap(xml)
        assert m.size() == 4    //wclass, language, template, wproperties

        println "Checking map-based representation..."
        assert m.wclass == "clazz_Community"
        assert m.lang == "hu"
        assert m.wproperties.size() == 3    //prop_name, prop_uri, prop_description
        assert m.wproperties.prop_name instanceof Map
    }

    @Test
    void testToXML() {
        println "Convert map-based representation to xml-based..."
        println "Convert sample to xml..."
        def xml = new XmlParser().parseText(converter.toXML(wInstance))
        assert xml.name().toString() == "winstance"
        assert xml.wproperty.size() == 3
    }

    @Test
    void testCompareRepresentations() {
        println "Compare xml- and map-based representations..."
        Map m = converter.toMap(xml)
        assert m.toString() == wInstance.toString()
    }

    @Test
    void testConversionViceVersa() {
        println "Convert map-based representation to xml-based and back, result must be identical..."
        println "Convert sample to xml..."
        def xml = converter.toXML(wInstance)
        println "Convert xml to map..."
        def convertedMap = converter.toMap(new XmlParser().parseText(xml))
        println "Checking result..."
        assert wInstance.toString() == convertedMap.toString()
    }
}
