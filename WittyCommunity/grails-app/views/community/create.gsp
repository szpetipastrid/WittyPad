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
  Time: 5:07 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="witty.plugin.community.create.title"/></title>
    <script type="text/javascript" src="${resource(dir: '/js', file: 'jquery.tipsy.js')}">
    </script>
    <link rel="stylesheet" href="${resource(dir: '/css', file: 'tipsy.css')}" type="text/css" media="screen">

    <script type="text/javascript">
        function checkCommunityName() {
            var text = $("#community_name").val();
            $("#community_name_valid").html(text);
        }

        function checkCommunityURI() {
            var text = $("#community_uri").val();
            var url = "${createLink(controller:'community', action:'validate_uri')}?uri=" + text;
            var result;
            $("#community_uri_valid").load(url);
        }

        $(document).ready(function() {
            $("#community_name").blur(function() {
                checkCommunityName();
            });

            $("#community_uri").blur(function() {
                checkCommunityURI();
            });
            $("#supportedLanguages").buttonset();
        });
    </script>
</head>

<body>

<div class="wizard-form step1-form">
    <h1><g:message code="witty.plugin.community.create.wizard.step.1.title"/></h1>
    <wittyForm:showMore shortMessage="${message(code:'witty.plugin.community.create.wizard.step.1.text')}"
                        longMessage="${message(code:'witty.plugin.community.create.wizard.step.1.text.more')}"/>

    <div class="form-element">
        <label class="ltitle">
            <g:message code="witty.plugin.community.create.wizard.step.1.name.your.community"/>
        </label>
        <input id="community_name" type="text" class="form-input">

        <div class="postfix">
            <g:message code="witty.plugin.community.create.wizard.step.1.name.your.community.postfix"/>
        </div>

        <div id="community_name_valid" class="postfix"></div>
    </div>

    <div class="form-element">
        <label class="ltitle">
            <g:message code="witty.plugin.community.create.wizard.step.1.give.your.community.address"/>
        </label>
        <input id="community_uri" type="text" class="form-input">

        <div class="postfix">
            <g:message code="witty.plugin.community.create.wizard.step.1.give.your.community.address.postfix"/>
        </div>

        <div id="community_uri_valid" class="postfix"></div>
    </div>

    <div class="form-element">
        <label class="ltitle">
            <g:message code="witty.plugin.community.create.wizard.step.1.supported.languages"/></label>

        <div id="supportedLanguages">
            <input type="checkbox" id="check1"/><label for="check1"><g:message code="witty.lang.en"/></label>
            <input type="checkbox" id="check2"/><label for="check2"><g:message code="witty.lang.hu"/></label>
            <input type="checkbox" id="check3"/><label for="check3"><g:message code="witty.lang.de"/></label>
        </div>

        <div style="clear: both;"></div>
    </div>

</div>

<div class="wizard-form step2-form">
    <h1><g:message code="witty.plugin.community.create.wizard.step.2.title"/></h1>
    <g:message code="witty.plugin.community.create.wizard.step.2.text"/>
    <label class="ltitle"><g:message code="witty.plugin.community.create.wizard.step.2.type"/></label>

    <div id="typeRadio">
        <g:radio id="typeRadioCommunity" value="community" name="type"
                 checked="${type=='community'}"/><label for="typeRadioCommunity"><g:message
            code="witty.plugin.community.create.wizard.step.2.type.community"/></label>
        <g:radio id="typeRadioCompany" value="company" name="type" checked="${type=='company'}"/><label
            for="typeRadioCompany"><g:message
                code="witty.plugin.community.create.wizard.step.2.type.company"/></label>
        <g:radio id="typeRadioPersonal" value="personal" name="type"
                 checked="${type=='personal'}"/><label
            for="typeRadioPersonal"><g:message
                code="witty.plugin.community.create.wizard.step.2.type.personal"/></label>
    </div>
    <script type="text/javascript">
        $(function() {
            $("#typeRadio").buttonset();
        });
    </script>

    <label class="ltitle"><g:message code="witty.plugin.community.create.wizard.step.2.share"/></label>

    <div id="visibilityRadio">
        <g:radio id="visibilityRadioFullOpen" value="community" name="visibility"
                 checked="${visibility=='community'}"/><label
            for="visibilityRadioFullOpen"><g:message
                code="witty.plugin.community.create.wizard.step.2.share.everybody"/></label>
        <g:radio id="visibilityRadioPublic" value="public" name="visibility"
                 checked="${visibility=='public'}"/><label
            for="visibilityRadioPublic"><g:message
                code="witty.plugin.community.create.wizard.step.2.share.everybody.read"/></label>
        <g:radio id="visibilityRadioPrivate" value="private" name="visibility"
                 checked="${visibility=='private'}"/><label for="visibilityRadioPrivate"><g:message
            code="witty.plugin.community.create.wizard.step.2.share.nobody"/></label>
    </div>
    <script type="text/javascript">
        $(function() {
            $("#visibilityRadio").buttonset();
        });
    </script>
    <label class="ltitle"><g:message
            code="witty.plugin.community.create.wizard.step.2.short.description"/></label>
    <g:textArea name="description" rows="" cols="" class="form-input"/>
    <div style="clear: both;"></div>

</div>

</body>
</html>