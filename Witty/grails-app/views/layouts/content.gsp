%{--
  - Copyright (c) 2012. Witty Project.
  - Peter Szilagyi
  - szpetip@gmail.com
  -
  - Witty is a a knowledge-management, open source community portal.
  - Witty is available under the http://wittypad.com.
  - Witty is a free software distributed under the GNU General Public Licence.
  - Witty and WittyPad are the name of the software, please do not use it to other purposes.
  --}%



<%--
  Created by IntelliJ IDEA.
  User: szpetip
  Date: 5/30/12
  Time: 5:39 PM
--%>
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

    <link href='${resource(dir: 'css', file: 'content.css')}' rel='stylesheet' type='text/css'>

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

            <div class="ls-layer" rel="slidedelay: 5000">
                <img class="ls-s1 slide1_strawberry" src="${resource(dir: '/images/content', file: 'girl.jpg')}"
                     alt="sublayer"
                     rel="slidedirection: bottom">


                <div class="ls-s5 slide-text" rel="delayin: 1300; slidedirection: top; slideoutdirection: top;">
                    <g:message code="content.slides.slide1.text"/>
                </div>
                <p class="ls-s3 slide-title" style="background: rgb(97,30,136);" rel="slidedirection: left;">
                    <g:message code="content.slides.slide1.title"/>
                </p>
            </div>

            <div class="ls-layer" rel="slidedelay: 5000">
                <img class="ls-s1 slide1_strawberry" src="${resource(dir: '/images/content', file: 'business.jpg')}"
                     alt="sublayer"
                     rel="slidedirection: bottom">


                <div class="ls-s5 slide-text" rel="delayin: 1300; slidedirection: top; slideoutdirection: top;">
                    <g:message code="content.slides.slide2.text"/>
                </div>
                <p class="ls-s3 slide-title" style="background: #adff2f;" rel="slidedirection: left;">
                    <g:message code="content.slides.slide2.title"/>
                </p>
            </div>

            <div class="ls-layer" rel="slidedelay: 3000">
                <img class="ls-s1" style="left: 273px;top:120px;" src="${resource(dir: '/images/content', file: 'wittypad.jpg')}"
                     alt="sublayer" rel="slidedirection: bottom">
            </div>
        </div>

        <div class="home-content">
            <g:layoutBody/>
        </div>

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
        </div>

        <div style="clear: both;width:980px;height: 1px"></div>
    </div>
</div>
</body>
</html>