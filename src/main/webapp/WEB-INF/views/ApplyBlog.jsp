<%@ page language="java" import="java.util.*" import="com.ust.myapp.model.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
User u = (User)request.getSession().getAttribute("user");

String succMsg = (String)request.getSession().getAttribute("succMsg");
String errorMsg = (String)request.getSession().getAttribute("errorMsg");
 %>

<jsp:include page="${basePath }ui/frame/Header.jsp"></jsp:include>
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

				<% if ((null != u) && (u.getIsApplied() == true)) { %>
				<ul class="nav navbar-nav">
					<li><a
						href="<%=basePath %>user/myblog?userId=<%=u.getId() %>">我的博客</a></li>
				</ul>

				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">博客管理<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a
								href="<%=basePath %>article/manage?userId=<%=u.getId() %>"><i
									class="icon-cog"></i> 博文管理</a></li>
							<li class="divider"></li>
							<li><a
								href="<%=basePath %>category/manage?userId=<%=u.getId() %>"><i
									class="icon-cog"></i> 分类管理</a></li>
							<li class="divider"></li>
							<li><a
								href="<%=basePath %>comment/manage?userId=<%=u.getId()%>"><i
									class="icon-cog"></i> 评论管理</a></li>
						</ul></li>
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
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">欢迎，<%=u.getUsername()%> <b
								class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a
									href="<%=basePath %>user/profile?id=<%=u.getId()%>"><i
										class="icon-cog"></i> 编辑个人信息</a></li>
								<li class="divider"></li>
								<li><a href="<%=basePath %>user/logout"><i
										class="icon-off"></i> 登出</a></li>
							</ul></li>
					</ul>
				</div>
				<% } %>

			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<div class="container">
		<div class="row col-md-6">
			<form action="<%=basePath %>user/apply?userId=<%=u.getId() %>"
				onsubmit="return isValidate(blog_info_form)"
				method="post" role="form" class="form-horizontal"
				name="blog_info_form" id="blog_info_form"	
				>

				<% if (null != succMsg) { %>
				<div class="alert alert-success">
					<%=succMsg %>
				</div>
				<%     request.getSession().removeAttribute("succMsg");
			      	   } %>

				<% if (null != errorMsg) { %>
				<div class="alert alert-error">
					<%=errorMsg %>
				</div>
				<%    request.getSession().removeAttribute("errorMsg");
			      	   } %>
                <fieldset>
				<div class="form-group">
					<label for="bi.blogName"> 博客名称 </label>
					<input class="form-controls" name="bi.blogName" type="text" value="" id="blog_name">
				</div>

				<div class="form-group">
					<label for="bi.description"> 博客描述 </label>
					<input class="form-controls" name="bi.description" type="text" value="" id="blog_des">					
				</div>

				<div class="form-group">
					<label for="bi.annoucement"> 博客公告 </label>
					<textarea class="form-controls" id="bi.annoucement" name="annoucement" rows="5"></textarea>
				</div>

				<div class="form-group">				
				<button class="btn btn-primary" type="submit" class="">申请</button>
				</div>
				</fieldset>
			</form>

		</div>
	</div>



	<jsp:include page="${basePath }ui/frame/Footer.jsp"></jsp:include>

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