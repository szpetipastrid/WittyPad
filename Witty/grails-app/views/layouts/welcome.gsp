<%--
  Created by IntelliJ IDEA.
  User: szpetip
  Date: 5/25/12
  Time: 7:27 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:layoutTitle/></title>
    <link rel="shortcut icon" type="image/x-icon" href="${resource(dir: 'images', file: 'favicon.ico')}">
    <link rel="icon" type="image/x-icon" href="${resource(dir: 'images', file: 'favicon.ico')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: "/css", file: "main.css")}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: "/css", file: "welcome.css")}">
    <browser:isiPhone>
        <link rel="stylesheet" type="text/css" href="${resource(dir: "/css", file: "welcome.iphone.css")}">
    </browser:isiPhone>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <meta content="minimum-scale=0.6, width=device-width, maximum-scale=0.6, user-scalable=no" name="viewport"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>

    <analytics:code/>
    <g:layoutHead/>
</head>

<body>
<script type="text/javascript">
    $(function() {
        window.scrollTo(0, 1);
    });
    addEventListener("resize", function() {
        window.scrollTo(0, 1);
    }, false);


    var secondRemaining = 100;
    function countingBack() {
        var preString = "${message(code:'welcome.open.text.prefix')}";
        var postString = "${message(code:"welcome.open.text.postfix")}";
        $("#welcome-content-open-link").text(preString + " " + secondRemaining + " " + postString);
    }

    function countingBackTimer() {
        countingBack();
        if (secondRemaining > 0) {
            secondRemaining--;
            setTimeout('countingBackTimer()', 1000);
        } else {
            window.location = "${createLink(controller: 'home', action: 'desktop')}";
        }
    }

    $(function() {
        countingBackTimer();
    });
</script>

<g:layoutBody/>
</body>
</html>
