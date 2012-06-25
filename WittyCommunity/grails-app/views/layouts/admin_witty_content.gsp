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
  Date: 6/22/12
  Time: 9:40 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<head>
    <link href='${resource(dir: 'css', file: 'admin.css')}' rel='stylesheet' type='text/css'>
    <link href='${resource(dir: 'css', file: 'admin-forms.css')}' rel='stylesheet' type='text/css'>
    <link href='${resource(dir: 'css', file: 'witty-forms.css')}' rel='stylesheet' type='text/css'>
    <g:layoutHead/>
</head>

<div style="float:right;width: 50px;">
</div>

<div style="margin-left: 205px;margin-right: 50px;display: block;">
    <g:pageProperty name="page.content"/>
</div>
