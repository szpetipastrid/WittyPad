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
  Date: 5/14/12
  Time: 7:05 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<meta name="layout" content="ajax_response"/>

<g:if test="${result != 'valid'}">
    ${resultMessage}
</g:if>