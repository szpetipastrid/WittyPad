<%--
  Created by IntelliJ IDEA.
  User: szpetip
  Date: 5/13/12
  Time: 4:47 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:layoutTitle/></title>
    <jqe:jQueryResources/>
    <link type="text/css" rel="stylesheet"
          href="${resource(plugin: "witty-core", dir: "jquery/jquery-ui/themes/base", file: "jquery.ui.all.css")}"/>

    <link href='http://fonts.googleapis.com/css?family=Lato:400,300,300italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="${resource(dir: '/css', file: 'witty-community.css')}" type="text/css" media="screen">

    <g:layoutHead/>
</head>

<body>
<div class="top_banner">
    <table class="top_logo">
        <tbody>
        <tr>
            <td style="width: 240px;">
                <g:link base="${org.codehaus.groovy.grails.commons.ConfigurationHolder.config.grails.serverURL}"
                        controller="home" params="[lang:selectedLang]">
                    <img src="${resource(dir: 'images', file: 'menu_logo.png')}" style="margin: 10px;"/>
                </g:link>
            </td>
            <td style="width: auto;">
                <h1 class="top_banner_title"><g:message code="home.header.title"/></h1>

                <p class="subtitle"><g:message code="home.header.text"/></p>
            </td>
            <td style="width: auto;">
                <a class="title_button" href="https://github.com/szpetip/Witty/wiki" target="_blank"
                   style="float:right;"><g:message
                        code="home.header.button.wiki"/></a>

                <div class="title_divider" style="float:right;"></div>
                <a class="title_button" href="https://www.twitter.com/#!/wittypad" target="_blank"
                   style="float:right;"><g:message
                        code="home.header.button.follow.us"/></a>

                <div class="title_divider" style="float:right;"></div>

            </td>
        </tr>
        </tbody>
    </table>
</div>
<g:layoutBody/>
<script type="text/javascript">

    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-31743781-1']);
    _gaq.push(['_setDomainName', 'wittypad.com']);
    _gaq.push(['_trackPageview']);

    (function() {
        var ga = document.createElement('script');
        ga.type = 'text/javascript';
        ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(ga, s);
    })();

</script>
</body>
</html>