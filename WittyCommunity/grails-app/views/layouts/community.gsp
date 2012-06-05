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
  Date: 5/13/12
  Time: 4:47 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="page"/>
    <title><g:layoutTitle/></title>
    <link href='${resource(dir: 'css', file: 'witty-community.css')}' rel='stylesheet' type='text/css'>
    <g:layoutHead/>
</head>

<body>

<div id="menu_banner">
    <g:pageProperty name="page.menu"/>
</div>

<div class="page-header community-header">
    <div class="community-header-title"><g:pageProperty name="page.header"/></div>
</div>

<div class="community-content">
    <g:pageProperty name="page.content"/>
</div>
</body>
</html>