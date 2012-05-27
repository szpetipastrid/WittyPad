<!DOCTYPE html>
<html>
<head>
    <title><g:layoutTitle default="Witty"/></title>
    <link type="text/css" rel="stylesheet"
          href="${resource(dir: "jquery-ui/themes/base/", file: "jquery.ui.all.css")}"/>
    <jqe:jQueryResources/>
    <link rel="shortcut icon" type="image/x-icon" href="${resource(dir: 'images', file: 'favicon.ico')}">
    <link rel="icon" type="image/x-icon" href="${resource(dir: 'images', file: 'favicon.ico')}">

    <link href='http://fonts.googleapis.com/css?family=Just+Me+Again+Down+Here' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:400,300,300italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Bilbo' rel='stylesheet' type='text/css'>

    <link href='${resource(dir: 'css', file: 'home.css')}' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="${resource(dir: '/css', file: 'witty.css')}" type="text/css" media="screen">
    <script src="${resource(dir: '/modules/slider', file: 'plugins.js')}"></script>
    <script src="${resource(dir: '/modules/slider', file: 'layerslider.kreaturamedia.jquery-min.js')}"></script>

    <!-- Language switcher -->
    <link href='${resource(dir: 'modules/language-switcher', file: 'languageswitcher.css')}' rel='stylesheet'
          type='text/css'>
    <script type="text/javascript"
            src="${resource(dir: 'modules/language-switcher', file: 'languageswitcher.js')}"></script>
    <analytics:code/>
    <g:layoutHead/>
</head>

<body>
<g:set var="performance" value="${params.performance}"/>

<script type="text/javascript">
    <g:if test="${performance as String != 'low'}" >
    $(document).ready(function() {
        $('#layerslider').layerSlider({
            skin : 'lightskin',
            skinsPath : 'layerslider/skins/',
            durationTimeIn : 1500,
            durationTimeOut : 1500
        });
    });
    </g:if>
</script>
<browser:isiPhone>
    <div id="closeMobileViewBanner">
        <div class="closeMobileViewBanner-text">
            <g:link controller="welcome" action="mobile">Tap here to open mobile view</g:link>
        </div>

        <div class="closeMobileViewBanner-button">
            <img id="closeMobileViewButton" src="${resource(dir: "images/welcome", file: "close_mobile_banner.png")}"/>
        </div>
        <script type="text/javascript">
            $(function() {
                $("#closeMobileViewButton").click(function() {
                    $("#closeMobileViewBanner").fadeOut();
                });
            })
        </script>
    </div>
</browser:isiPhone>
<div class="content_center">
    <div class="content_center_inner">
        <table class="witty_banner">
            <tbody>
            <tr>
                <td style="width: 240px;">
                    <g:link controller="home" params="[lang:selectedLang]">
                        <img src="${resource(dir: 'images', file: 'menu_logo.png')}"
                             style="margin: 10px;border: none;"/>
                    </g:link>
                </td>
                <td style="width: auto;">
                    <h1 class="top_banner_title"><g:message code="home.header.title"/></h1>

                    <p class="subtitle"><g:message code="home.header.text"/></p>
                </td>
                <td style="width: auto;">
                    <div class="title_divider"></div>
                    <a class="title_button" href="https://www.twitter.com/#!/wittypad" target="_blank"><g:message
                            code="home.header.button.follow.us"/></a>

                    <div class="title_divider"></div>
                    <a class="title_button" href="https://github.com/szpetip/WittyPad/wiki" target="_blank"><g:message
                            code="home.header.button.wiki"/></a>
                </td>
            </tr>
            </tbody>
        </table>

        <div id="menu_banner">
            <div id="country-select">
                <form action="">
                    <select id="country-options" name="country-options">
                        <option ${selectedLang as String == "us" || selectedLang as String == "en_US" ? 'selected' : ''}
                                title="${createLink(controller: 'home', action: 'desktop', params: [lang: "en_US"])}"
                                value="us">United States</option>
                        <option ${selectedLang as String == "gb" || selectedLang as String == "en_GB" ? 'selected' : ''}
                                title="${createLink(controller: 'home', action: 'desktop', params: [lang: "en_GB"])}"
                                value="uk">United Kingdom</option>
                        <option ${selectedLang as String == "hu" || selectedLang as String == "hu_HU" ? 'selected' : ''}
                                title="${createLink(controller: 'home', action: 'desktop', params: [lang: "hu_HU"])}"
                                value="hu">Hungary</option>
                        <option ${selectedLang as String == "de" || selectedLang as String == "de_DE" ? 'selected' : ''}
                                title="${createLink(controller: 'home', action: 'desktop', params: [lang: "de_DE"])}"
                                value="de">Germany</option>
                    </select>
                    <input value="Select" type="submit"/>
                </form>
            </div>
        </div>

        <div id="layerslider">

            <div class="ls-layer" rel="slidedelay: 3000">

                <img class="ls-bg" src="${resource(dir: '/images/slides', file: 'slide1_bg.png')}" alt="layer">
                <img class="ls-s1 slide1_macbook" src="${resource(dir: '/images/slides', file: 'slide1_macbook.png')}"
                     alt="sublayer"
                     rel="slidedirection: bottom">
                <img class="ls-s2 slide1_iphone" src="${resource(dir: '/images/slides', file: 'slide1_iphone.png')}"
                     alt="sublayer"
                     rel="slidedirection: right">


                <div class="ls-s5 slide_note_button slide1_note_button"
                     rel="delayin: 1300; slidedirection: top; slideoutdirection: top;">
                    <a href="${comm.link(community: 'witty')}" class="title_button ">
                        <g:message code="home.slides.slide1.button.explore"/>
                    </a>
                </div>

                <div class="ls-s5 slide_note slide1_note"
                     rel="delayin: 700; slidedirection: top; slideoutdirection: top;">
                    <div class="slide_note_title slide1_note_title">
                        <g:message code="home.slides.slide1.note.title"/>
                    </div>

                    <div class="slide_note_text slide1_note_text">
                        <g:message code="home.content.for.users.text"/>
                    </div>
                </div>
                <img class="ls-s5 slide1_coffee" src="${resource(dir: '/images/slides', file: 'slide1_coffee.png')}"
                     alt="sublayer"
                     rel="slidedirection: bottom; slideoutdirection: bottom;">

                <p class="ls-s3 handwrite"
                   style="background: url('${resource(dir: 'images', file: 'transparent_black.png')}');padding: 5px;line-height: 65px; font-size: 65px; color: #ffffff;left: 100px;top:50px;text-shadow: 5px 5px 5px #424242;easingin: easeOutQuad;"
                   rel="slidedirection: left;">
                    <g:message code="home.slides.slide1.message"/>
                </p>

            </div>

            <div class="ls-layer" rel="slidedelay: 3000">

                <img class="ls-bg" src="${resource(dir: '/images/slides', file: 'slide1_bg.png')}" alt="layer">
                <img class="ls-s1 slide1_macbook" src="${resource(dir: '/images/slides', file: 'slide1_macbook.png')}"
                     alt="sublayer"
                     rel="slidedirection: bottom">
                <img class="ls-s2 slide1_iphone" src="${resource(dir: '/images/slides', file: 'slide1_iphone.png')}"
                     alt="sublayer"
                     rel="slidedirection: right">


                <div class="ls-s5 slide_note_button slide1_note_button"
                     rel="delayin: 1300; slidedirection: top; slideoutdirection: top;">
                    <a href="${comm.link(community: 'witty')}" class="title_button ">
                        <g:message code="home.slides.slide1.button.explore"/>
                    </a>
                </div>

                <div class="ls-s5 slide_note slide1_note"
                     rel="delayin: 700; slidedirection: top; slideoutdirection: top;">
                    <div class="slide_note_title slide1_note_title">
                        <g:message code="home.slides.slide1.note.title"/>
                    </div>

                    <div class="slide_note_text slide1_note_text">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras et turpis enim.
                        Aliquam aliquet condimentum augue eu sodales. Sed malesuada consequat libero pretium vestibulum.
                        Etiam mattis tempus condimentum. Donec eget mi orci. Aliquam congue vehicula mauris vel blandit.
                        Suspendisse bibendum nunc quis dui euismod malesuada.
                    </div>
                </div>
                <img class="ls-s5 slide1_coffee" src="${resource(dir: '/images/slides', file: 'slide1_coffee.png')}"
                     alt="sublayer"
                     rel="slidedirection: bottom; slideoutdirection: bottom;">

                <p class="ls-s3 handwrite"
                   style="background: url('${resource(dir: 'images', file: 'transparent_black.png')}');padding: 5px;line-height: 65px; font-size: 65px; color: #ffffff;left: 100px;top:50px;text-shadow: 5px 5px 5px #424242;easingin: easeOutQuad;"
                   rel="slidedirection: left;">
                    <g:message code="home.slides.slide1.message"/>
                </p>

            </div>

        </div>

        <g:layoutBody/>
        <div style="clear: both;width:980px;height: 0"></div>

        <div class="footer">
            wittypad | &copy; 2012 <g:message code="kovex.name"/><br>
            <g:message code="home.footer.licence"/><br>

            <a href="https://twitter.com/#!/wittypad" class="tile_link" target="_blank"><g:message
                    code="home.footer.follow.us"/></a>  |
            <a href="https://github.com/szpetip/WittyPad/wiki" class="tile_link" target="_blank"><g:message
                    code="home.footer.open.wiki"/></a>  |
            <a href="https://github.com/szpetip/WittyPad/issues" class="tile_link" target="_blank"><g:message
                    code="home.footer.open.issues"/></a>  |
            <a href="${comm.link(community: 'witty')}"><g:message code="home.footer.open.witty.community"/></a><br>
            <g:link controller="home" params="[lang:'en_US']">wittyPad USA</g:link>  |
            <g:link controller="home" params="[lang:'en_GB']">wittyPad Great Britain</g:link>  |
            <g:link controller="home" params="[lang:'hu_HU']">wittyPad Hungary</g:link>  |
            <g:link controller="home" params="[lang:'de_DE']">wittyPad Germany</g:link>

        </div>

        <div style="clear: both;width:980px;height: 1px"></div>
    </div>
</div>
</body>
</html>