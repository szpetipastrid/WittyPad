<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>%{--
  - Copyright (c) 2012. Witty Project.
  - Peter Szilagyi
  - szpetip@gmail.com
  -
  - Witty is a a knowledge-management, open source community portal.
  - Witty is available under the http://wittypad.com.
  - Witty is a free software distributed under the GNU General Public Licence.
  - Witty and WittyPad are the name of the software, please do not use it to other purposes.
  --}%

<g:layoutTitle default="Witty"/></title>
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

        </div>

        <div id="layerslider">

            <!-- Slide 1 -->
            <div class="ls-layer" rel="slidedelay: 3000">
                <img class="ls-bg" src="${resource(dir: '/images/home/slides', file: 'slide_bg.jpg')}" alt="layer">

                <img class="ls-s1" style="left: 70px;top:15px"
                     src="${resource(dir: '/images/home/slides', file: 'slide1_image.png')}" alt="sublayer"
                     rel="slidedirection: bottom; slideoutdirection: left;">

                <div class="ls-s1 slide-title"><g:message code="home.slides.slide1.title"/></div>
            </div>

            <!-- Slide 2 -->
            <div class="ls-layer" rel="slidedelay: 3000">
                <img class="ls-bg" src="${resource(dir: '/images/home/slides', file: 'slide_bg.jpg')}" alt="layer">

                <img class="ls-s1" style="left: 70px;top:0px"
                     src="${resource(dir: '/images/home/slides', file: 'slide2_image.png')}" alt="sublayer"
                     rel="slidedirection: bottom; slideoutdirection: left;">

                <div class="ls-s1 slide-title"><g:message code="home.slides.slide2.title"/></div>
            </div>

            <!-- Slide 3 -->
            <div class="ls-layer" rel="slidedelay: 3000">
                <img class="ls-bg" src="${resource(dir: '/images/home/slides', file: 'slide_bg.jpg')}" alt="layer">

                <img class="ls-s1" style="left: 20px;top:15px"
                     src="${resource(dir: '/images/home/slides', file: 'slide3_image.png')}" alt="sublayer"
                     rel="slidedirection: bottom; slideoutdirection: left;">

                <div class="ls-s1 slide-title"><g:message code="home.slides.slide3.title"/></div>
            </div>

            <!-- Slide 4 -->
            <div class="ls-layer" rel="slidedelay: 3000">
                <img class="ls-bg" src="${resource(dir: '/images/home/slides', file: 'slide_bg.jpg')}" alt="layer">

                <img class="ls-s1" style="left: 0px;top:0px"
                     src="${resource(dir: '/images/home/slides', file: 'slide4_image1.png')}" alt="sublayer"
                     rel="delayin: 1400;slidedirection: left; slideoutdirection: left;">
                <img class="ls-s1" style="left: 0px;top:0px"
                     src="${resource(dir: '/images/home/slides', file: 'slide4_image2.png')}" alt="sublayer"
                     rel="delayin: 700;slidedirection: left; slideoutdirection: left;">
                <img class="ls-s1" style="left: 0px;top:0px"
                     src="${resource(dir: '/images/home/slides', file: 'slide4_image3.png')}" alt="sublayer"
                     rel="delayin: 100;slidedirection: left; slideoutdirection: left;">


                <img class="ls-s1" style="left: 530px;top:120px"
                     src="${resource(dir: '/images/home/slides', file: 'slide4_logo.png')}"
                     alt="sublayer" rel="slidedirection: top; slideoutdirection: top;">

                <div class="ls-s1"
                     style="width:445px;left: 530px;top:200px;font-family: 'Just Me Again Down Here', cursive;font-size: 55px;line-height: 55px;">
                    <g:message code="home.slides.slide4.title"/>
                </div>

            </div>

        </div>

        <div class="home-content">
            <g:layoutBody/>
        </div>

        <div style="clear: both;width:980px;height: 0"></div>

        <div class="footer">
            wittypad | <g:message code="author.name"/> <g:message code="author.address"/><br>
            <g:message code="home.footer.licence"/><br>

            <a href="https://twitter.com/#!/wittypad" class="tile_link" target="_blank"><g:message
                    code="home.footer.follow.us"/></a>  |
            <a href="https://github.com/szpetip/WittyPad/wiki" class="tile_link" target="_blank"><g:message
                    code="home.footer.open.wiki"/></a>  |
            <a href="https://github.com/szpetip/WittyPad/issues" class="tile_link" target="_blank"><g:message
                    code="home.footer.open.issues"/></a>  |
            <a href="${comm.link(community: 'witty')}"><g:message code="home.footer.open.witty.community"/></a><br>
        </div>

        <div style="clear: both;width:980px;height: 1px"></div>
    </div>
</div>
</body>
</html>