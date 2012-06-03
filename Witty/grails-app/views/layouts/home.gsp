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
<html>
<head>
    <meta name="layout" content="page"/>
    <title><g:layoutTitle/></title>
    <g:layoutHead/>
</head>

<body>

<div id="menu_banner">
    <g:pageProperty name="page.menu"/>
</div>

<g:render template="/home/components/home_layerslider"/>

<div class="page-header"><h1><g:pageProperty name="page.header"/></h1></div>

<div class="home-content">
    <g:pageProperty name="page.home"/>
</div>

</body>
</html>