<%@ page language="java" import="java.util.*" import="com.ust.myapp.model.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
Admin admin = (Admin)request.getSession().getAttribute("admin");
%>

<jsp:include page="frame/Header.jsp"></jsp:include>

	<% if (null != admin) { %>
      <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
       
        <div class="navbar-header">
          
          <a class="navbar-brand" href="<%=basePath%>admin/index">青宇轻博客管理系统</a>
        </div>

        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav side-nav">
            <li><a href="<%=basePath%>admin/index"><i class="glyphicon glyphicon-dashboard"></i> 控制面板</a></li>
            <li class="active"><a href="<%=basePath %>admin/useradmin"><i class="glyphicon glyphicon-cog"></i> 用户管理</a></li>
            <li><a href="<%=basePath %>admin/sysArticalAdmin"><i class="glyphicon glyphicon-cog"></i> 文章管理</a></li>
            <li><a href="<%=basePath %>admin/sysCategoryAdmin"><i class="glyphicon glyphicon-cog"></i> 分类管理</a></li>
            
          </ul>

          <ul class="nav navbar-nav navbar-right navbar-user">
            <li class="dropdown user-dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i> ${admin.getUsername() } <b class="caret"></b></a>
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
            <h1>青宇轻博客系统 <small>基于SSM技术构建</small></h1>
            <ol class="breadcrumb">
              <li><a href="<%=basePath%>admin/index"><i class="icon-dashboard"></i> 控制面板</a></li>
              <li><a href="<%=basePath%>admin/useradmin"><i class="icon-bar-chart"></i> 用户管理</a></li>
              <li class="active"> 用户详细信息</li>
            </ol>
          </div>
        </div> 
        
        <div class="row">
       	<div class="col-lg-12">
         	<div class="table-responsive">
           	<table class="table table-hover tablesorter">
			<thead>
				<tr>
					<th>姓</th>
          			<th>名</th>
          			<th>性别</th>
          			<th>联系电话</th>
         			</tr>
         			
         		</thead>
         		<tbody>
         		
         			<tr>
         				<th>
         				${pf.firstName}
         				</th>
         				<th>
         				${pf.lastName}
         					
         				</th>
         				<th>
         				<c:choose> 
         				<c:when test="${pf.gender==true}">        					
          				男
          				</c:when>
          				<c:otherwise>
          				女
          				</c:otherwise>
          				</c:choose> 
         				</th>
         				<th>
         					${pf.telephone}
         				</th>
         			</tr>
         		</tbody>
         	</table>
			</div>
         </div>
        </div>  
      </div>   

<% } %>
<jsp:include page="frame/Footer.jsp"></jsp:include>
            
            