<%--
  Created by IntelliJ IDEA.
  User: szpetip
  Date: 5/14/12
  Time: 7:05 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<meta name="layout" content="${result != 'valid' ? 'ajax_response' : 'empty'}"/>

<g:if test="${result != 'valid'}">
    <g:set var="image" value="${resource(dir:'images', file:'form_field_invalid.png')}"/>
    <img src="${image}" alt="${resultMessage}" style="float:left;"/>

    <div class="error_tooltip">
        <a id="${id}" href="" original-title="${resultMessage}"><g:message code="witty.plugin.community.create.wizard.step.1.community.address.valid.why"/></a></div>
    <script type="text/javascript">
        $(function() {
            $("#${id}").tipsy({gravity: 's'});
        });
    </script>
</g:if>