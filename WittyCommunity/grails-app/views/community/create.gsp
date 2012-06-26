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
<meta name="layout" content="admin_simple_content"/>
<g:javascript library="jquery"/>
<jqe:jQueryResources/>
<link href='${resource(dir: 'css', file: 'create-witty.css')}' rel='stylesheet' type='text/css'>

<div id="popUpBackground" class="popUpBackground">
</div>

<div id="createWittyWindow" class="create-witty-window">
    <div class="windowButtons">
        <a id="closeCrateWittyButton" class="closeWindowButton"></a>
    </div>

    <div class="create-witty-window-content">
        <h1 class="t"><g:message code="witty.plugin.community.create.title"/></h1>
        <wittyForm:showMore
                shortMessage="${message(code:'witty.plugin.community.create.text')}"
                longMessage="${message(code:'witty.plugin.community.create.text.more')}"/>
        <g:form name="createWittyForm">
            <div class="create-witty-form">
                <div id="communityTitleValidity" class="error_place"></div>

                <div class="key">
                    <g:message code="witty.plugin.community.create.witty.title"/>
                </div>

                <div class="value">
                    <g:textField name="name" value="${community?.name}" id="communityTitleField"/>
                </div>

                <div id="communityAddressValidity" class="error_place"></div>

                <div class="key">
                    <g:message code="witty.plugin.community.create.witty.address"/>
                </div>

                <div class="value">
                    <g:textField name="address" value="${community?.address}" id="communityAddressField"
                                 class="addressBackground"/>
                </div>

                <div class="key">

                </div>

                <div class="value" style="text-align: right;">
                    <g:submitToRemote name="create"
                                      value="${message(code:'witty.plugin.community.create.button.create')}"
                                      url="[controller:'community', action:'save']" asynchronous="true"
                                      onSuccess="wittySuccessfullyCreated(data);"
                                      class="button nbutton"/>
                    <a id="createWittyCancelButton" class="button sbutton"><g:message
                            code="witty.plugin.community.create.button.cancel"/></a>
                </div>

                <div style="clear:both;"></div>

            </div>
        </g:form>
    </div>
</div>
<script type="text/javascript">

    function closeCreateWittyWindow() {
        $("#popUpBackground").remove();
        $("#createWittyWindow").remove();
    }

    function checkWittyName() {
        var text = $("#communityTitleField").val();
        var url = "${createLink(controller:'community', action:'validate_property', params:[property:'name'])}&value=" + encodeURIComponent(text);
        $("#communityTitleValidity").load(url);
    }

    function checkWittyAddress() {
        var text = $("#communityAddressField").val();
        var url = "${createLink(controller:'community', action:'validate_property', params:[property:'address'])}&value=" + text;
        $("#communityAddressValidity").load(url);
    }

    $(document).ready(function () {
        document.getElementById("communityTitleField").focus();
        $("#communityTitleField").keyup(function () {
            checkWittyName();
        });

        $("#communityAddressField").keyup(function () {
            checkWittyAddress();
        });

        $("#closeCrateWittyButton").click(function () {
            closeCreateWittyWindow();
        });

        $("#createWittyCancelButton").click(function () {
            closeCreateWittyWindow();
        });
    });

    function wittySuccessfullyCreated(data) {
        if (data.result.status == "success") {
            closeCreateWittyWindow();
            reloadWittyList();
        } else {
            checkWittyAddress();
            checkWittyName();
            alert("Creation failed!\n\nPlease check the restrictions.");
        }
    }
</script>