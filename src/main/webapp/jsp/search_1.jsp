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
	href="${pageContext.request.contextPath}/css/common.css" />
</head>
<body>

	<h2>新闻管理系统</h2>

	<div class="title">
		<div>
			<a href="${pageContext.request.contextPath}/allnews" class="all">所有新闻</a>
		</div>
		<div>
			<a href="search.jsp" class="search_1">搜索新闻</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/login.jsp"
				class="backManager">后台管理</a>
		</div>
	</div>
	<hr>



	<div class="search">
		<form action="${pageContext.request.contextPath}/SearchServlet"
			method="post" id="search" name="search">
			请输入关键字：<input type="text" name="search" required="required"><br>
			<button style="margin-left: 220px;">搜索</button>
		</form>
	</div>
	<div class="content_1">


		<div class="search_body" style="margin-left: 50px">
			<p>
				您搜索的关键字是：<%=session.getAttribute("str")%>
				,搜索的结果如下：
			</p>
			<table width="1200" border="0" cellspacing="0" cellpadding="0">
				<tr class="t1">
					<td width="200">新闻标题</td>
					<td width="200">新闻作者</td>
					<td width="200">发布时间</td>
				</tr>
				<%
				ArrayList<NewsDetail> list = (ArrayList) session.getAttribute("list");
				for (NewsDetail nd : list) {
				%>
				<tr class="t2">
					<td width="200"><a href="indetail_new.jsp?id=<%=nd.getId() %>"><%=nd.getTitle() %></a></td>
					<td width="200"><%=nd.getAuthor()%></td>
					<td width="200"><%=nd.getTime()%></td>

				</tr>

				<%
				}
				%>
				</div>
</body>
</html>
