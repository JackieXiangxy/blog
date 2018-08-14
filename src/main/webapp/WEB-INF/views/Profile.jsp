<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import = "com.ust.myapp.model.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
User u = (User)request.getSession().getAttribute("user");
String succMsg = (String)request.getSession().getAttribute("succMsg");
String errorMsg = (String)request.getSession().getAttribute("errorMsg");
String succUpdateMsg = (String)request.getSession().getAttribute("succUpdateMsg");		//密码更新消息提示
String errorUpdateMsg = (String)request.getSession().getAttribute("errorUpdateMsg");
String validPwdMsg = (String)request.getSession().getAttribute("validPwdMsg");			//旧密码验证失败消息提示
 %>
 
<jsp:include page="../../ui/frame/Header.jsp"></jsp:include>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">         
         <a class="navbar-brand" href="<%=basePath %>index">青宇轻博客</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav">
            <li><a href="<%=basePath %>index.html">网站首页</a></li>
          </ul>
          
          <% if ((null != u) && (u.getIsApplied() == true)) { %>
          <ul class="nav navbar-nav">
            <li><a href="<%=basePath %>user/myblog?userId=<%=u.getId() %>">我的博客</a></li>
          </ul>
          
          <ul class="nav navbar-nav">
            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">博客管理<b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="<%=basePath %>article/manage?userId=<%=u.getId() %>"><i class="glyphicon glyphicon-off"></i> 博文管理</a></li>
                    <li class="divider"></li>
                    <li><a href="<%=basePath %>category/manage?userId=<%=u.getId() %>"><i class="glyphicon glyphicon-off"></i> 分类管理</a></li>
                    <li class="divider"></li>
                    <li><a href="<%=basePath %>comment/manage?userId=<%=u.getId()%>"><i class="glyphicon glyphicon-off"></i> 评论管理</a></li>
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
    
  	<% if (null != succMsg) { %>
  	 <div class="container">
     	<div class="alert alert-success">
     	<%=succMsg %>
     	</div>
     </div>
     <%    request.getSession().removeAttribute("succMsg"); 
       } %>
     
     <% if (null != errorMsg) { %>
     <div class="container">
     	<div class="alert alert-error">
     	<%=errorMsg %>
     	</div>
     </div>
     <%    request.getSession().removeAttribute("errorMsg"); 
        } %>
     
     <% if (null != succUpdateMsg) { %>
  	 <div class="container">
     	<div class="alert alert-success">
     	<%=succUpdateMsg %>
     	</div>
     </div>
     <%     request.getSession().removeAttribute("succUpdateMsg"); 
        } %>
     
     <% if (null != errorUpdateMsg) { %>
     <div class="container">
     	<div class="alert alert-error">
     	<%=errorUpdateMsg %>
     	</div>
     </div>
     <%     request.getSession().removeAttribute("errorUpdateMsg"); 
        } %>
    
    <% if (null != validPwdMsg) { %>
     <div class="container">
     	<div class="alert alert-error">
     	<%=validPwdMsg %>
     	</div>
     </div>
     <%     request.getSession().removeAttribute("validPwdMsg"); 
        } %>
    
	<div class="container">
		<div class="well row col-md-6">
	    <ul class="nav nav-tabs">
	      <li class="active"><a href="#home" data-toggle="tab">个人资料</a></li>
	      <li><a href="#profile" data-toggle="tab">修改密码</a></li>
	    </ul>
	    <div id="myTabContent" class="tab-content">
	      <div class="tab-pane active in" id="home">
	        <form class="form-horizontal" name="profile_form" role="form" id="tab" action="<%=basePath %>user/updateprofile?userId=<%=u.getId() %>" method="post" onsubmit="return isValidate(profile_form)">
	           
	            <div class="form-group">
	            <label for="username">用户名</label>
	            <input type="text" value="<%=u.getUsername() %>" class="form-control" name="username" disabled>
	            </div>
	            <div class="form-group">
	            <label for="email">邮箱</label>
	            <input type="text" value="<%=u.getEmail() %>" class="form-control" name="email" disabled>
	            </div>
	            <div class="form-group">
	            <label for="pf.first_name">姓</label>
	            	              
	            
	            <input class="form-control" type="text" name="firstName" value="${pf.firstName}"/>
	           	
	            </div>
	            <div class="form-group">
	            <label for="pf.last_name">名</label>
	            
	            <input class="form-control" type="text" name="lastName" value="${pf.lastName}"/>
	           
	            </div> 
	            <div class="form-group">
	            <label for="telephone">手机号码</label>
	           
	            <input class="form-control" type="text" name="telephone" value="${pf.telephone}"/>
					<input type="hidden" name="user.id" value="${pf.user.id}"/>
	            <input type="hidden" name="id" value="${pf.id}"/>
	            </div>
	            <div class="form-group">
	            <label for="gender">性别</label>
	            <select class="form-control" name="gender" id="gender"  >
	            	<option value="0">男</option>
	            	<option value="1" selected>女</option>
	            </select>
	            </div>
	          	<div class="form-group" >
	        	    <button class="btn btn-primary" type="submit">保存</button>
	        	</div>
	        </form>
	      </div>
	      <div class="tab-pane fade" id="profile">
	    	<form class="form-horizontal" id="tab2" name="updatePwd" onsubmit="return isPasswordValidate(updatePwd)" 
	    	      method="post" action="<%=basePath %>user/updatepass?userId=<%=u.getId() %>">
	        	<div class="form-group">
	        	<label for="old_pwd">旧密码</label>
	        	<input class="form-control" type="password" name="old_pwd" >
	        	</div>
	        	<div class="form-group">
	        	<label for="new_pwd" >新密码</label>
	        	<input class="form-control" type="password" name="new_pwd1" >
	        	</div>
	        	<div class="form-group">
	        	<label for="submit_new_pwd">新密码（确认）</label>
	        	<input class="form-control" type="password" name="new_pwd2">
	        	</div>
	        	<div class="form-group">
	        	   <button class="btn btn-primary">保存</button>
	        	</div>
	    	</form>
	      </div>
	  </div>
	</div>
	</div>
<jsp:include page="../../ui/frame/Footer.jsp"></jsp:include>

<script type="text/javascript">
function isValidate(profile_form) {
	var first_name = profile_form.first_name.value;
	var last_name = profile_form.last_name.value;
	var telephone = profile_form.telephone.value;
	
	if (first_name == "" || last_name == "" || telephone == "") {
		alert("姓，名，手机号码为必填项");	
		
		return false;
	}
	
	return true;
}

function isPasswordValidate(form) {
	var old_pwd = form.old_pwd.value;
	var new_pwd = form.new_pwd.value;
	var submit_new_pwd = form.submit_new_pwd.value;
	
	if (old_pwd == "" || new_pwd == "" || submit_new_pwd == "") {
		alert("新密码、旧密码、旧密码（确认）为必填项");	
		return false;
	} else if (old_pwd == new_pwd) {
		alert("新密码和旧密码不能相同");
		return false;
	} else if (submit_new_pwd != new_pwd) {
		alert("新密码和新密码（确认）必须相同");
		return false;
	} else {
		return true;
	}

}
</script>