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
		 <div><a href="#" class="backManager">系统登录</a></div>
		  <div><a href="${pageContext.request.contextPath}/exit" class="backManager">退出系统</a></div>
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
	<form action="${pageContext.request.contextPath}/edit?id=<%=id %>" method="post">
		<table width="700" border="0" cellspacing="0" cellpadding="0"> 
			<tr>
				<td >新闻标题</td>
				<td><input type="text" name="title" value="<%=rs.getString("title")%>"/></td>
			</tr>

			<tr>
				<td >新闻类型</td>
				<td><input type="text" name="type" value="<%=arr[arr1]%>"/></td>
			</tr>
			<tr>
				<td >新闻作者</td>
				<td><input type="text" name="author" value="<%=rs.getString("author")%>"/></td>
			</tr>
			<tr>
				<td>新闻内容</td>
				<td ><textarea rows="16" cols="80" name="content"><%=rs.getString("content")%></textarea></td>
			</tr>
			<tr>
				<td>发布时间</td>
				<td><input type="text" name="time" value="<%=rs.getString("time")%>"/></td>
			</tr>
		</table>
		<button type="submit" style="margin-left:550px ">编辑提交</button>
		</form>	
		<%
		
		}
		%>
			</div>
			
</body>
</html>