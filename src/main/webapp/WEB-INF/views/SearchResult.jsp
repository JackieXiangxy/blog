<%@ page language="java" import="java.util.*" import="java.text.*" import="com.ust.myapp.model.*"
pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
User u = (User)request.getSession().getAttribute("user");
List<Category> cgList = (List<Category>)request.getAttribute("cgList");
List<Article> artList = (List<Article>)request.getAttribute("artList");

String q = (String)request.getAttribute("q");
%>
<jsp:include page="../../ui/frame/Header.jsp"></jsp:include>

  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
         <a class="navbar-brand" href="<%=basePath %>index">青宇博客</a>
        </div>

        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav">
            <li><a href="<%=basePath%>index">网站首页</a></li>
          </ul>
          
          <%
                    	if (null != u) {
                    %>
          <ul class="nav navbar-nav">
            <li><a href="<%=basePath%>user/myblog?userId=<%=u.getId()%>">我的博客</a></li>
          </ul>
          
          <ul class="nav navbar-nav">
            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">博客管理<b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="<%=basePath%>article/manage?userId=<%=u.getId()%>"><i class="icon-cog"></i> 博文管理</a></li>
                    <li class="divider"></li>
                    <li><a href="<%=basePath%>category/manage?userId=<%=u.getId()%>"><i class="icon-cog"></i> 分类管理</a></li>
                    <li class="divider"></li>
                    <li><a href="<%=basePath%>comment/manage?userId=<%=u.getId()%>"><i class="icon-cog"></i> 评论管理</a></li>
                </ul>
            </li>
          </ul>
          <%
          	}
          %>
          
          <%
                    	if (null == u) {
                    %>
          <ul class="nav navbar-nav navbar-right">
          	<li><a href="<%=basePath %>login" target="_blank">登录</a></li>
          	<li><a href="<%=basePath %>register" target="_blank">注册</a></li>
          </ul>
          <%
          	} else {
          %>
          <div class="pull-right">
                <ul class="nav pull-right">
                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">欢迎，<%=u.getUsername()%> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="<%=basePath%>user/profile?userId=<%=u.getId()%>"><i class="icon-cog"></i> 编辑个人信息</a></li>
                            <%
                            	if (u.getIsApplied() == true) {
                            %>
                            <li class="divider"></li>
                            <li><a href="<%=basePath%>user/bloginfo?userId=<%=u.getId()%>"><i class="icon-cog"></i> 编辑博客信息</a></li>
                            <%
                            	}
                            %>
                            <li class="divider"></li>
                            <li><a href="<%=basePath%>logout"><i class="icon-off"></i> 登出</a></li>
                        </ul>
                    </li>
                </ul>
          </div>
          <%
          	}
          %>
          
        </div>
      </div>
    </nav>

    <div class="container">

      <div class="row">
        <div class="col-lg-8">

          <p class="lead">
			搜索关键字：<b><i>
			</i></b>
          </p>
          <hr>
          <p class="lead">
          	搜索结果列表：
          </p>
            <c:forEach items="${artList}" var="art">

 		  <h4>
 		  <a href="<%=basePath%>comment/post?artId=${art.id}&userId=${art.user.id}" target="_blank">${art.title}</a>
 		  </h4>        	

            </c:forEach>
        </div>
      </div>
    </div>
    
<jsp:include page="../../ui/frame/Footer.jsp"></jsp:include>
