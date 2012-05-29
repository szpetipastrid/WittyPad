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
        out << """${shortMessage} <a id="${generatedId}MoreLink" class="showMoreLink">${message(code:"wittyForm.showMore.more")}</a>
        <span id="${generatedId}More" style="display: none;">${longMessage} <a id="${generatedId}LessLink" class="showMoreLink">${message(code:"wittyForm.showMore.less")}</a></span>
        <script>
        \$(function() {
        \$("#${generatedId}MoreLink").click(function() { \$("#${generatedId}More").show(); \$("#${generatedId}MoreLink").hide();});
        \$("#${generatedId}LessLink").click(function() { \$("#${generatedId}MoreLink").show();\$("#${generatedId}More").hide();});
        });
        </script>
        """
    }
}
