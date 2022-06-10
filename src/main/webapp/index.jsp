<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.team.util.DBUtil"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>新闻管理系统</title>

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css"/>
</head>
<body>
	
	<h2>新闻管理系统</h2>

	<div class="title">
	
		<div><a href="${pageContext.request.contextPath}/allnews" class="all">所有新闻</a></div> 
		<div><a href="${pageContext.request.contextPath}/jsp/search.jsp" class="search_1">搜索新闻</a></div>
		<div><a href="${pageContext.request.contextPath}/login.jsp" class="backManager">后台管理</a></div>
	
	</div>
	<hr>
	

</body>
</html>