<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    // 获得本项目的地址(例如: http://localhost:8080/MyApp/)赋值给basePath变量 
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    // 将 "项目路径basePath" 放入pageContext中，待以后用EL表达式读出。 
    pageContext.setAttribute("basePath", basePath);
%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>博客系统</title>


   	<link href="${basePath}ui/bootstrap/css/bootstrap.css" rel="stylesheet">
   	<link href="${basePath}ui/bootstrap/css/bootstrap-theme.css" rel="stylesheet">
    <link href="${basePath}ui/bootstrap/css/blog-home.css" rel="stylesheet">
    <script src="${basePath}ui/bootstrap/js/jquery-2.1.1.js"></script>
  </head>
<body>