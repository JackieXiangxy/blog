<%@ page language="java" import="java.util.*" import="com.ust.myapp.model.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
Admin admin = (Admin)request.getSession().getAttribute("admin");
String succDeleMsg = (String)request.getSession().getAttribute("succDeleMsg");	//禁用用户消息
String errorDeleMsg = (String)request.getSession().getAttribute("errorDeleMsg");
String succActMsg = (String)request.getSession().getAttribute("succActMsg");	//启用用户消息
String errorActMsg = (String)request.getSession().getAttribute("errorActMsg");
%>

<jsp:include page="frame/Header.jsp"></jsp:include>

	<% if (null != admin) { %>
	  <div class="container">

      <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        
        <div class="navbar-header">
          
          <a class="navbar-brand" href="<%=basePath%>admin/index">青宇轻博客管理系统</a>
        </div>
        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav side-nav">
            <li><a href="<%=basePath%>admin/index"><i class="glyphicon glyphicon-dashboard"></i> 控制面板</a></li>
            <li class="active"><a href="<%=basePath %>admin/useradmin"><i class="glyphicon glyphicon-cog"></i> 用户管理</a></li>
            <li><a href="<%=basePath %>admin/sysArticalAdmin"><i class="glyphicon glyphicon-cog"></i> 文章管理</a></li>
            <li><a href="<%=basePath %>admin/sysCategoryAdmin"><i class="glyphicon glyphicon-edit"></i> 分类管理</a></li>
            
          </ul>

          <ul class="nav navbar-nav navbar-right navbar-user">
            <li class="dropdown user-dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i> <%=admin.getUsername() %> <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#"><i class="icon-gear"></i> 设置</a></li>
                <li class="divider"></li>
                <li><a href="<%=basePath%>admin/logout"><i class="glyphicon glyphicon-off"></i> 登出</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </nav>
      
     
	<div id="page-wrapper">
        <div class="row">
          <div class="col-lg-12">
          	<br>
            <ol class="breadcrumb">
            <li><a href="<%=basePath%>admin/index"><i class="glyphicon glyphicon-dashboard"></i> 控制面板</a></li>
              <li class="active"><i class="glyphicon glyphicon-cog"></i> 用户管理</li>
            </ol>
           
		    <%-- 禁用账户结果提示消息 --%>
		  	<% if (null != succDeleMsg) { %>
		  	<div class="row">
         	<div class="col-lg-12">
		  		<div class="alert alert-success"><%=succDeleMsg %></div>
		  	</div>
		  	</div>
		  	<% 
		  	       request.getSession().removeAttribute("succDeleMsg");
		  	   } 
		  	%>
		  	
		  	<% if (null != errorDeleMsg) { %>
		  	<div class="row">
         	<div class="col-lg-12">
		  		<div class="alert alert-danger"><%=errorDeleMsg %></div>
		  	</div>
		  	</div>
		  	<%     
		  	       request.getSession().removeAttribute("errorDeleMsg"); 
		  	   } 
		  	%>
		  	
		  	<%-- 激活账户结果提示消息 --%>
		  	<% if (null != succActMsg) { %>
		  	<div class="row">
         		<div class="col-lg-12">
		  	<div class="alert alert-success"><%=succActMsg %></div>
		  	</div>
		  	</div>
		  	<% 
		  	       request.getSession().removeAttribute("succActMsg");
		  	   } 
		  	%>
		  	
		  	<% if (null != errorActMsg) { %>
		  	<div class="row">
         	<div class="col-lg-12">
		  		<div class="alert alert-error"><%=errorActMsg %></div>
		  	</div>
		  	</div>
		  	<%     
		  	       request.getSession().removeAttribute("errorActMsg"); 
		  	   } 
		  	%>
          <div class="row">
          	<div class="col-lg-12">
            	<div class="table-responsive">
              	<table class="table table-hover tablesorter">
					<thead>
						<tr>
							<th>用户名</th>
		          			<th>是否申请博客</th>
		          			<th>邮箱地址</th>
		          			<th>当前状态</th>
		          			<th>操作</th>
		          			<th>查看用户信息</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${pc.list }" var="admin">
						<tr>
		          			<td>${admin.username }</td>
		          			<td>
							<c:choose> 
		          			<c:when test="${admin.isApplied==true}">		          
		          				<span class="label label-success">已申请</span>
		          			</c:when>
		          			<c:otherwise>
		          				<span class="label label-danger">未申请</span>
		          			</c:otherwise>
							</c:choose> 	
		          			</td>
		          			<td>${admin.email}</td>
		          			<td>
		          			<c:choose>
		          			<c:when test="${admin.isDelete==false}">		     
		          				<span class="label label-success">可用</span>
		          			</c:when>
		          			<c:otherwise>
		          				<span class="label label-danger">不可用</span>
		          		    </c:otherwise>
		          		    </c:choose> 
		          			</td>
		          			<td> 
		          			<c:choose> 
		          				<c:when test="${admin.isDelete==true}">
		          				<a href="<%=basePath %>admin/activeuser?userId=${admin.id}" class="btn btn-success btn-xs">启用账号</a>	
		          				</c:when>
		          				<c:otherwise>
		          				<a href="<%=basePath %>admin/deleteuser?userId=${admin.id}" class="btn btn-danger btn-xs">禁用账号</a>	
		          				</c:otherwise>
		          			</c:choose>
		           			</td>
		          			<td>
		          			<c:choose> 
		          			    <c:when test="${admin.isProfile==true}">		          				    	
		          				<a href="<%=basePath %>admin/userprofile?userId=${admin.id}" class="btn btn-primary btn-xs">详细信息</a>
		          				</c:when>
		          				<c:otherwise>
		          				<a class="btn btn-warning btn-xs">尚未更新资料</a>
		          				</c:otherwise>
		          			</c:choose>	
		          			</td>
		          		</tr>
		          
		          	 </c:forEach>
					</tbody>
					</table>
					</div>
				</div>
			</div>
			
			<!-- pager -->
          <ul class="pager">
				<c:if test="${pc.curPage > 1}">
				<li class="previous"><a
					href="<%=basePath%>admin/useradmin?userId=${admin.getId()}&curPage=${pc.curPage-1}">&larr;
						上一页</a></li>
				</c:if>

				<c:if test="${pc.curPage< pc.totalPages}">
				<li class="next"><a
					href="<%=basePath%>admin/useradmin?userId=${admin.getId()}&curPage=${pc.curPage+1}">下一页
						&rarr;</a></li>
				</c:if>
			</ul>
			
			</div>
        </div>
    </div>
</div>
<%} %>

<jsp:include page="frame/Footer.jsp"></jsp:include>

<script type="text/javascript">
function dele(deleUrl) {
	
	if (confirm("你确定要禁用该用户吗？")) {
		location.href = deleUrl;
	}

}

function act(actUrl) {
	
	if (confirm("你确定要激活该用户吗？")) {
		location.href = actUrl;
	}
}
</script>