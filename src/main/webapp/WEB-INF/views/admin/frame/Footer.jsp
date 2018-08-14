<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

    <script src="<%=basePath %>/ui/bootstrap/js/jquery-2.1.1.js"></script>
    <script src="<%=basePath %>/ui/bootstrap/js/bootstrap.js"></script>
  </body>
</html>
