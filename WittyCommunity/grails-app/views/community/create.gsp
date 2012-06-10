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
    <div class="form-background">
        <div class="property-form">
        <div class="form-image form-image-base" style="margin-top: 0;margin-bottom: -138px;"></div>

        <div class="property-line property-line-first">
            <h1><g:message code="witty.plugin.community.create.wizard.step.1.title"/></h1>
            <wittyForm:showMore shortMessage="${message(code:'witty.plugin.community.create.wizard.step.1.text')}"
                                longMessage="${message(code:'witty.plugin.community.create.wizard.step.1.text.more')}"/>
        </div>

        <div class="property-line">

            <div class="error_result">
                <div id="community_name_valid"></div>
            </div>
            <label class="caption" for="community_name">
                <g:message code="witty.plugin.community.create.wizard.step.1.name.your.community"/>
            </label>
            <input id="community_name" type="text">

            <div class="postfix">
                <g:message code="witty.plugin.community.create.wizard.step.1.name.your.community.postfix"/>
            </div>

            <div style="clear:both"></div>
        </div>

        <div class="property-line">
            <div class="error_result">
                <div id="community_uri_valid"></div>
            </div>

            <label class="caption" for="community_uri">
                <g:message code="witty.plugin.community.create.wizard.step.1.give.your.community.address"/>
            </label>
            <input id="community_uri" type="text">

            <div class="postfix">
                <g:message
                        code="witty.plugin.community.create.wizard.step.1.give.your.community.address.postfix"/>
            </div>

            <div style="clear:both"></div>
        </div>
    </div>


    <div class="property-form">
        <div class="form-image form-image-accessibility"></div>

        <div class="property-line property-line-first">
            <h1><g:message code="witty.plugin.community.create.wizard.step.2.title"/></h1>
            <wittyForm:showMore shortMessage="${message(code:'witty.plugin.community.create.wizard.step.2.text')}"
                                longMessage="${message(code:'witty.plugin.community.create.wizard.step.2.text.more')}"/>
        </div>

        <div class="property-line">
            <label class="caption" for="short_description">
                <g:message code="witty.plugin.community.create.wizard.step.2.short.description"/>
            </label>

            <div class="property_text">
                <g:textArea id="short_description" name="shortDescrption" rows="" cols=""/>
                <span id="charCount"></span>
                <wittyForm:textAreaCounter textArea="short_description" result="charCount" limit="200"/>
            </div>

            <div style="clear:both"></div>
        </div>

        <div class="property-line">
            <label class="caption">
                <g:message code="witty.plugin.community.create.wizard.step.2.accessibility"/>
            </label>

            <div class="property_text">
                <ul>
                    <li>
                        <g:radio value="open" name="accessibility" id="accessibilityOpen"/>
                        <label for="accessibilityOpen">
                            <g:message code="witty.plugin.community.create.wizard.step.2.accessibility.open"/>
                        </label>
                    </li>
                    <li>
                        <g:radio value="restricted" name="accessibility"
                                 id="accessibilityRestricted" checked="true"/>
                        <label for="accessibilityRestricted">
                            <g:message code="witty.plugin.community.create.wizard.step.2.accessibility.restricted"/>
                        </label>
                    </li>
                    <li>
                        <g:radio value="private" name="accessibility" id="accessibilityPrivate"/>
                        <label for="accessibilityPrivate">
                            <g:message code="witty.plugin.community.create.wizard.step.2.accessibility.private"/>
                        </label>
                    </li>
                </ul>

                <div id="accessibilityDescription" class="accessibilityDescription"></div>
                <script type="text/javascript">
                    $(function() {
                        showAccessibilityDescription();
                        $('input:radio[name=accessibility]').change(function() {
                            showAccessibilityDescription();
                        });
                    });
                    function showAccessibilityDescription() {
                        var accessibilityValue = $('input:radio[name=accessibility]:checked').val();
                        var accessibilityDescription = ""

                        if (accessibilityValue == "open") {
                            accessibilityDescription = "${message(code:"witty.plugin.community.create.wizard.step.2.accessibility.open.description")}"
                        } else if (accessibilityValue == "restricted") {
                            accessibilityDescription = "${message(code:"witty.plugin.community.create.wizard.step.2.accessibility.restricted.description")}"
                        } else if (accessibilityValue == "private") {
                            accessibilityDescription = "${message(code:"witty.plugin.community.create.wizard.step.2.accessibility.private.description")}"
                        }
                        $("#accessibilityDescription").text(accessibilityDescription);
                    }
                </script>

            </div>

            <div style="clear:both"></div>
        </div>

        <div class="property-line">
            <label class="caption" for="adultContentCheckBox">
                <g:message code="witty.plugin.community.create.wizard.step.2.adult.content"/>
            </label>

            <div class="property_text">
                <div class="property-accessibility"><g:checkBox id="adultContentCheckBox" name="adultContent"/>
                <g:message code="witty.plugin.community.create.wizard.step.2.adult.content.text"/>
                </div>
            </div>

            <div style="clear:both"></div>
        </div>
    </div>

    <div class="property-form">
        <div class="form-image form-image-finish-witty"></div>

        <div class="property-line property-line-first">
            <h1><g:message code="witty.plugin.community.create.wizard.step.3.title"/></h1>
            <wittyForm:showMore shortMessage="${message(code:'witty.plugin.community.create.wizard.step.3.text')}"
                                longMessage="${message(code:'witty.plugin.community.create.wizard.step.3.text.more')}"/>
        </div>

        <div class="property-line">
            <label class="caption" for="community_name">
                <g:message code="witty.plugin.community.create.wizard.step.3.recaptcha"/>
            </label>

            <div class="property_text">
                <recaptcha:recaptcha theme="clean"/>
            </div>

            <div style="clear:both"></div>
        </div>

        <div class="property-line">
            <label class="caption"></label>

            <div class="property_text">
                <a href="" class="witty-button witty-button-medium">Save</a>
                <a href="" class="witty-button witty-button-medium" style="margin-left: 40px;">Cancel</a>

            </div>

            <div style="clear:both"></div>
        </div>
    </div>
    </div>

</content>
</g:applyLayout>