<%--
  Created by IntelliJ IDEA.
  User: szpetip
  Date: 5/10/12
  Time: 3:37 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:layoutTitle default="Witty"/></title>
    <jqe:jQueryMobileResources/>

    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no" name="viewport"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}"/>
    <link rel="apple-touch-startup-image" href="${resource(dir: 'images', file: 'apple-touch-startup.png')}"/>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="${resource(dir: 'images', file: 'favicon.ico')}">
    <link rel="icon" type="image/x-icon" href="${resource(dir: 'images', file: 'favicon.ico')}">

    %{--<link href='http://fonts.googleapis.com/css?family=Just+Me+Again+Down+Here' rel='stylesheet' type='text/css'>--}%
    %{--<link href='http://fonts.googleapis.com/css?family=Lato:400,300,300italic' rel='stylesheet' type='text/css'>--}%
    %{--<link href='http://fonts.googleapis.com/css?family=Bilbo' rel='stylesheet' type='text/css'>--}%
    <link href='${resource(dir: 'css', file: 'mobile.css')}' rel='stylesheet' type='text/css'>
    <analytics:code/>
    <g:layoutHead/>
</head>

<body>
<g:layoutBody/>
</body>
</html>