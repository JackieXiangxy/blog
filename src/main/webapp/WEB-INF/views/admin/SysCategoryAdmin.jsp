<%@ page language="java" import="java.util.*" import="com.ust.myapp.model.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
Admin admin = (Admin)request.getSession().getAttribute("admin");
String succDeleScg = (String)request.getSession().getAttribute("succDeleScg");		//删除提示
String errorDeleScg = (String)request.getSession().getAttribute("errorDeleScg");
String succAddScg = (String)request.getSession().getAttribute("succAddScg");		//添加提示
String errorAddScg = (String)request.getSession().getAttribute("errorAddScg");
String succUpdateScg = (String)request.getSession().getAttribute("succUpdateScg");	//更新提示
String errorUpdateScg = (String)request.getSession().getAttribute("errorUpdateScg");
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
            <li><a href="<%=basePath %>admin/useradmin"><i class="glyphicon glyphicon-cog"></i> 用户管理</a></li>
            <li><a href="<%=basePath %>admin/sysArticalAdmin"><i class="glyphicon glyphicon-cog"></i> 文章管理</a></li>
            <li class="active"><a href="<%=basePath %>admin/sysCategoryAdmin"><i class="glyphicon glyphicon-edit"></i> 分类管理</a></li>
            
          </ul>

          <ul class="nav navbar-nav navbar-right navbar-user">
            <li class="dropdown user-dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i> ${admin.getUsername() } <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#"><i class="glyphicon glyphicon-cog"></i> 设置</a></li>
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
              <li class="active"><i class="glyphicon glyphicon-cog"></i> 分类管理</li>
            </ol>
            <p><a class="btn btn-primary" href="<%=basePath %>admin/toaddCategory">新建分类</a><p>
		    
		    <% if (null != succDeleScg) { %>	<%-- 删除成功 --%>
		  	<div class="row">
         	<div class="col-lg-12">
		  		<div class="alert alert-success"><%=succDeleScg %></div>
		  	</div>
		  	</div>
		  	<% 
		  	       request.getSession().removeAttribute("succDeleScg");
		  	   } 
		  	%>
		  	
		  	<% if (null != errorDeleScg) { %>	<%-- 删除失败 --%>
		  	<div class="row">
         	<div class="col-lg-12">
		  		<div class="alert alert-error"><%=errorDeleScg %></div>
		  	</div>
		  	</div>
		  	<%     
		  	       request.getSession().removeAttribute("errorDeleScg"); 
		  	   } 
		  	%>
		  	
		  	<% if (null != succAddScg) { %>		<%-- 添加成功 --%>
		  	<div class="row">
         	<div class="col-lg-12">
		  		<div class="alert alert-success"><%=succAddScg %></div>
		  	</div>
		  	</div>
		  	<% 
		  	       request.getSession().removeAttribute("succAddScg");
		  	   } 
		  	%>
		  	
		  	<% if (null != errorAddScg) { %>	<%-- 添加失败 --%>
		  	<div class="row">
         	<div class="col-lg-12">
		  		<div class="alert alert-error"><%=errorAddScg %></div>
		  	</div>
		  	</div>
		  	<%     
		  	       request.getSession().removeAttribute("errorAddScg"); 
		  	   } 
		  	%>
		  	
		  	<% if (null != succUpdateScg) { %>		<%-- 更新成功 --%>
		  	<div class="row">
         	<div class="col-lg-12">
		  		<div class="alert alert-success"><%=succUpdateScg %></div>
		  	</div>
		  	</div>
		  	<% 
		  	       request.getSession().removeAttribute("succUpdateScg");
		  	   } 
		  	%>
		  	
		  	<% if (null != errorUpdateScg) { %>	<%-- 更新失败 --%>
		  	<div class="row">
         	<div class="col-lg-12">
		  		<div class="alert alert-error"><%=errorUpdateScg %></div>
		  	</div>
		  	</div>
		  	<%     
		  	       request.getSession().removeAttribute("errorUpdateScg"); 
		  	   } 
		  	%>
		    
          <div class="row">
          	<div class="col-lg-12">
            	<div class="table-responsive">
              	<table class="table table-hover tablesorter">
					<thead>
						<tr>
							<th>分类名</th>
		          			<th>文章数</th>
		          			<th>当前状态</th>
		          			<th>操作</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${pc.list }" var="sc">
					<tr>

					<td>
					<a href="<%=basePath %>admin/editSysCategory?scgId=${sc.id}">${sc.categoryName }</a> 
					</td>
					<td>${sc.articals }
					</td>
					
					<td>
		          	<c:choose>
		          	<c:when test="${sc.isDelete==false}">		     
		          		<span class="label label-success">未禁用</span>
		          	</c:when>
		          	<c:otherwise>
		          		<span class="label label-danger">禁用</span>
		           	</c:otherwise>
		          	</c:choose> 
		          	</td>
		          	
					<td>
					<c:choose> 
		          	<c:when test="${sc.isDelete==true}">
		          	<a href="<%=basePath %>admin/activeSysCategory?scgId=${sc.id}" class="btn btn-success btn-xs">解封分类</a>	
		          	</c:when>
		          	<c:otherwise>
		          	<a href="<%=basePath %>admin/deleteSysCategory?scgId=${sc.id}" class="btn btn-danger btn-xs">封禁分类</a>	
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
				<div>
			   <ul class="pager">
				<c:if test="${pc.curPage > 1}">
				<li class="previous"><a
					href="<%=basePath%>admin/sysCategoryAdmin?userId=${admin.getId()}&curPage=${pc.curPage-1}">&larr;
						上一页</a></li>
				</c:if>

				<c:if test="${pc.curPage< pc.totalPages}">
				<li class="next"><a
					href="<%=basePath%>admin/sysCategoryAdmin?userId=${admin.getId()}&curPage=${pc.curPage+1}">下一页
						&rarr;</a></li>
				</c:if>
			</ul>
				</div>
			</div>
        </div>
    </div>
   </div>
<% }%>
<jsp:include page="frame/Footer.jsp"></jsp:include>

<script type="text/javascript">
function dele(deleUrl) {
	
	if (confirm("你确定要删除该分类吗？")) {
		location.href = deleUrl;
	}
}
</script>