package hu.kovex.witty.plugin.core.converter.xml

import org.junit.Test

/**
 * Created by IntelliJ IDEA.
 * User: szpetip
 * Date: 5/4/12
 * Time: 10:30 PM
 */
class WClassXMLConverterTest {
    def xml
    WClassXMLConverter converter

    static def XML_SAMPLE = """
        <wclass clazzId='clazz_Community' lang='en'>
            <wproperty id='prop_name' type='name' readonly='true' required='true'>
                <name lang='hu'>név</name>
                <name lang='en'>name</name>
            </wproperty>
            <wproperty id='prop_uri' type='text' readonly='true' required='true'>
                <name lang='hu'>uri</name>
                <name lang='en'>uri</name>
            </wproperty>
            <wproperty id='prop_description' type='text' readonly='false' required='false'>
                <name lang='hu'>leírás</name>
                <name lang='en'>description</name>
            </wproperty>
        </wclass>
    """

    static def wClass = [
            clazzId: "clazz_Community",
            lang: "en",
            wproperties: [
                    prop_name: [
                            type: "name",
                            readonly: true,
                            required: true,
                            name: [hu: "név", en: "name"]
                    ],
                    prop_uri: [
                            type: "text",
                            readonly: true,
                            required: true,
                            name: [hu: "uri", en: "uri"]
                    ],
                    prop_description: [
                            type: "text",
                            readonly: true,
                            required: true,
                            name: [hu: "leírás", en: "description"]]
            ]
    ]

    protected void setUp() {
        println "Setting up Converter..."
        xml = new XmlParser().parseText(XML_SAMPLE)
        assert xml.name() as String == 'wclass': "Root element of the xml must be 'wclass'!"

        println "Getting converter instance..."
        converter = WClassXMLConverter.getConverter()
        assert converter != null: "Converter instance cannot be null!"

        println "Converting xml document to map-based representation"
    }

    @Test
    void testToMap() {
        Map m = converter.toMap(xml)
        assert m.size() == 3    //clazzId, lang, wproperties

        println "Checking map-based representation..."
        assert m.clazzId == "clazz_Community"
        assert m.lang == "en"
        assert m.wproperties.size() == 3    //prop_name, prop_uri, prop_description
        assert m.wproperties.prop_name instanceof Map
    }

    @Test
    void testToXML() {
        println "Convert map-based representation to xml-based..."
        println "Convert sample to xml..."
        def xml = new XmlParser().parseText(converter.toXML(wClass))
        assert xml.name().toString() == "wclass"
        assert xml.wproperty.size() == 3

    }

    @Test
    void testCompareRepresentations() {
        println "Compare xml- and map-based representations..."
        Map m = converter.toMap(xml)
        assert m.toString() == wClass.toString()
    }

    @Test
    void testConversionViceVersa() {
        println "Convert map-based representation to xml-based and back, result must be identical..."
        println "Convert sample to xml..."
        def xml = converter.toXML(wClass)
        println "Convert xml to map..."
        def convertedMap = converter.toMap(new XmlParser().parseText(xml))
        println "Checking result..."
        assert wClass.toString() == convertedMap.toString()
    }
}
