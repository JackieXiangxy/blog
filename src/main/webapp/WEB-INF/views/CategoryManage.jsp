<%@ page language="java" import="java.util.*" import="com.ust.myapp.model.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
User u = (User)request.getSession().getAttribute("user");
String succAddMsg = (String)request.getSession().getAttribute("succAddMsg");	//新建分类消息
String errorAddMsg = (String)request.getSession().getAttribute("errorAddMsg");

String succDeleMsg = (String)request.getSession().getAttribute("succDeleMsg");	//删除分类消息
String errorDeleMsg = (String)request.getSession().getAttribute("errorDeleMsg");

String succUpdateMsg = (String)request.getSession().getAttribute("succUpdateMsg");	//更新分类消息
String errorUpdateMsg = (String)request.getSession().getAttribute("errorUpdateMsg");
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
            <li><a href="<%=basePath %>index">首页</a></li>
          </ul>
          
          <% if (null != u) { %>
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
                            <li><a href="<%=basePath %>user/profile?userId=<%=u.getId() %>"><i class="glyphicon glyphicon-cog"></i> 编辑个人信息</a></li>
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
          
        </div>
      </div>
    </nav>

	<%-- 新建分类结果提示消息 --%>
  	<% if (null != succAddMsg) { %>
  	<div class="container">
  	<div class="alert alert-success"><%=succAddMsg %></div>
  	</div>
  	<% 
  	       request.getSession().removeAttribute("succAddMsg");
  	   } 
  	%>
  	  	
  	<%-- 删除分类结果提示消息 --%>
  	<% if (null != succDeleMsg) { %>
  	<div class="container">
  	<div class="alert alert-success"><%=succDeleMsg %></div>
  	</div>
  	<% 
  	       request.getSession().removeAttribute("succDeleMsg");
  	   } 
  	%>
  	
  	<% if (null != errorDeleMsg) { %>
  	<div class="container">
  	<div class="alert alert-error"><%=errorDeleMsg %></div>
  	</div>
  	<%     
  	       request.getSession().removeAttribute("errorDeleMsg"); 
  	   } 
  	%>
  	
  	<%-- 更新分类的结果提示消息 --%>
  	<% if (null != succUpdateMsg) { %>
  	<div class="container">
  	<div class="alert alert-success"><%=succUpdateMsg %></div>
  	</div>
  	<%     
  	       request.getSession().removeAttribute("succUpdateMsg"); 
  	   } 
  	%>
  	
  	<% if (null != errorUpdateMsg) { %>
  	<div class="container">
  	<div class="alert alert-error"><%=errorUpdateMsg %></div>
  	</div>
  	<%     
  	       request.getSession().removeAttribute("errorUpdateMsg"); 
  	   } 
  	%>

	<% if (null != u) { %>
	<div class="container">
		<div class="btn-toolbar">
		    <a class="btn btn-primary" href="<%=basePath %>category/addCategory">新建分类</a>
		</div>
		<div class="well">
			<table class="table">
				<thead>
				<tr>
					<th>分类名称</th>
					<th>包含文章数量</th>
					<th style="width: 50px;">操作	</th>
				</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${pc!=null }">
						<c:forEach items="${pc.list }" var="cg">
						<c:if test="${cg.isDelete == false}">
							<tr>
							
								<td>${cg.categoryName }</td>
								<td>${cg.articals }</td>
								<td>
									<c:choose>
										<c:when test="${cg.categoryName eq '无分类' }">
											<c:out value="系统"></c:out>
										</c:when>
										<c:otherwise>
											<a href="<%=basePath %>category/edit?cgId=${cg.id}"><i class="glyphicon glyphicon-pencil"></i></a>
											<a href="<%=basePath %>category/updateToDelete?cgId=${cg.id }"><i class="glyphicon glyphicon-remove"></i></a>
										</c:otherwise>
									</c:choose>
								</td>
								
							</tr>
							</c:if>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:out value="没有查询到分类"></c:out>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div>

		<div>
			<!-- pager -->
			<ul class="pager">
				<c:if test="${pc.curPage > 1}">
					<li class="previous"><a href="<%=basePath%>category/manage?userId=${user.id }&curPage=<c:out value="${pc.curPage-1}"/>">&larr; 上一页</a></li>
				</c:if>
				<c:if test="${pc.curPage< pc.totalPages}">
					<li class="next"><a href="<%=basePath%>category/manage?userId=${user.id }&curPage=<c:out value="${pc.curPage+1}"/>">下一页  &rarr;</a></li>
				</c:if>
			</ul>
		</div>



	</div>	
	<% } %>
	
<jsp:include page="../../ui/frame/Footer.jsp"></jsp:include>

<script type="text/javascript">
function dele(deleUrl) {
	
	if (confirm("你确定要删除该分类吗？")) {
		location.href = deleUrl;
	}
}
</script>