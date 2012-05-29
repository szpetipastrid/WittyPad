<%--
  Created by IntelliJ IDEA.
  User: szpetip
  Date: 5/25/12
  Time: 7:27 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <title><g:layoutTitle/></title>
      <link rel="shortcut icon" type="image/x-icon" href="${resource(dir: 'images', file: 'favicon.ico')}">
      <link rel="icon" type="image/x-icon" href="${resource(dir: 'images', file: 'favicon.ico')}">
      <analytics:code/>
      <g:layoutHead/>
  </head>
  <body>
<script type="text/javascript">
    var secondRemaining = 10;

    function countingBack() {
        var preString = "${message(code:'welcome.open.text.prefix')}";
        var postString = "${message(code:"welcome.open.text.postfix")}";
        $("#welcome-content-open-link").text(preString + " " + secondRemaining + " " + postString);
    }

    function countingBackTimer() {
        countingBack();
        if (secondRemaining > 0) {
            secondRemaining--;
            setTimeout('countingBackTimer()', 1000);
        } else {
            window.location = "${createLink(controller: 'home', action: 'desktop')}";
        }
    }

    $(function() {
        countingBackTimer();
    });
</script>

  <g:layoutBody/>
  </body>
</html>
