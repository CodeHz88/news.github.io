<%@page import="com.team.servlet.AllNews"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page
	import="com.team.util.DBUtil,com.team.entity.NewsDetail,java.util.List"%>
<%@ page import="java.sql.*,java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>新闻管理系统</title>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
<script>
	//判断输入是否为空
	function Search() {
		//获取输入框的内容
		
		var search = $('#search').val();
		if (search == '') {
			alert('复选框不能为空！！！');
		} else {
			document.getElementById("usearch").submit();
		}

	}
</script>
</head>
<body>

	<h2>新闻管理系统</h2>

	<div class="title">
		<div><a href="${pageContext.request.contextPath}/allnews" class="all">所有新闻</a></div> 
		<div><a href="search.jsp" class="search_1">搜索新闻</a></div>
		<div><a href="${pageContext.request.contextPath}/login.jsp" class="backManager">后台管理</a></div>
	</div>
	<hr>

	
	
	<div class="search">
		<form action="${pageContext.request.contextPath}/SearchServlet"
			method="post" id="search" name="search">
			请输入关键字：<input type="text" name="search" required="required"><br>
			<button style="margin-left: 220px;">搜索</button>
		</form>
	</div>
	

</body>
</html>
