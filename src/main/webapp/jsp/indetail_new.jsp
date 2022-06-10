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
		<div><a href="${pageContext.request.contextPath}/allnews" class="all">所有新闻</a></div> 
		<div><a href="search.jsp" class="search_1">搜索新闻</a></div>
		<div><a href="${pageContext.request.contextPath}/login.jsp" class="backManager">后台管理</a></div>
	</div>
	<hr>

	
	
	<div class="content_1">
	<%
	 String id=request.getParameter("id");
	 DBUtil db = new DBUtil();
	 ResultSet rs = db.getResult("select * from newsdetail where id="+id);
	 %>
	 <%
	while(rs.next()){
		
		int arr1 = Integer.valueOf(rs.getString("type"));
		String[] arr = { "科技", "动漫", "新闻" };
	%>
		<table width="700" border="0" cellspacing="0" cellpadding="0"> 
			<tr>
				<td >新闻标题</td>
				<td ><%=rs.getString("title")%></td>
			</tr>

			<tr>
				<td >新闻类型</td>
				<td ><%=arr[arr1]%></td>
			</tr>
			<tr>
				<td >新闻作者</td>
				<td ><%=rs.getString("author")%></td>
			</tr>
			<tr>
				<td width="">新闻内容</td>
				<td ><textarea rows="16" cols="80"><%=rs.getString("content")%></textarea></td>
			</tr>
			<tr>
				<td width="">发布时间</td>
				<td width=""><%=rs.getString("time") %></td>
			</tr>
		</table>	
		<%
		
		} 
		%>
			</div>
			
</body>
</html>