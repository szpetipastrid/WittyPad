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
  Date: 6/17/12
  Time: 4:36 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>WittyPad: <g:layoutTitle/></title>
    <link rel="shortcut icon" type="image/x-icon"
          href="${resource(plugin: "witty-core", dir: 'images', file: 'favicon.ico')}">
    <link rel="icon" type="image/x-icon" href="${resource(plugin: "witty-core", dir: 'images', file: 'favicon.ico')}">
    <link href='${resource(dir: 'css', file: 'admin.css')}' rel='stylesheet' type='text/css'>
    <link href='${resource(dir: 'css', file: 'admin-forms.css')}' rel='stylesheet' type='text/css'>
    <link href='${resource(dir: 'css', file: 'witty-forms.css')}' rel='stylesheet' type='text/css'>
    <jqe:jQueryResources/>
    <g:layoutHead/>
</head>

<body>
<div class="wrapper">
    <div class="adminHeader">
        <img src="${resource(dir: "images", file: "menu_logo.png")}"
             style="margin-left:50px;margin-top: 5px;height: 40px;"/>
    </div>

    <div style="padding-left: 50px;" class="adminTitle fixedTitle">
        <div class="title h" style="line-height: 70px;width: 150px;float:left;">
            <g:link controller="admin" action="index" base="http://${mainDomain}">My Witties</g:link>
        </div>

        <div><g:pageProperty name="page.title"/></div>
    </div>

    <div class="adminContent t">
        <g:layoutBody/>
    </div>

    <div class="push"></div>
</div>
<div class="footer">
    &copy; 2012 wittypad.com | <a href="http://${mainDomain}">Witty Home</a> | <g:link controller="admin" action="index" base="http://${mainDomain}">My Witties</g:link>
</div>
</body>
</html>