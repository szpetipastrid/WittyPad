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
<g:applyLayout name="community">
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

    <content tag="menu"></content>
    <content tag="header">Start a Witty</content>
    <content tag="content">
        <div class="wizard-form step1-form">
            <h1><g:message code="witty.plugin.community.create.wizard.step.1.title"/></h1>
            <wittyForm:showMore shortMessage="${message(code:'witty.plugin.community.create.wizard.step.1.text')}"
                                longMessage="${message(code:'witty.plugin.community.create.wizard.step.1.text.more')}"/>
            <div class="form-container">
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
                        <g:message
                                code="witty.plugin.community.create.wizard.step.1.give.your.community.address.postfix"/>
                    </div>

                    <div id="community_uri_valid" class="postfix"></div>
                </div>

                <div style="clear: both;"></div>
            </div>
        </div>

        <div class="wizard-form step2-form">
            <h1><g:message code="witty.plugin.community.create.wizard.step.2.title"/></h1>
            <g:message code="witty.plugin.community.create.wizard.step.2.text"/>
            <label class="ltitle"><g:message code="witty.plugin.community.create.wizard.step.2.type"/></label>

           <div style="text-align: center">
               Usage of your Witty: <b>Community</b> <a href="#">Change</a>
           </div>

            <div style="clear: both"></div>

            <label class="ltitle"><g:message code="witty.plugin.community.create.wizard.step.2.share"/></label>




            <label class="ltitle"><g:message
                    code="witty.plugin.community.create.wizard.step.2.short.description"/></label>
            <g:textArea name="description" rows="" cols="" class="form-input"/>
            <div style="clear: both;"></div>

        </div>
    </content>
</g:applyLayout>