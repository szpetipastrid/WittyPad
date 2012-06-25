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
  Time: 8:22 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<jqe:jQueryResources/>

<head><title><sh:winstance obj="${witty}" val="prop_name"/></title></head>
<content tag="title">
    <div class="title t" style="line-height: 70px;float:left;"><sh:winstance obj="${witty}" val="prop_name"/> -</div>

    <div id="adminSubtitle" class="title h" style="padding-left:10px;line-height: 70px;"></div>
</content>

<body>

<script type="text/javascript">


    function showOverview() {
        setAdminSubTitle("Overview");
        $("#wittyAdminContent").load('${createLink(controller:"admin", action:"overview")}');
        window.location.hash = "overview";
    }

    function showBasicSettings() {
        setAdminSubTitle("Settings");
        $("#wittyAdminContent").load('${createLink(controller:"admin", action:"settings_basic")}');
        window.location.hash = "settings";
    }

    function showOthersSettings() {
        setAdminSubTitle("Others");
        $("#wittyAdminContent").load('${createLink(controller:"admin", action:"settings_others")}');
        window.location.hash = "others";
    }

    $(function() {
        if (window.location.hash == "#overview") {
            showOverview();
        } else if (window.location.hash == "#settings") {
            showBasicSettings();
        } else if (window.location.hash == "#others") {
            showOthersSettings();
        } else {
            showOverview();
        }


        $("#overviewButton").click(function() {
            showOverview();
        });
        $("#settingsButton").click(function() {
            showBasicSettings();
        });
        $("#othersButton").click(function() {
            showOthersSettings();
        });

    });
    function setAdminSubTitle(subTitle) {
        document.title = "${sh.winstance(obj:witty,val:'prop_name')} Witty Dashboard - " + subTitle;
        $("#adminSubtitle").text(subTitle);
    }


</script>

<div class="adminMenu">
    <a id="overviewButton" class="overview t">Overview</a>
    <a id="layoutButton" class="layout t">Layout</a>
    <a id="settingsButton" class="settings t">Settings</a>
    <a id="othersButton" class="settings t">Others</a>
</div>

<div id="wittyAdminContent" class="wittyAdminContent"></div>
</body>