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
<html>
<head>
    <meta name="layout" content="page"/>
    <title><g:layoutTitle/></title>
    <link href='${resource(dir: 'css', file: 'home.css')}' rel='stylesheet' type='text/css'>
    <script src="${resource(dir: '/modules/slider', file: 'plugins.js')}"></script>
    <script src="${resource(dir: '/modules/slider', file: 'layerslider.kreaturamedia.jquery-min.js')}"></script>
    <g:layoutHead/>
</head>

<body>

<div id="menu_banner">
    <g:pageProperty name="page.menu"/>
</div>

<g:render template="/home/components/home_layerslider"/>
<div class="page-header"><h1><g:pageProperty name="page.header"/></h1></div>
<div class="home-content">
    <g:pageProperty name="page.content"/>
</div>

</body>
</html>