<%@ page language="java" import="java.util.*" import="com.ust.myapp.model.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	Admin admin = (Admin) request.getSession().getAttribute("admin");
	
%>

<jsp:include page="frame/Header.jsp"></jsp:include>

<% if (null != admin) { %>
      <div class="container">
      <div class="col-lg-12">	
      <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">      
        <div class="navbar-header">
          <a class="navbar-brand" href="<%=basePath%>admin/index">青宇轻博客管理系统</a>
        </div>      
        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav side-nav">
            <li class="active"><a href="<%=basePath %>admin/index"><i class="glyphicon glyphicon-dashboard"></i> 控制面板</a></li>
            <li><a href="<%=basePath %>admin/useradmin"><i class="glyphicon glyphicon-cog"></i> 用户管理</a></li>
            <li><a href="<%=basePath %>admin/sysArticalAdmin"><i class="glyphicon glyphicon-cog"></i> 文章管理</a></li>
            <li><a href="<%=basePath %>admin/sysCategoryAdmin"><i class="glyphicon glyphicon-edit"></i> 分类管理</a></li>
            
          </ul>

          <ul class="nav navbar-nav navbar-right navbar-user">
            <li class="dropdown user-dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i> ${admin.getUsername() } <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#"><i class="glyphicon glyphicon-cog"></i> 设置</a></li>
                <li class="divider"></li>
                <li><a href="<%=basePath%>admin/logout"><i class="glyphicon glyphicon-off"></i> 登出</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </nav>
     </div>
     
	<div id="page-wrapper">

        <div class="row">
          <div class="col-lg-12">
            <h1>青宇轻博客 <small>基于SpringMVC+Mybatis技术构建</small></h1>
            <ol class="breadcrumb">
              <li class="active"><i class="glyphicon glyphicon-dashboard"></i> 控制面板</li>
            </ol>
            
          <div class="row">
	        <div class="col-lg-3">
	            <div class="panel panel-info">
	              <div class="panel-heading">
	                <div class="row">
	                  <div class="col-xs-6">
	                    <i class="glyphicon glyphicon-search"></i>
	                  </div>
	                  <div class="col-xs-6 text-right">
	                  
	                    <p class="announcement-heading">${counter.num}</p>
	                    <p class="announcement-text">网站来访人数</p>
	                  </div>
	                </div>
	              </div>
	            </div>
            </div>
            
            <div class="col-lg-3" >
	            <div class="panel panel-success">
	              <div class="panel-heading">
	                <div class="row">
	                  <div class="col-xs-6">
	                    <i class="glyphicon glyphicon-edit"></i>
	                  </div>
	                  <div class="col-xs-6 text-right">
	                    <p class="announcement-heading">${articleCount}</p>
	                    <p class="announcement-text">文章总数</p>
	                  </div>
	                </div>
	              </div>
	            </div>
            </div>
            
            <div class="col-lg-3">
            <div class="panel panel-warning">
              <div class="panel-heading">
                <div class="row">
                  <div class="col-xs-6">
                    <i class="glyphicon glyphicon-envelope"></i>
                  </div>
                  <div class="col-xs-6 text-right">
                    <p class="announcement-heading">${cmtCount}</p>
                    <p class="announcement-text">评论总数</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
            
            
            <div class="col-lg-3">
            <div class="panel panel-danger">
              <div class="panel-heading">
                <div class="row">
                  <div class="col-xs-6">
             		  <i class="glyphicon glyphicon-user"></i>
                  </div>
                  <div class="col-xs-6 text-right">
                    <p class="announcement-heading">${userCount}</p>
                    <p class="announcement-text">注册会员数</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
                      
           </div>

         </div>
        </div>

    </div>
    </div>
<% } else { %>
<%-- 404 page --%>
<% } %>
<jsp:include page="frame/Footer.jsp"></jsp:include>