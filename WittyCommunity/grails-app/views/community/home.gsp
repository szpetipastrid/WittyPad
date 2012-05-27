<%--
  Created by IntelliJ IDEA.
  User: szpetip
  Date: 5/5/12
  Time: 8:24 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Witty | <sh:winstance obj="${community}" val="prop_name"/></title>

    <g:each in="${community.wproperties.findAll {it.key.startsWith('html_css')}*.key}">
        <link rel="stylesheet" href="${sh.winstance(obj:community,val:it)}" type="text/css" media="screen">
    </g:each>
    <g:each in="${community.wproperties.findAll {it.key.startsWith('html_script')}*.key}">
        <script type="text/javascript" src="${sh.winstance(obj:community,val:it)}"></script>
    </g:each>
</head>
<script type="text/javascript">
    $(function() {
        location.hash = 'home';
    })
</script>


<div class="community-content">
    <h1>${sh.winstance(obj:community,val:'prop_name')} (${selectedShortLang}, <g:formatDate date="${new Date()}" type="datetime" style="MEDIUM"/>)</h1>
    <comm:image community="${sh.winstance(obj:community,val:'prop_uri')}" size="small"/>

    <p>
        ${sh.winstance(obj:community,val:'prop_description')}
    </p>
    <comm:image community="${sh.winstance(obj:community,val:'prop_uri')}" size="large"/>

    <p>
        <g:link base="${org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.serverURL}"
                uri="/">Witty Home</g:link>
    </p>
</div>
</html>

