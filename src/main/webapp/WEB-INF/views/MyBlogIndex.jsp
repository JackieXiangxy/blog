<%@ page language="java" import="java.util.*" import="java.text.*" import="com.ust.myapp.model.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<%
    User u = (User)request.getSession().getAttribute("user");

%>
<jsp:include page="../../ui/frame/Header.jsp"></jsp:include>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="index">青宇轻博客</a>
        </div>

        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav">
                <li><a href="<%=basePath%>index">网站首页</a></li>
            </ul>

            <%
                if ((null != u) && (u.getIsApplied() == true)) {
            %>
            <ul class="nav navbar-nav">
                <li><a href="<%=basePath%>user/myblog?userId=<%=u.getId()%>">我的博客</a></li>
            </ul>

            <ul class="nav navbar-nav">
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">博客管理<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="<%=basePath%>article/manage?userId=<%=u.getId()%>"><i class="glyphicon glyphicon-cog"></i> 博文管理</a></li>
                        <li class="divider"></li>
                        <li><a href="<%=basePath%>category/manage?userId=<%=u.getId()%>"><i class="glyphicon glyphicon-cog"></i> 分类管理</a></li>
                        <li class="divider"></li>
                        <li><a href="<%=basePath%>comment/manage?userId=<%=u.getId()%>"><i class="glyphicon glyphicon-cog"></i> 评论管理</a></li>
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
                <li><a href="<%=basePath%>login" target="_blank">登录</a></li>
                <li><a href="<%=basePath%>register" target="_blank">注册</a></li>
            </ul>
            <%
            } else {
            %>
            <div class="pull-right">
                <ul class="nav pull-right">
                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">欢迎，<%=u.getUsername()%> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="<%=basePath%>user/profile?userId=<%=u.getId()%>"><i class="glyphicon glyphicon-cog"></i> 编辑个人信息</a></li>
                            <%
                                if (u.getIsApplied() == true) {
                            %>
                            <li class="divider"></li>
                            <li><a href="<%=basePath%>user/bloginfo?userId=<%=u.getId()%>"><i class="glyphicon glyphicon-cog"></i> 编辑博客信息</a></li>
                            <%
                                }
                            %>
                            <li class="divider"></li>
                            <li><a href="<%=basePath%>logout"><i class="glyphicon glyphicon-off
glyphicon "></i> 登出</a></li>
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

            <!-- blog entry -->
            <h1><a href="<%=basePath%>user/myblog?userId=${user.id}">
                ${bi.blogName}
            </a></h1>
            <p class="lead">
                ${bi.annoucement}

            </p><br>
            <c:forEach items="${pc.list}" var="art">
				<c:if test="${art.isDelete==false}">
                <h3>
                    <a href="<%=basePath%>comment/post?artId=${art.id}&userId=${user.id}">
                    ${art.title}
                    </a>
                </h3>
                <p>
                    <i class="glyphicon glyphicon-user"></i> <a href="#">${user.password} </a>
                    | <i class="glyphicon glyphicon-calendar"></i>${art.publishTime}
                    | 阅读${art.count}次
                </p>
                <hr>
                <p>${art.summary}</p>
                <a class="btn btn-primary" href="<%=basePath%>comment/post?artId=${art.id}&userId=${user.id}">Read More <span class="glyphicon glyphicon-chevron-right"></span></a>
                <hr>
                </c:if>
            </c:forEach>

            <!-- pager -->
            <ul class="pager">
                <c:if test="${pc.curPage > 1}">


                    <li class="previous"><a
                            href="<%=basePath%>user/myblog?userId=<%=u.getId()%>&curPage=${pc.curPage-1}">&larr;
                        上一页</a>
                    </li>

                </c:if>
                <c:if test="${pc.curPage< pc.totalPages}">

                    <li class="next"><a
                            href="<%=basePath%>user/myblog?userId=<%=u.getId()%>&curPage=${pc.curPage+1}">下一页
                        &rarr;</a>
                    </li>

                </c:if>
            </ul>

        </div>

        <div class="col-lg-4">
            <form action="#" method="GET">
                <div class="well">
                    <h4> 文章分类</h4>
                    <div class="row">
                        <div class="col-lg-6">
                            <ul class="list-unstyled">
                                <c:forEach items="${cgList}" var="cg">
                                    <li><a href="#">${cg.categoryName}</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </form>

            <div class="well">
                <h4>公告</h4>
                <p>${bi.annoucement}</p>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../../ui/frame/Footer.jsp"></jsp:include>