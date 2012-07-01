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
  Date: 6/20/12
  Time: 10:40 PM
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

    <div style="max-width: 850px;">
        <div style="width: 250px;min-height:256px;float:right; ">

            <div class="l overviewRightSide">
                <img src="${resource(dir: "images", file: "overview_ratings.png")}"/>
            </div>

            <div class="l overviewRightSide">
                <h2>Overview</h2>
                Visible to others: no<br>
                Completed profile: yes<br>
                Template set: no<br>


            </div>


            <div class="l overviewRightSide">
                <h2>Activities</h2>
                No activity available!
            </div>

        </div>

        <div class="overviewContent"
             style="display:block; max-width: 580px;position: absolute;padding-right: 20px;">
            <h2><g:message code="witty.plugin.admin.dashboard.overview"/></h2>

            This is overview
            <g:if test="${WInstance.prop(witty, 'prop_status','all') == 'new'}">
                <br>
                <b>This is a new Witty</b>, your Witty doesn't have any application. Your Witty won't be offered to other peoples or displayed on the wittypad main screen.

            </g:if>
        </div>

    </div>
</content>