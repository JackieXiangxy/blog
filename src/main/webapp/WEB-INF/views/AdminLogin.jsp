<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
String errorMsg = (String)request.getSession().getAttribute("msg");
String logoutMsg = (String)request.getSession().getAttribute("logoutMsg");
%>
<jsp:include page="../../ui/frame/Header.jsp"></jsp:include>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
     <div class="container">
       <div class="navbar-header">
         <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
           <span class="sr-only">切换导航</span>
           <span class="icon-bar"></span>
           <span class="icon-bar"></span>
           <span class="icon-bar"></span>
         </button>
         <a class="navbar-brand" href="<%=basePath %>index">青宇轻博客</a>
       </div>       
       <div class="collapse navbar-collapse navbar-ex1-collapse">
         <ul class="nav navbar-nav">
           <li><a href="<%=basePath %>index" target="_blank">访问网站首页</a></li>
         </ul>        
       </div>
     </div>
   </nav>

	<% if (null != errorMsg) { %>		<%-- 登录验证失败提示 --%>
	<div class="container">
    <div class="alert alert-error">
    <%=errorMsg %>
    </div></div>
    <%    request.getSession().removeAttribute("msg");
    } %>
    
    <% if (null != logoutMsg) { %>		<%-- 推出成功提示 --%>
	<div class="container">
    <div class="alert alert-success">
    <%=logoutMsg %>
    </div></div>
    <%    request.getSession().removeAttribute("logoutMsg");
    } %>

   <div class="container">
    <div class="row">
		<div class="col-md-6">
			<form name="login_form" id="adminlogin_form" class="form-horizontal" action='${basePath}admin/login' method="POST">
			  <fieldset>
			    <div id="legend">
			      <legend class="caption">管理员登录</legend>
			    </div>
			 
			    <div class="form-group">
			      <!-- Username -->
			      <label for="username">用户名</label>
                   <input class="form-control" type="text" id="username" name="username" placeholder="请输入用户名" >
			    </div>
			    <div class="form-group">
			      <!-- Password-->
			      <label  for="password">密码</label>		      
			        <input class="form-control" type="password" id="password" name="password" placeholder="请输入密码" >
			    </div>
			    <div class="form-group">
			      <label  for="password">输入验证码</label>		      
			   </div>
			   <div style="display: table-cell; vertical-align: middle;">
						<input style="height: 28px" type="text" name="incode" id="inputcode" onmouseout="checkCode()"placeholder="请输入密码" />
						<img id="code" src="${basePath }code/saveCode"onclick="changecode()"style="width: 180px; height: 30px;">
					</div>
			    <span id ="message" style="color: red;display: block;" >${message }</span>
       			<br/>
			    <div class="form-group">
			      <!-- Button -->		     
			        <button class="btn btn-success" onclick="doSubmit()">登录</button>
			    </div>
			  </fieldset>
			</form>
		</div>
	</div>
</div>

<jsp:include page="../../ui/frame/Footer.jsp"></jsp:include>

<script type="text/javascript">
var flag=false;
function changecode() {
	document.getElementById("code").src ="/blog/code/saveCode?"+Math.random();
}
//校验验证码
function checkCode()
{
	var code = document.getElementById("inputcode");
	var userCode = code.value;
	$.ajax({
        type: "POST",
        url: "/blog/code/checkCode",
        data: {
        	code: userCode,
        },
        dataType: "json",
        error: function (XMLHttpRequest, textStatus, errorThrown) {
       	 
        },
        success: function (json) {
        	if(json.strMessage=="0"){
        		document.getElementById("message").innerHTML = "验证码不正确";
        		flag=false;
        	}else{
        		document.getElementById("message").innerHTML = "验证码正确";
        		flag=true;
        	}
        }
    });
}
function doSubmit()
{
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	//正则表达式校验
	var uPattern = /^[a-zA-Z0-9_-]{3,16}$/;
	if(uPattern.test(username)&&uPattern.test(password)&&flag)
	{
		var from = document.getElementById("adminlogin_form");
		from.submit();
	}
	else
	{
		document.getElementById("message").innerHTML = "请检查您的输入数据！";
	}
}




</script>
