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
  Date: 6/25/12
  Time: 4:06 PM
--%>
<%@ page import="hu.kovex.witty.plugin.core.domain.WInstance" contentType="text/html;charset=UTF-8" %>
<head>
    <meta name="layout" content="admin_witty_content"/>
    <jqe:jQueryResources/>
</head>
<content tag="content">
    <div class="admin-form">
        <h2><g:message code="witty.plugin.admin.dashboard.operations"/></h2>

        <div class="key">
            <g:message code="witty.plugin.community.delete.text"/>
        </div>

        <g:set var="deleteButton" value="delete${WInstance.prop(witty,'prop_uri', 'all')}"/>

        <div class="value"><a id="${deleteButton}" class="button sbutton dbutton">
            <g:message code="witty.plugin.community.create.button.delete"/></a></div>
        <script type="text/javascript">
            function deleteWitty(address) {
                if (confirm("${message(code:'witty.plugin.community.delete.confirmation')}")) {
                    $.getJSON("${createLink(controller:"community", action:"delete")}?id=" + address, function(data) {
                        window.location = "http://${createLink(controller:"admin",base:mainDomain)}";
                    }, 'json');
                }
            }
            $(function() {
                $("#${deleteButton}").click(function() {
                    deleteWitty("${WInstance.prop(witty,'prop_uri', 'all')}");
                });
            })
        </script>


        <g:if test="${WInstance.prop(witty,'prop_status','all') == 'new'}">

            <div class="admin-divider"></div>

            <div class="key"><g:message code="witty.plugin.community.activate.text"/></div>

            <div class="value" style="margin-left: 200px;">
                <a id="activateWittyButton" class="button nbutton dbutton"><g:message code="witty.plugin.community.button.activate"/></a>
            </div>
            <script type="text/javascript">
                $("#activateWittyButton").click(function() {
                    $.getJSON("${createLink(controller: "community", action: "save_property", params: [property: 'prop_status', value:'empty', address: WInstance.prop(witty, 'prop_uri', 'all')])}",
                            function() {
                                alert("${message(code:"witty.plugin.community.activated")}");
                                window.location = "${createLink(controller:'admin', action:'index')}";
                            }
                    );
                });
            </script>
        </g:if>
    </div>

    <div style="margin-bottom: 30px;"></div>

</content>