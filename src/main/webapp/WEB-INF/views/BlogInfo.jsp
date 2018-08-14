<%@ page language="java" import="java.util.*" import="com.ust.myapp.model.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
User u = (User)request.getSession().getAttribute("user");
BlogInfo bi = (BlogInfo)request.getAttribute("bi");

String succUpdateMsg = (String)request.getSession().getAttribute("succUpdateMsg");
String errorUpdateMsg = (String)request.getSession().getAttribute("errorUpdateMsg");
 %>

<jsp:include page="../../ui/frame/Header.jsp"></jsp:include>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
         
          <a class="navbar-brand" href="<%=basePath %>/user/index">青宇轻博客</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav">
            <li><a href="<%=basePath %><%=basePath %>/user/index">首页</a></li>
          </ul>
          
          <% if ((null != u) && (u.getIsApplied() == true)) { %>
          <ul class="nav navbar-nav">
            <li><a href="<%=basePath %>user/myblog?userId=<%=u.getId() %>">我的博客</a></li>
          </ul>
          
          <ul class="nav navbar-nav">
            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">博客管理<b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="<%=basePath %>article/manage?userId=<%=u.getId() %>"><i class="glyphicon glyphicon-cog"></i> 博文管理</a></li>
                    <li class="divider"></li>
                    <li><a href="<%=basePath %>category/manage?userId=<%=u.getId() %>"><i class="glyphicon glyphicon-cog"></i> 分类管理</a></li>
                    <li class="divider"></li>
                    <li><a href="<%=basePath %>comment/manage?userId=<%=u.getId()%>"><i class="glyphicon glyphicon-cog"></i> 评论管理</a></li>
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
                            <li><a href="<%=basePath %>user/profile?userId=<%=u.getId()%>"><i class="glyphicon glyphicon-cog"></i> 编辑个人信息</a></li>
                            <% if (u.getIsApplied() == true) { %>
                            <li class="divider"></li>
                            <li><a href="<%=basePath %>user/bloginfo?userId=<%=u.getId() %>"><i class="glyphicon glyphicon-cog"></i> 编辑博客信息</a></li>
                            <% } %>
                            <li class="divider"></li>
                            <li><a href="<%=basePath %>logout"><i class="glyphicon glyphicon-off"></i> 登出</a></li>
                        </ul>
                    </li>
                </ul>
          </div>
          <% } %>
          
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container -->
    </nav>

	<% if (null != succUpdateMsg) { %>
	<div class="container">
   	<div class="alert alert-success">
   	<%=succUpdateMsg %>
   	</div></div>
   	<%     request.getSession().removeAttribute("succUpdateMsg");
   	   } %>
   
   	<% if (null != errorUpdateMsg) { %>
   	<div class="container">
   	<div class="alert alert-error">
   	<%=errorUpdateMsg %>
   	</div></div>
   	<%    request.getSession().removeAttribute("errorUpdateMsg");
   	   } %>
   	   
	<% if (null != bi) { %>
	<div class="container">
		<div class="row col-md-6">	       
	    		<form class="form-horizontal" action="<%=basePath %>user/updatebloginfo?userId=<%=u.getId() %>" method="post" class="form-horizontal" 
	    		name="blog_info_form" id="blog_info_form" onsubmit="return isValidate(blog_info_form)">   			
	    			
	    			 
	    				   				
    					<input class="form-control" name="${bi.id }" type="hidden" value="${bi.id}" id="blog_name">
	    			
	    			
	    			<div class="form-group">
	    				<label for="email">博客名称</label>	 
	    				   				
    					<input class="form-control" name="blog_name" type="text" value="${bi.blogName }" id="blog_name">
	    			</div>
	     
	    			<div class="form-group">
	    				<label for="address">博客描述</label>	    				
	    				<input class="form-control" name="blog_des" type="text" value="${bi.description }" id="blog_des">	    				
	    			</div>
	     
	    			<div class="form-group">
	    				<label for="zip">博客公告</label>	    					    				
                   		 <textarea class="form-control" name="annoucement" id="annoucement" rows="5">${bi.annoucement }
                   		 </textarea>                		
	    			</div>   		
	     
	    			<div class="form-group">
	    				<button type="submit" class="btn btn-primary">保存</button>
	    			</div>
	    		</form>
	    	</div>
		</div>
	
	<% } else { %>
	<%="读取博客信息出错！" %>
	<% } %>
<jsp:include page="../../ui/frame/Footer.jsp"></jsp:include>

<script type="text/javascript">
function isValidate(blog_info_form) {
	var blog_name = blog_info_form.blog_name.value;
	var description = blog_info_form.description.value;
	var annoucement = blog_info_form.annoucement.value;
	
	if (blog_name == "" || description == "" || annoucement == "") {
		alert("博客名称，博客描述，博客公告为必填项");	
		
		return false;
	}
	
	return true;
}
</script>