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
  Time: 12:12 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <title>Error</title>
      <meta name="layout" content="admin"/>
      <style type="text/css">
          .error-display {
              position: absolute;
              width: 400px;
              top:150px;
              left: 50%;
              margin-left: -210px;
              padding: 20px;
          }
      </style>
  </head>
  <body>

  <div class="error-display l">
      ${message}

  </div>

  </body>
</html>