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





package hu.kovex.witty.plugin.community

class InPlaceEditorTagLib {
    static namespace = "ine"

    def head = { attrs, body ->
        out << """
          <script src="${resource(dir: "js", file: "jquery.editinplace.js")}"></script>
          """
    }

    def field = { attrs, body ->
        def address = attrs.address
        def property = attrs.property
        def cssClass = attrs.cssClass
        def link = attrs.link
        boolean editButton = attrs.editButton != "false"
        def text = body()
        common(address, property, "text", cssClass, link, editButton, text)
    }

    def area = { attrs, body ->
        def address = attrs.address
        def property = attrs.property
        def cssClass = attrs.cssClass
        def link = attrs.link
        boolean editButton = attrs.editButton != "false"
        def text = body()
        common(address, property, "textarea", cssClass, link, editButton, text)
    }

    private def common = { address, property, type, cssClass, link, editButton, text ->
        def id = "${address}_${property}"
        out << """
                <div class="${cssClass} ${cssClass}_${type}" id="${id}">${text}</div><a id="${id}EditButton" class="h inplace_edit_button">${message(code:'witty.plugin.community.create.edit')}</a>
          <script type=\"text/javascript\">
              \$(function () {
        var ${id}Delegate = {
            shouldOpenEditInPlace: function(aDOMNode, aSettingsDict, triggeringEvent) {\$("#${id}EditButton").hide();},
            didCloseEditInPlace: function(aDOMNode, aSettingsDict) {\$("#${id}EditButton").show();}
        }
                   \$("#${id}").editInPlace({
		                field_type: '${type}',
		                callback:   function(idOfEditor, enteredText, originalHTMLContent, settingsParams, callbacks) {
		                                var ${id}ResVar;
                                        \$.ajaxSetup( { "async": false } );
                                        \$.getJSON( "${link}?address=${address}&property=${property}&value="+encodeURIComponent(enteredText),
                                        function(data) {
                                        if (data.result.status == "success") { ${id}ResVar = enteredText; } else { ${id}ResVar = originalHTMLContent;alert(data.result.message); };
                                        }
                                        )
                                        \$.ajaxSetup( { "async": true } );
                                        return ${id}ResVar;
            		                 },
		                delegate: ${id}Delegate
	                });
                \$("#${id}EditButton").click(function() {
                          \$("#${id}").click();
                });
              });
          </script>
      """
    }

}
