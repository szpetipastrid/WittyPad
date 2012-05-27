<%--
  Created by IntelliJ IDEA.
  User: szpetip
  Date: 5/10/12
  Time: 3:38 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="home.browser.mobile.title"/></title>
    <meta name="layout" content="home.mobile"/>
    <script type="text/javascript">
        var addToHomeConfig = {
            animationIn: 'bubble',
            animationOut: 'drop',
            lifespan:10000,
            expire:2,
            touchIcon:true,
            message:'${message(code:"action.add.to.home.screen")}'
        };

    </script>
    <script type="text/javascript" src="${resource(dir: "/modules/add-to-home", file: 'add2home.js')}"></script>
</head>

<body>

<div id="witty-home" data-role="page" class="mobile-bg">
    <div data-role="header" data-position="fixed" data-fullscreen="true">
        <a onclick="location.reload(true)" data-icon="refresh"><g:message code="action.refresh"/></a>

        <h1><g:message code="home.browser.mobile.title"/></h1>
        <a href="#language-select">${selectedShortLang}</a>

    </div><!-- /header -->

    <div data-role="content" style="padding: .5em">
        <img src="${resource(dir: "images/slides", file: 'slide1_mobile.png')}" style="width: 100%;"/>

        <div data-role="collapsible" data-content-theme="a">
            <h3><g:message code="home.content.for.users.title"/></h3>

            <p><g:message code="home.content.for.users.text"/></p>
        </div>

        <div data-role="collapsible" data-content-theme="a">
            <h3><g:message code="home.content.for.developers.title"/></h3>

            <p><g:message code="home.content.for.developers.text"/></p>
        </div>

        <div data-role="collapsible" data-content-theme="a">
            <h3><g:message code="home.content.platforms.title"/></h3>

            <p><g:message code="home.content.platforms.text"/></p>
        </div>

        <div data-role="collapsible" data-content-theme="a">
            <h3><g:message code="home.content.faq.title"/></h3>

            <p><g:message code="home.content.faq.text"/></p>
        </div>

    </div><!-- /content -->
</div><!-- /page -->

<div id="language-select" data-role="page" class="mobile-bg">
    <div data-role="header" data-position="inline">
        <a data-rel="back" data-icon="back"><g:message code="action.back"/></a>

        <h1>Language</h1>
    </div><!-- /header -->

    <div data-role="content">
        Select language to use:
        <ul data-role="listview">
            <li><a href="${createLink(controller: "home", action: "mobile", params: [lang: "en_US"])}"><img
                    src="${resource(dir: "modules/language-switcher/images", file: "us_16x16.png")}" alt="en_US"
                    class="ui-li-icon">United States</a></li>
            <li><a href="${createLink(controller: "home", action: "mobile", params: [lang: "en_GB"])}"><img
                    src="${resource(dir: "modules/language-switcher/images", file: "uk_16x16.png")}" alt="en_GB"
                    class="ui-li-icon">United Kingdom</a></li>
            <li><a href="${createLink(controller: "home", action: "mobile", params: [lang: "hu_HU"])}"><img
                    src="${resource(dir: "modules/language-switcher/images", file: "hu_16x16.png")}" alt="hu_HU"
                    class="ui-li-icon">Hungary</a></li>
            <li><a href="${createLink(controller: "home", action: "mobile", params: [lang: "de_DE"])}"><img
                    src="${resource(dir: "modules/language-switcher/images", file: "de_16x16.png")}" alt="de_DE"
                    class="ui-li-icon">Germany</a></li>
        </ul>
    </div><!-- /content -->
</div><!-- /page -->

</body>
</html>