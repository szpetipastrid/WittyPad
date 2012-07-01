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
  Date: 6/3/12
  Time: 3:04 PM
--%>
<!DOCTYPE html>
<html>
<head>
    <title><g:layoutTitle default="Witty"/></title>
    <link type="text/css" rel="stylesheet"
          href="${resource(dir: "/jquery/jquery-ui/themes/base/", file: "jquery.ui.all.css")}"/>
    <jqe:jQueryResources/>
    <link rel="shortcut icon" type="image/x-icon" href="${resource(dir: 'images', file: 'favicon.ico')}">
    <link rel="icon" type="image/x-icon" href="${resource(dir: 'images', file: 'favicon.ico')}">

    <link href='http://fonts.googleapis.com/css?family=Just+Me+Again+Down+Here' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:400,300,300italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Ubuntu' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="${resource(dir: '/css', file: 'witty.css')}" type="text/css" media="screen">
    <analytics:code/>
    <g:layoutHead/>
</head>

<body>
<g:set var="performance" value="${params.performance}"/>
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

<div class="content_center shadow_around">
    <div class="content_center_inner">
        <table class="witty_banner">
            <tbody>
            <tr>
                <td style="width: 240px;">
                    <g:link controller="home" params="[lang:selectedLang]">
                        <img src="${resource(dir: 'images', file: 'menu-logo.png')}"
                             style="margin: 10px;border: none;"/>
                    </g:link>
                </td>
                <td style="width: auto;">
                    <h1 class="top_banner_title"><g:message code="home.header.title"/></h1>

                    <p class="subtitle"><g:message code="home.header.text"/></p>
                </td>
                <td style="width: auto;">
                    <div class="title_divider"></div>
                    <a class="witty-button" href="https://www.twitter.com/page.gsp#!/wittypad" target="_blank"><g:message
                            code="home.header.button.follow.us"/></a>

                    <div class="title_divider"></div>
                    <a class="witty-button" href="https://github.com/szpetip/WittyPad/wiki" target="_blank"><g:message
                            code="home.header.button.wiki"/></a>
                </td>
            </tr>
            </tbody>
        </table>

        <g:layoutBody/>

        <div style="clear: both;width:980px;height: 0"></div>

        <div class="footer">
            wittypad | &copy; 2012 WittyPad<br>
            <g:message code="home.footer.licence"/><br>
        </div>

        <div style="clear: both;width:980px;height: 1px"></div>
    </div>
</div>
</body>
</html>