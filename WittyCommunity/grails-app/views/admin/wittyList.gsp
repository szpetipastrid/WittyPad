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
  Date: 6/17/12
  Time: 4:54 PM
--%>

<%@ page import="hu.kovex.witty.plugin.core.domain.WInstance" contentType="text/html;charset=UTF-8" %>
<meta name="layout" content="admin_home_content"/>
<content tag="common">
    <jqe:jQueryResources/>
    <script type="text/javascript">
        function reloadWittyList() {
            if (document.getElementById("wittyList") != null) {
                $("#wittyList").load("${createLink(controller:"admin", action:"wittyList")}");
            } else {
                window.location.reload();
            }
        }
        $(function() {
            $("#newWittyButton").click(function() {
                $("#createWittyContainer").load('${createLink(controller:"community",action:"create")}');
            });
        })

    </script>

</content>

<content tag="sideMenu">
    <div id="createWittyContainer"></div>

    <div>
        <a id="newWittyButton" class="button sbutton"
           style="width: 120px;margin-left: 30px;margin-top: 15px;"><g:message
                code="witty.plugin.community.create.button.new.witty"/></a>

        <div class="t" style="clear: both;padding-top: 20px;">
            <ul>
                <li><a href="">All (${wittyList.size()})</a></li>
                <li><a href="">New (${wittyList.size()})</a></li>
            </ul>

        </div>
    </div>
</content>
<content tag="content">
    <div class="wittyListContainer">
        <g:each in="${wittyList}">
            <div class="wittyListElement hbg">
                <div class="wittyListElementTitle">
                    <span class="subTitle t"><a href=""><sh:winstance obj="${it}" val="prop_name"/></a></span><br>

                    <div style="clear: both;">
                        <g:message code="witty.plugin.community.create.witty.address.label"/> <a href=""><sh:winstance
                            obj="${it}" val="prop_uri"/>.wittypad.com</a>
                    </div>
                </div>

                <div class="wittyListElementButtons">
                    <g:set var="openButton" value="open${WInstance.prop(it,'prop_uri', 'all')}"/>
                    <g:set var="dashboardButton" value="dashboard${WInstance.prop(it,'prop_uri', 'all')}"/>

                    <a id="${dashboardButton}" class="button nbutton dbutton">
                        <g:message code="witty.plugin.community.create.button.dashboard"/></a>
                    <a id="${openButton}" class="button sbutton dbutton">
                        <g:message code="witty.plugin.community.create.button.view.witty"/></a>

                    <script type="text/javascript">
                        $(function() {
                            $("#${openButton}").click(function() {
                                <g:set var="baseUrl" value="http://${WInstance.prop(it,'prop_uri', 'all')}.${mainDomain}"/>
                                window.location = '${baseUrl}';
                            });
                            $("#${dashboardButton}").click(function() {
                                <g:set var="baseUrl" value="http://${WInstance.prop(it,'prop_uri', 'all')}.${mainDomain}"/>
                                window.location = '${createLink(controller:"admin", action:"index", base:baseUrl)}';
                            });
                        })
                    </script>

                </div>

                <div>
                    <sh:winstance obj="${it}" val="prop_description"/>
                </div>
                <g:if test="${WInstance.prop(it,'prop_status', 'all') == 'new'}">
                    <div class="newlyCreatedWittyInformation">
                        <div class="bubbleText l">
                            To start using this Witty, some additional information required. Click to the Set up Witty button
                            to complete your witty creation!
                        </div>
                    </div>
                </g:if>
            </div>
        </g:each>
    </div>
</content>
