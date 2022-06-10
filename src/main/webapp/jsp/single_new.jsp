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

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css" />
</head>
<body>

	<h2>新闻管理系统</h2>

	<div class="title">
		<a href="" class="all">所有新闻</a> <a href="search.jsp" class="search">搜索新闻</a>
		<a href="" class="backManager">后台管理</a>
	</div>
	<hr>


	<div class="content">
		<div class="data-div">
			<div class="row tableHeader">
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 ">新闻标题</div>
				<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 ">新闻作者</div>
				<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 ">新闻类别</div>
				<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 ">发布时间</div>
			</div>

			<%
			String id = request.getParameter("id");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String type = request.getParameter("type");
			%>
			<%=id%><br>
			<%=title%><br>
			<%=content%><br>
			<%=type%>


		</div>
	</div>
</body>
</html>