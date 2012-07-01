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
  Time: 4:32 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title><g:message code="witty.plugin.community.admin.dashboard.title"/></title>
    <jqe:jQueryResources/>
</head>
 <content tag="title">
    <div class="title t" style="line-height: 70px;float:left;">Account Home</div>
</content>
<body>
<div style="width: 100%;">
    <div id="wittyList"></div>

    <div id="interestsList"></div>
    <script>
        $(function() {
            $("#wittyList").load("${createLink(controller:"admin", action:"wittyList")}");
            $("#interestsList").load("${createLink(controller:"admin", action:"my_interests")}");
        });
    </script>
</div>

</body>
</html>