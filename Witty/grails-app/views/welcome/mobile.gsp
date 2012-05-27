<%--
  Created by IntelliJ IDEA.
  User: szpetip
  Date: 5/25/12
  Time: 8:37 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="home.browser.title"/></title>
    <jqe:jQueryResources/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <meta content="minimum-scale=0.5, width=device-width, maximum-scale=0.5, user-scalable=no" name="viewport"/>

    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link rel="stylesheet" type="text/css" href="${resource(dir: "/css", file: "welcome.iphone.css")}">
</head>

<body>
<script type="text/javascript">
    $(function() {
        window.scrollTo(0, 1);
    });
    addEventListener("resize", function() {
        window.scrollTo(0, 1);
    }, false);

</script>

<div class="welcome-content">
    <div class="welcome-content-images">
        <div class="welcome-content-logo">

        </div>

        <div class="welcome-content-draw">

        </div>
    </div>

    <div class="welcome-content-open">
        <a class="welcome-content-open-link" href="${createLink(controller: "home", action: "desktop")}">
            <g:message code="welcome.open.text.button"/>
        </a>

        <div class="welcome-content-open-info">
            <span id="welcome-content-open-link"></span>
            <g:message code="welcome.open.info.click.mobile"/>
        </div>
    </div>

    <div class="languageSelector">
        <div class="languageSelector-title">
            <a id="openLanguageSelector"><g:message code="welcome.open.change.locale.mobile"/></a>
        </div>
        <script type="text/javascript">
            $(function() {
                $("#openLanguageSelector").click(function() {
                    $(".languageSelector-List").fadeIn();
                })
            })
        </script>
        <div class="languageSelector-list">
            <div class="languageSelector-list-info">
            <g:message code="welcome.open.change.locale"/>
                </div>
            <a class="locales" href="${createLink(action: 'mobile', params: [lang: "en_US"])}">
                WittyPad USA
            </a>
            <a class="locales" href="${createLink(action: 'mobile', params: [lang: "en_GB"])}">
                WittyPad UK
            </a>
            <a class="locales" href="${createLink(action: 'mobile', params: [lang: "hu_HU"])}">
                WittyPad Hungary
            </a>
            <a class="locales" href="${createLink(action: 'mobile', params: [lang: "de_DE"])}">
                WittyPad Germany
            </a>
        </div>
    </div>
</div>
</body>
</html>