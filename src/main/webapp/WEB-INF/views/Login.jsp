<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%
    String userIsDeleMsg = (String) request.getSession().getAttribute("userIsDeleMsg");
%>
<jsp:include page="../../ui/frame/Header.jsp"></jsp:include>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="<%=basePath%>index">个人博客系统</a>
			</div>

			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav">
					<li><a href="<%=basePath%>index">网站首页</a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li><a href="<%=basePath%>login" target="_blank">登录</a></li>
					<li><a href="<%=basePath%>register" target="_blank">注册</a></li>
				</ul>
			</div>
		</div>
	</nav>
		<%-- <% if (null != userIsDeleMsg) { %>
用户被禁用提示信息 
	<div class="container">
		<div class="alert alert-error">
			<%=userIsDeleMsg %>
		</div>
	</div>
	<%    request.getSession().removeAttribute("userIsDeleMsg");
    } %>
--%>
	<div class="container">
		<div class="row col-md-4"></div>

		<div class="row col-md-4">
			<div>
			<c:if test="${not empty msg}">${msg}</c:if>
				<fieldset>

					<form name="login_form" id="login_form" role="form" class="form-horizontal" action="<%=basePath %>user/login"
						method="POST">
						<fieldset>
							<div id="legend">
								<legend class="caption">登录</legend>
							</div>
							<div class="form-group">
								<label for="username">用户名</label> <input type="text"
									class="form-control " name="username" id="username"
									placeholder="Username">
							</div>
							<div class="form-group">
								<label for="password">密码</label> <input type="password"
									class="form-control" name="password" id="password"
									placeholder="Password">
							</div>


							<!-- 验证码 -->
							<div>
							<div class="form-group text-center">
								<label for="code">验证码</label>
							</div>
							<div style="display: table-cell; vertical-align: middle;">
								<img id="code" src="${basePath }code/saveCode"
									onclick="changecode()" style="width: 155px; height: 30px;">
								<input style="height: 28px" type="text" name="incode" id="inputcode" onmouseout="checkCode()"placeholder="请输入密码" />
								<span id ="message" style="color: red;display: block;" >${message }</span>
							</div>
							</div>
							<div class="form-group text-center">
								<button onclick="doSubmit()" class="btn btn-success">登录</button>
							</div>
						</fieldset>
					</form>
				</fieldset>
				</div>
			</div>

		</div>
		<div class="row col-md-4"></div>
	</div>
</body>

	<jsp:include page="../../ui/frame/Footer.jsp" flush="true" />

	<script type="text/javascript">

	 function isValidate(login_form) {
	        var username = login_form.username.value;
	        var password = login_form.password.value;

	        if (username == "" || password == "") {
	            alert("请填写用户名和密码！");

	            return false;
	        }
	        return true;
	    }
    
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
    		var from = document.getElementById("login_form");
    		from.submit();
    	}
    	else
    	{
    		document.getElementById("message").innerHTML = "用户名或密码错误，请检查您的输入数据！";
    	}
    } 

</script>