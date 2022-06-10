package com.team.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team.util.DBUtil;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 处理登陆事件
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		// 获取页面传过来的值
		String userName = request.getParameter("userName");
		String userPw = request.getParameter("userPw");
		DBUtil db = new DBUtil();
		int userId=0;
		ResultSet rs = db.getResult("select * from admin where adminname = '" + userName + "' and adminpwd = '" + userPw +"'");
	    try {
			while(rs.next()) {
				userId=rs.getInt("adminid");
				userName=rs.getString("adminname");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(userId>0) {
			request.setAttribute("userId", userId);
			request.setAttribute("userName", userName);
			db.release();//关闭数据库操作
			request.getRequestDispatcher("jsp/a_index.jsp").forward(request, response);
		}else {
			db.release();//关闭数据库操作
			request.setAttribute("message", "请检查你的用户名或密码是否正确!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
	}
}
