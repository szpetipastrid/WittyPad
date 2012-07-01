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



package hu.kovex.witty.plugin.core.ui

class WittyFormTagLib {
    static def namespace = "wittyForm"

    def showMore = {attrs, body ->
        def shortMessage = attrs.shortMessage
        def longMessage = attrs.longMessage
        def generatedId = "showMore${new Date().time}"
        out << """<div class="showMoreContainer"><img src="${resource(plugin: "witty-core", dir: "images", file: "help_info.png")}" style="margin-right:6px;">${shortMessage} <a id="${generatedId}MoreLink" class="showMoreLink">${message(code: "wittyForm.showMore.more")}</a>
        <span id="${generatedId}More" style="display: none;">${longMessage} <a id="${generatedId}LessLink" class="showMoreLink">${message(code: "wittyForm.showMore.less")}</a></span>
        </div>
        <script>
        \$(function() {
        \$("#${generatedId}MoreLink").click(function() { \$("#${generatedId}More").fadeIn(); \$("#${generatedId}MoreLink").hide();});
        \$("#${generatedId}LessLink").click(function() { \$("#${generatedId}MoreLink").fadeIn();\$("#${generatedId}More").hide();});
        });
        </script>
        """
    }

    def textAreaCounter = { attrs, body ->
        def result = attrs.result
        def limit = attrs.limit?: 1000
        def textArea = attrs.textArea
        out << """
                <script type="text/javascript">
                    \$(function() {
                        \$('#${textArea}').keyup(function() {
                            var charLength = \$(this).val().length;
                            \$('#${result}').html(charLength + ' of ${limit} characters used');
                            if (charLength > ${limit})
                                \$('#charCount').html('<strong>You may only have up to ${limit} characters, you entered '+charLength+'.</strong>');
                        });
                    });
                </script>
        """
    }
}
