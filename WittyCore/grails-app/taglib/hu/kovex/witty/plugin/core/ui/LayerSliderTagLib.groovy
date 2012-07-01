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

class LayerSliderTagLib {
    static def namespace = "slider"

    def slider = {attrs, body ->
        def sliderId = "slider${new Date().time}"
        out << """
        <script type="text/javascript">
            \$(document).ready(function() {
                \$('#${sliderId}').layerSlider({
                    skin : 'lightskin',
                    skinsPath : 'layerslider/skins/',
                    durationTimeIn : 1500,
                    durationTimeOut : 1500
                });
            });
        </script>
        <div id="${sliderId}" ${attrs.css ? "class='${attrs.css}'" : ""}>
        ${body()}
        </div>
        """
    }

    def defaultHomeSlide = { attrs, body ->
        def image = attrs.image
        def title = attrs.title
        def text = attrs.text
        def style = attrs.style
        def cssClass = attrs.css

        out << """
            <div class="ls-layer ${cssClass ?: ""}" rel="slidedelay: 3000">
                <img class="ls-s1" style="${style}"
                     src="${image}" alt="sublayer" rel="slidedirection: bottom; slideoutdirection: left;">

                <div class="ls-s1 slide-title" rel="delayin: 700;slidedirection: right; slideoutdirection: left;">
                ${title}
                </div>

                <div class="ls-s1 slide-text" rel="delayin: 1100;slidedirection: right; slideoutdirection: left;">
                ${text}
                </div>
                <img class="ls-s1" style="left: 840px;top:360px"
                     src="${resource(dir: '/images/home/slides', file: 'slide_witty_logo.png')}" alt="sublayer"
                     rel="slidedirection: bottom; slideoutdirection: bottom;">
            </div>
        """
    }
}
