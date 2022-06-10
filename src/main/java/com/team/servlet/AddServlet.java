package com.team.servlet;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team.entity.NewsDetail;
import com.team.util.DBUtil;

@WebServlet("/add")
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String title = request.getParameter("title");
		String content =request.getParameter("content");
		String author = request.getParameter("author");
		String type = request.getParameter("type");
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String time=df.format(date);
		DBUtil db = new DBUtil();
		PreparedStatement ps;
		db.Insert("insert into newsdetail(title,content,author,time,type) values('"+title+"','"+content+"','"+author+"','"+time+"','"+type+"')");

		db.release();// 关闭数据流
	    response.sendRedirect("jsp/add.jsp");
		doGet(request, response);
	}

}
