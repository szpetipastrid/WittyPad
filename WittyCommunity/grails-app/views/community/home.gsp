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
  Date: 5/5/12
  Time: 8:24 PM
--%>

<%@ page import="hu.kovex.witty.plugin.core.domain.WInstance" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Witty | <sh:winstance obj="${witty}" val="prop_name"/></title>

    <g:each in="${witty.wproperties.findAll {it.key.startsWith('html_css')}*.key}">
        <link rel="stylesheet" href="${sh.winstance(obj: witty, val: it)}" type="text/css" media="screen">
    </g:each>
    <g:each in="${witty.wproperties.findAll {it.key.startsWith('html_script')}*.key}">
        <script type="text/javascript" src="${sh.winstance(obj: witty, val: it)}"></script>
    </g:each>
</head>

<div class="witty-content">
    <h1>${sh.winstance(obj: witty, val: 'prop_name')} (${selectedShortLang})</h1>

    <p>
        Witty is created: ${formatDate(date:WInstance.prop(witty, "prop_created", "all"), style:"short")}<br>
        ${sh.winstance(obj: witty, val: 'prop_description')}
    </p>
</div>
</html>

