<%@ page language="java" import="java.util.*" import="com.ust.myapp.model.*" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<%
    String path = request.getContextPath();
    // 获得本项目的地址(例如: http://localhost:8080/MyApp/)赋值给basePath变量 
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    // 将 "项目路径basePath" 放入pageContext中，待以后用EL表达式读出。 
    pageContext.setAttribute("basePath", basePath);
%>

<%
    User u = (User) request.getSession().getAttribute("user");

%>

<jsp:include page="../../ui/frame/Header.jsp"/>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="<%=basePath %>index">青宇轻博客</a>
        </div>

        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav">
                <li><a href="<%=basePath%>index">网站首页</a>
                </li>
            </ul>

            <%
                if ((null != u) && (u.getIsApplied())) {
            %>
            <ul class="nav navbar-nav">
                <li><a
                        href="<%=basePath%>user/myblog?userId=<%=u.getId()%>">我的博客</a>
                </li>
            </ul>

            <ul class="nav navbar-nav">
                <li class="dropdown"><a href="#" class="dropdown-toggle"
                                        data-toggle="dropdown">博客管理<b class="caret"></b>
                </a>
                    <ul class="dropdown-menu">
                        <li><a
                                href="<%=basePath%>article/manage?userId=<%=u.getId()%>"><i
                                class="glyphicon glyphicon-cog"></i> 博文管理</a>
                        </li>
                        <li class="divider"></li>
                        <li><a
                                href="<%=basePath%>category/manage"><i
                                class="glyphicon glyphicon-cog"></i> 分类管理</a>
                        </li>
                        <li class="divider"></li>
                        <li><a
                                href="<%=basePath%>comment/manage?userId=<%=u.getId()%>"><i
                                class="glyphicon glyphicon-cog"></i> 评论管理</a>
                        </li>
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
                <li><a href="<%=basePath%>login" target="_blank">登录</a>
                </li>
                <li><a href="<%=basePath%>register" target="_blank">注册</a>
                </li>
            </ul>
            <%
            } else {
            %>
            <div class="pull-right">
                <ul class="nav pull-right">
                    <li class="dropdown"><a href="#" class="dropdown-toggle"
                                            data-toggle="dropdown">欢迎，${user.username} <b
                            class="caret"></b>
                    </a>
                        <ul class="dropdown-menu">
                            <li><a
                                    href="<%=basePath%>user/profile?userId=${user.id}"><i
                                    class="glyphicon glyphicon-cog"></i> 编辑个人信息</a>
                            </li>
                            <%
                                if (u.getIsApplied()) {
                            %>
                            <li class="divider"></li>
                            <li><a
                                    href="<%=basePath%>user/bloginfo?userId=<%=u.getId()%>"><i
                                    class="glyphicon glyphicon-cog"></i> 编辑博客信息</a>
                            </li>
                            <%
                                }
                            %>
                            <li class="divider"></li>
                            <li><a href="logout"><i
                                    class="glyphicon glyphicon-off"></i> 登出</a>
                            </li>
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
        <div id="blog" class="col-lg-8">
            <h1>
                <a href="<%=basePath%>user/index">青宇轻博客——
                    <small>让技术学习变得更加简单</small>
                </a>
            </h1>
            <br>
            <c:forEach items="${pcList}" var="art">
                <h3>
                    <a href="<%=basePath%>comment/post?artId=<c:out value="${art.id}"/>&userId=<c:out value="${art.user.id}"/>"
                       target="_blank">
                        <c:out value="${art.title}"/>
                    </a>
                </h3>
                <p>
                    <i class="glyphicon glyphicon-user"></i>
                    <a href="<%=basePath%>user/myblog?userId=<c:out value="${art.user.id}"/>">
                            <%--<c:out value="&lt;%&ndash;${art.user.username}&ndash;%&gt;"/>--%>
                    </a>

                    | <i class="glyphicon glyphicon-calendar"></i>
                    <c:out value="${art.publishTime}"/>
                    | 阅读
                    <c:out value="${art.count}"/>
                    次
                </p>

                <p><c:out value="${art.summary}"/></p>
                <br> <a class="btn btn-primary"
                        href="<%=basePath%>comment/post?artId=<c:out value="${art.id}"/>&userId=<c:out value="${art.user.id}"/>">Read
                More <span class="glyphicon glyphicon-chevron-right"></span>
            </a>
                <hr>

            </c:forEach>


            <!-- pager -->
            <ul class="pager">
                <c:if test="${pc.curPage > 1}">
                    <li class="previous"><a
                            href="<%=basePath%>user/index?curPage=<c:out value="${pc.curPage-1}"/>">&larr;
                        上一页</a>
                    </li>

                </c:if>
                <c:if test="${pc.curPage< pc.totalPages}">

                    <li class="next"><a
                            href="<%=basePath%>user/index?curPage=<c:out value="${pc.curPage+1}"/>">下一页
                        &rarr;</a>
                    </li>

                </c:if>
            </ul>

        </div>

        <div class="col-lg-4">
            <%
                if ((u != null) && (u.getIsApplied() == false)) {
            %>
            <div class="well" align="center">
                <a class="btn btn-primary" href="<%=basePath%>ApplyBlog.jsp"
                   target="_blank">申请个人博客</a>
            </div>
            <%
                }
            %>

            <%
                if ((u != null) && (u.getIsApplied() == true)) {
            %>
            <div class="well" align="center">
                <a class="btn btn-primary"
                   href="<%=basePath%>user/myblog">进入我的博客</a>
            </div>
            <%
                }
            %>

            <div class="well">
                <h4>搜索站内文章</h4>
                <form name="search_form" action="<%=basePath%>user/search"
                      method="post">
                    <div class="input-group">
                        <input type="text" class="form-control" name="searchStr"> <span
                            class="input-group-btn">
								<button class="btn btn-default" type="submit">
                                    <span class="glyphicon glyphicon-search"></span>
                                </button> </span>
                    </div>

                </form>
            </div>


            <div class="well">
                <h4>网站分类</h4>
                <div class="row">
                    <div class="col-lg-6">
                        <ul class="list-unstyled">
                            <c:forEach items="${scList}" var="sc">
                                <li><a href="#"><c:out value="${sc.categoryName}"/></a></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>


            <div class="well">
                <h4>本周活跃博主</h4>
                <div class="row">
                    <div class="col-lg-6">

                        <ul class="list-unstyled">
                            <c:forEach items="${ulist}" var="u" varStatus="status">
                                <li><a
                                        href="<%=basePath%>user/myblog?userId=${u.id}"
                                        target="_blank"> ${status.index +1}. ${u.username }</a></li>
                            </c:forEach>
                        </ul>

                    </div>
                </div>
            </div>
            <!-- /well -->

            <div class="well">
                <h4>博文TOP10</h4>
                <div class="row">
                    <div class="col-lg-6">
                        <ul class="list-unstyled">
                            <c:forEach items="${tenList }" var="art" varStatus="status">
                                <li><a
                                        href="<%=basePath%>comment/post?artId=${art.id}&userId=${art.user.id}"
                                        target="_blank">${status.index +1}.${art.title}</a></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /well -->
        </div>
    </div>
</div>
<!-- /.container -->

<jsp:include page="../../ui/frame/Footer.jsp" flush="true"/>