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
            // Smart Wizard
            $('#wizard').smartWizard({onLeaveStep:leaveAStepCallback, onFinish:onFinishCallback});

            function leaveAStepCallback(obj) {
                var step_num = obj.attr('rel'); // get the current step number
                return validateSteps(step_num); // return false to stay on step and true to continue navigation
            }

            function onFinishCallback() {
                if (validateAllSteps()) {
                    $('form').submit();
                }
            }

            // Your Step validation logic
            function validateSteps(stepNumber) {
                var isStepValid = true;
                // validate step 1
                if (stepNumber == 1) {
                    var d = $("#community_uri_valid").text();
                    if (d != '') {
                        return false;
                    }
                    return true;
                }
                return true;
                // ...
            }

            function validateAllSteps() {
                var isStepValid = true;
                // all step validation logic
                return isStepValid;
            }

            $('.buttonPrevious').html("${message(code:"witty.plugin.community.create.wizard.previous")}");
            $('.buttonNext').html("${message(code:"witty.plugin.community.create.wizard.next")}");
            $('.buttonFinish').html("${message(code:"witty.plugin.community.create.wizard.finish")}");

            $("#community_name").blur(function() {
                checkCommunityName();
            });

            $("#community_uri").blur(function() {
                checkCommunityURI();
            });
        });
    </script>
</head>

<body>
<div class="smart-wizard-container ui-widget-content">
    <div class="smart-wizard-content">
        <!-- Smart Wizard -->
        <div id="wizard" class="swMain">
            <ul style="display:none">
                <li><a href="#step-1">
                    <span class="stepDesc">
                        <g:message code="witty.plugin.community.create.wizard.step" args="[1]"/><br/>
                        <small><g:message code="witty.plugin.community.create.wizard.step.1.title"/></small>
                    </span>
                </a></li>
                <li><a href="#step-2">
                    <span class="stepDesc">
                        <g:message code="witty.plugin.community.create.wizard.step" args="[2]"/><br/>
                        <small><g:message code="witty.plugin.community.create.wizard.step.2.title"/></small>
                    </span>
                </a></li>
            </ul>

            <div id="step-1">
                <h1><g:message code="witty.plugin.community.create.wizard.step.1.title"/></h1>
                <g:message code="witty.plugin.community.create.wizard.step.1.text"/>
                <div class="wizard-form step1-form">
                    <label class="ltitle"><g:message
                            code="witty.plugin.community.create.wizard.step.1.name.your.community"/></label>
                    <input id="community_name" type="text" class="form-input">

                    <div class="postfix"><g:message
                            code="witty.plugin.community.create.wizard.step.1.name.your.community.postfix"/></div>

                    <div id="community_name_valid" class="postfix"></div>

                    <label class="ltitle"><g:message
                            code="witty.plugin.community.create.wizard.step.1.give.your.community.address"/></label>
                    <input id="community_uri" type="text" class="form-input">

                    <div class="postfix"><g:message
                            code="witty.plugin.community.create.wizard.step.1.give.your.community.address.postfix"/></div>

                    <div id="community_uri_valid" class="postfix"></div>
                    <label class="ltitle"><g:message
                            code="witty.plugin.community.create.wizard.step.1.default.language"/></label>
                    <input type="text" class="form-input">
                </div>

            </div>

            <div id="step-2">
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
                        for="visibilityRadioFullOpen"><g:message code="witty.plugin.community.create.wizard.step.2.share.everybody"/></label>
                    <g:radio id="visibilityRadioPublic" value="public" name="visibility"
                             checked="${visibility=='public'}"/><label
                        for="visibilityRadioPublic"><g:message code="witty.plugin.community.create.wizard.step.2.share.everybody.read"/></label>
                    <g:radio id="visibilityRadioPrivate" value="private" name="visibility"
                             checked="${visibility=='private'}"/><label for="visibilityRadioPrivate"><g:message code="witty.plugin.community.create.wizard.step.2.share.nobody"/></label>
                </div>
                <script type="text/javascript">
                    $(function() {
                        $("#visibilityRadio").buttonset();
                    });
                </script>
                <label class="ltitle"><g:message code="witty.plugin.community.create.wizard.step.2.short.description"/></label>
                <g:textArea name="description" rows="" cols="" class="form-input"/>
            </div>
        </div>
        <!-- End SmartWizard Content -->
    </div>
</div>

</body>
</html>