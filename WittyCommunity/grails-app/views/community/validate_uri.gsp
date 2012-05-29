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
<meta name="layout" content="${(result != 'valid' ? 'ajax_response' : 'empty')}"/>

<g:if test="${result != 'valid'}">
    <g:set var="image" value="${resource(dir:'images', file:'form_field_invalid.png')}"/>
    <img src="${image}" alt="${resultMessage}" style="float:left;"/>

    <div class="error_tooltip">
        <a id="${id}" original-title="${resultMessage}"><g:message code="witty.plugin.community.create.wizard.step.1.community.address.valid.why"/></a></div>
    <script type="text/javascript">
        $(function() {
            $("#${id}").tipsy({gravity: 's'});
        });
    </script>
</g:if>