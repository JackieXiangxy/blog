<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    // 获得本项目的地址(例如: http://localhost:8080/MyApp/)赋值给basePath变量 
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    // 将 "项目路径basePath" 放入pageContext中，待以后用EL表达式读出。 
    pageContext.setAttribute("basePath", basePath);
%>



<div class="container">
	<hr>

	<footer>
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8 text-center">
				<p>
					Copyright &copy; 2018 &middot; 青宇科技 &middot; <a
						href="${basePath}adminIndex" target="_blank">管理员</a> &middot;
					<a href="http://www.beian.gov.cn/portal/index.do">京公安网备xxxxxxxxxxxxxx0111号</a>
					&middot;访问人数：${count}

				</p>
			</div>
			<div class="col-lg-2"></div>
		</div>
	</footer>

</div>

<script src="${basePath}ui/bootstrap/js/bootstrap.js"></script>

</body>
</html>
