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
</head>

<body>

<div class="welcome-border">
    <div class="welcome-content">
        <div class="welcome-logo"></div>

        <div class="welcome-button welcome-button-video">
            <a href="#"></a>
        </div>


        <div class="welcome-button welcome-button-start">
            <a href="${createLink(controller: 'home', action: 'index')}"></a>
        </div>

        <div class="welcome-button-link welcome-button-link-video">
            <a href="#"><g:message code="welcome.demo.text.button"/></a>
        </div>

        <div class="welcome-button-link  welcome-button-link-start">
            <a href="${createLink(controller: 'home', action: 'index')}">
                <g:message code="welcome.open.text.button"/></a>
        </div>


        <div id="welcome-content-open-link"></div>
    </div>
</div>

</body>
</html>