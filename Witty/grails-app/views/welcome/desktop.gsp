<%--
  Created by IntelliJ IDEA.
  User: szpetip
  Date: 5/23/12
  Time: 6:21 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="home.browser.title"/></title>
    <jqe:jQueryResources/>
    <link rel="icon" type="image/x-icon" href="${resource(dir: 'images', file: 'favicon.ico')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: "/css", file: "welcome.css")}">
</head>

<body>
<div class="welcome-content">
    <div class="welcome-content-images">
        <div class="welcome-content-logo">

        </div>

        <div class="welcome-content-draw">

        </div>
    </div>

    <div class="welcome-content-open">
        <a class="welcome-content-open-link"
           href="${createLink(controller: "home", action: "desktop")}">
            <g:message code="welcome.open.text.button"/>
        </a>

        <div class="welcome-content-open-info">
            <span id="welcome-content-open-link"></span>
            <g:message code="welcome.open.info.click"/><br>
        </div>
    </div>
</div>

</body>
</html>