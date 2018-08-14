<%@ page language="java" import="java.util.*" import="com.ust.myapp.model.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
User u = (User)request.getSession().getAttribute("user");
String succMsg = (String)request.getSession().getAttribute("succMsg");
String errorMsg = (String)request.getSession().getAttribute("errorMsg");
%>

<jsp:include page="../../ui/frame/Header.jsp"></jsp:include>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="<%=basePath %>index">青宇轻博客</a>
        </div>      
        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav">
            <li><a href="<%=basePath %>index">首页</a></li>
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
          	<li><a href="<%=basePath %>login" target="_blank">登录</a></li>
          	<li><a href="<%=basePath %>register" target="_blank">注册</a></li>
          </ul>
          <% } else { %>
          <div class="pull-right">
                <ul class="nav pull-right">
                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">欢迎，<%=u.getUsername() %> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="<%=basePath %>user/profile?id=<%=u.getId() %>"><i class="icon-cog"></i> 编辑个人信息</a></li>
                            <% if (u.getIsApplied() == true) { %>
                            <li class="divider"></li>
                            <li><a href="<%=basePath %>user/bloginfo?userId=<%=u.getId() %>"><i class="icon-cog"></i> 编辑博客信息</a></li>
                            <% } %>
                            <li class="divider"></li>
                            <li><a href="<%=basePath %>logout"><i class="icon-off"></i> 登出</a></li>
                        </ul>
                    </li>
                </ul>
          </div>
          <% } %>
          
        </div>
      </div>
    </nav>
        
    <% if (null != succMsg) { %>
  	<div class="container">
  	<div class="alert alert-success"><%=succMsg %></div>
  	</div>
  	<% 
  	       request.getSession().removeAttribute("succMsg");
  	   } 
  	%>
  	
  	<% if (null != errorMsg) { %>
  	<div class="container">
  	<div class="alert alert-error"><%=errorMsg %></div>
  	</div>
  	<%     
  	       request.getSession().removeAttribute("errorMsg"); 
  	   } 
  	%>
  	    
    <% if ((null != u) ) { %>
	<div class="container">
		<div class="row col-md-12">
			<div class="col-md-12">
			   <div class="col-md-12">					
					<ol class="breadcrumb">
		              <li><a href="<%=basePath%>article/manage?userId=<%=u.getId() %>">博文管理</a></li>
		              <li class="active">编辑文章</li>
		            </ol>
	            </div>
	            <form class="form-horizontal " action="<%=basePath %>article/saveupdate?artId=${art.id }" name="update_artical_form"  method="post">
	                 <input type="hidden" name="artId" value="${art.id }">

	                <div class="col-md-6">                   
	                    <div class="form-group">
	                    <label for="title">标题</label>
	                   
	                    <input class="form-control" id="name" name="title" type="text" value="${art.title }">
	                    </div>
	                   
	                    <div class="form-group">
	                    <label for="sys_category">系统分类</label>
	                        <select class="form-control" id="subject" name="sys_category" class="span3">
	                           
	                           <c:forEach items="${scgList}" var="sc">
	    					   <option value="${sc.id }" selected>${sc.categoryName}</option>            	                    
	                           
	                           </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">   
                        <label for="category">个人分类</label>
                        	<select class="form-control"  id="subject" name="category">
                            <c:forEach items="${cgList }" var="cg">
                            <option value="${cg.id }" selected>${cg.categoryName}</option>
                            </c:forEach>
                            
                        	</select>
	                </div>
	                <div class="form-group">
	                    <textarea class="form-control" id="message" name="summary" class="span6" placeholder="摘要" rows="5">${art.summary }</textarea>
	                </div>
	                
	                <div class="form-group">
	                    <textarea class="form-control" id="message" name="content" class="span6" placeholder="文章内容" rows="5">${art.content }</textarea>
	                </div>
	                  
	                <div class="form-group">
	                    <button id="contact-submit" type="submit" class="btn btn-primary input-medium pull-right">保存</button>
	                </div>
	                </div>
	            </form>
	        </div>
		</div>
	</div>
	<% } %>
	
<jsp:include page="../../ui/frame/Footer.jsp"></jsp:include>