<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>青宇博客  - 管理员</title>

   	<link href="<%=basePath %>/ui/bootstrap/css/bootstrap.css" rel="stylesheet">
   	<link href="<%=basePath %>/ui/bootstrap/css/bootstrap-theme.css" rel="stylesheet">


    <link href="<%=basePath %>/ui/bootstrap/css/blog-home.css" rel="stylesheet">
    <script src="<%=basePath %>/ui/bootstrap/js/jquery-2.1.1.js"></script>
  </head>

  <body>
  <div id="wrapper">
  
