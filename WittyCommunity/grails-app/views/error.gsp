<!doctype html>
<html>
<head>
    <title>Grails Runtime Exception</title>
    <meta name="layout" content="main">
    <link rel="stylesheet" href="%{--
  - Copyright (c) 2012. Witty Project.
  - Peter Szilagyi
  - szpetip@gmail.com
  -
  - Witty is a a knowledge-management, open source community portal.
  - Witty is available under the http://wittypad.com.
  - Witty is a free software distributed under the GNU General Public Licence.
  - Witty and WittyPad are the name of the software, please do not use it to other purposes.
  --}%

${resource(dir: 'css', file: 'errors.css')}" type="text/css">
</head>

<body>
<g:renderErrors exception="${exception}"/>
</body>
</html>