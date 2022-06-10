<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.team.util.DBUtil"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>新闻管理系统</title>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css"/>
<script>
	//判断输入是否为空
	function Login() {
		//获取输入框的内容
		var userName = $('#userName').val();
		var userPw = $('#userPw').val();

		if (userName == '' || userPw == '') {
			alert('用户名或密码不能为空！！！');
		} else {
			document.getElementById("loginForm").submit();
		}

	}
</script>
</head>

<body>
	
	<h2>新闻管理系统</h2>

	<div class="title">
		<div><a href="#" class="all">所有新闻</a></div>
		 <div><a href="#" class="search_1">添加新闻</a> </div>
		 <div><a href="#" class="backManager">系统登录</a></div>
		  <div><a href="index.jsp " class="backManager">新闻主页</a></div>
	</div>
	<hr>
	
	<div class="login_1">
		<h3>管理员登录</h3>
		<form action="LoginServlet" method="post" id="loginForm" name="loginForm">
		
		管理员账号：<input type="text" id="userName" name="userName" placeholder="输入账号"><br>
		管理员密码：<input type="password" id="userPw" name="userPw" placeholder="输入密码"><br>
		
		<button class="" type="button" onclick="Login();">登录</button>
		</form>
		
	</div>

</body>
</html>