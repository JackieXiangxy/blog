<%@ page language="java" import="java.util.*" import="com.ust.myapp.model.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
User u = (User)request.getSession().getAttribute("user");
String errorAddMsg = (String)request.getSession().getAttribute("errorAddMsg");
 %>

<jsp:include page="../../ui/frame/Header.jsp"></jsp:include>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">   
          <a class="navbar-brand" href="<%=basePath %>index">青宇轻博客</a>
        </div>

        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav">
            <li><a href="<%=basePath %>/user/index">首页</a></li>
          </ul>
          
          <% if (null != u) { %>
          <ul class="nav navbar-nav">
            <li><a href="<%=basePath %>user/myblog?userId=<%=u.getId() %>">我的博客</a></li>
          </ul>
          
          <ul class="nav navbar-nav">
            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">博客管理<b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="<%=basePath %>article/manage?userId=<%=u.getId() %>"><i class="icon-cog"></i> 博文管理</a></li>
                    <li class="divider"></li>
                    <li><a href="<%=basePath %>category/manage?userId=<%=u.getId() %>"><i class="icon-cog"></i> 分类管理</a></li>
                    <li class="divider"></li>
                    <li><a href="<%=basePath %>comment/manage?userId=<%=u.getId()%>"><i class="icon-cog"></i> 评论管理</a></li>
                </ul>
            </li>
          </ul>
          <% } %>
          
          <% if (null == u) { %>
          <ul class="nav navbar-nav navbar-right">
          	<li><a href="<%=basePath%>login" target="_blank">登录</a></li>
          	<li><a href="<%=basePath%>register" target="_blank">注册</a></li>
          </ul>
          <% } else { %>
          <div class="pull-right">
                <ul class="nav pull-right">
                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">欢迎，<%=u.getUsername() %> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="<%=basePath %>user/profile?id=<%=u.getId() %>"><i class="icon-cog"></i> 编辑个人信息</a></li>
                            <% if (u.getIsApplied() == true) { %>
                            <li class="divider"></li>
                            <li><a href="<%=basePath %>user/bloginfo&?serId=<%=u.getId() %>"><i class="icon-cog"></i> 编辑博客信息</a></li>
                            <% } %>
                            <li class="divider"></li>
                            <li><a href="<%=basePath %>user/logout"><i class="icon-off"></i> 登出</a></li>
                        </ul>
                    </li>
                </ul>
          </div>
          <% } %>
          
        </div>
      </div>
    </nav>
    
    <% if (null != errorAddMsg) { %>
  	<div class="container">
  	<div class="alert alert-error"><%=errorAddMsg %></div>
  	</div>
  	<%     
  	       request.getSession().removeAttribute("errorAddMsg"); 
  	   } 
  	%>
    
    <div class="container "> 
		<ol class="breadcrumb">
             <li><a href="<%=basePath%>category/manage?userId=<%=u.getId() %>">分类管理</a></li>
             <li class="active">新建分类</li>
        </ol>  
         
    	<form class="form-horizontal" name="add_category_form" action="<%=basePath %>category/add" method="post" onsubmit="return isValidate(add_category_form)">
    	<div class="col-md-6">
    	<div class="from-group">
    		<label for="category_name">分类名：</label>
    		<input class="form-control" id="category_name" name="category_name" type="text">
    	</div>
    	
    	<div class="from-group">
    		<button id="add_category_submit" type="submit" class="btn btn-primary">保存</button>
    	</div>
    	</div>
    	</form>
    </div>
<jsp:include page="../../ui/frame/Footer.jsp"></jsp:include>

<script type="text/javascript">
function isValidate(form) {
	var category_name = form.category_name.value;
	
	if (category_name == "") {
		alert("请填写分类名！");	
		
		return false;
	}
	return true;
}
</script>