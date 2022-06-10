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
		<div><a href="${pageContext.request.contextPath}/aallnews" class="all">所有新闻</a></div>
		 <div><a href="${pageContext.request.contextPath}/jsp/add.jsp" class="search_1">添加新闻</a> </div>
		 <div><a href="" class="backManager">系统登录</a></div>
		  <div><a href="${pageContext.request.contextPath}/exit" class="backManager">退出系统</a></div>
	</div>
	<hr>

	
	<div class="content">
		<table width="1200" border="0" cellspacing="0" cellpadding="0"> 
			<tr class="t1">
				<td width="200">新闻标题</td>
				<td width="200">新闻作者</td>
				<td width="200">新闻类别</td>
				<td width="200">发布时间</td>
				<td width="200">是否删除</td>
				<td width="200">是否编辑</td>
			</tr>

			<%
			ArrayList<NewsDetail> list = (ArrayList)session.getAttribute("list");
   				for(NewsDetail nd :list){
   					int arr1 = Integer.valueOf(nd.getType());
   					String[] arr = { "科技", "动漫", "新闻" };			
	        %>
	       			<tr class="t2">
					<td width="200">
						<a href="aindetail_new.jsp?id=<%=nd.getId() %>"><%=nd.getTitle() %></a>
					</td>
					<td width="200">
						<%=nd.getAuthor()%>
					</td>
					<td width="200">
						<%=arr[arr1] %>
					</td>
					<td width="200">
					    <%=nd.getTime()%>
					</td>
					<td width="200">
					    <a href="${pageContext.request.contextPath}/delnew?id=<%=nd.getId()%>"><%="删除"%></a>
					</td>
					<td width="200">
					    <a href="${pageContext.request.contextPath}/jsp/edit.jsp?id=<%=nd.getId()%>"><%="编辑"%></a>
					</td>
						
				</tr>

<%} %>
			</div>
</body>
</html>