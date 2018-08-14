<%@ page language="java" import="java.util.*" import="com.ust.myapp.model.*"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
    User u = (User)request.getSession().getAttribute("user");
    Boolean notFound = (Boolean)request.getAttribute("notFound");

    String succDeleMsg = (String)request.getSession().getAttribute("succDeleMsg");
    String errorDeleMsg = (String)request.getSession().getAttribute("errorDeleMsg");

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

<%-- 删除评论的提示消息 --%>
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

    <% if (null != u) { %>
<div class="container">
    <div class="well">
        <table class="table">
            <thead>
            <tr>
                <th>评论内容</th>
                <th>文章作者</th>
                <th>评论的文章标题</th>
                <th>评论时间</th>
                <th>评论状态<th/>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pc.list }" var="cmt">
                <tr>
                    <td>${cmt.content}</td>
                    <td>${cmt.article.user.username}</td>
                   	<td><a href="<%=basePath%>comment/post?artId=${cmt.article.id}&userId=${cmt.user.id}" target="_blank">${cmt.article.title}</a>
                    </td>
                    <td>${cmt.time}</td>
                    <!--评论状态  -->
                    <td>
                    <c:choose>
                    <c:when test="${cmt.isDelete==false}">		     
		          		<span class="label label-success">未删除</span>
		          	</c:when>
		          			<c:otherwise>
		          	<span class="label label-danger">已删除</span>
		          		    </c:otherwise>
		          	</c:choose> 
                    </td>
                    <td>
                    <c:choose> 
		          	<c:when test="${cmt.isDelete==true}">
		          	<a href="<%=basePath %>comment/active?cmtId=${cmt.id}&userId=${user.id}" class="btn btn-success btn-xs">恢复评论</a>	
		          	</c:when>
		          	<c:otherwise>
		          	<a href="<%=basePath %>comment/delete?cmtId=${cmt.id}&userId=${user.id}" class="btn btn-danger btn-xs">删除评论</a>	
		          	</c:otherwise>
		          	</c:choose>
                    </td>
                  
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>


    <div>
        <!-- pager -->
        <ul class="pager">
            <c:if test="${pc.curPage > 1}">
                <li class="previous"><a href="<%=basePath%>comment/manage?userId=<%=u.getId()%>&curPage=${pc.curPage-1}">&larr; 上一页</a></li>
            </c:if>

            <c:if test="${pc.curPage< pc.totalPages}">
                <li class="next"><a href="<%=basePath%>comment/manage?userId=<%=u.getId() %>&curPage=${pc.curPage+1}">下一页  &rarr;</a></li>
            </c:if>
        </ul>
    </div>

</div>
    <%} %>
<jsp:include page="../../ui/frame/Footer.jsp"></jsp:include>

<script type="text/javascript">
    function dele(deleUrl) {

        if (confirm("你确定要删除该评论吗？")) {
            location.href = deleUrl;
        }
    }
</script>