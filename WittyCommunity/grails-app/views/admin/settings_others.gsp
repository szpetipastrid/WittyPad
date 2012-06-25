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
    <ine:head/>
    <script src="${resource(dir: "js", file: "fileuploader.js")}"></script>
    <link href='${resource(dir: 'css', file: 'uploader.css')}' rel='stylesheet' type='text/css'>

</head>
<content tag="content">
    <g:set var="deleteButton" value="delete${WInstance.prop(witty,'prop_uri', 'all')}"/>

    <div class="title">
        Operations
    </div>
    <div class="key">Delete your witty</div>

    <div class="value">
        <a id="${deleteButton}" class="button sbutton dbutton">
            <g:message code="witty.plugin.community.create.button.delete"/></a>
    </div>

    <script type="text/javascript">
        function deleteWitty(address) {
            if (confirm("Delete Witty?\nAre you sure you want to delete this Witty?")) {
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

</content>