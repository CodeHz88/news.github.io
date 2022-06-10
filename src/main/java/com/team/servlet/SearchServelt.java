package com.team.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team.entity.NewsDetail;
import com.team.util.DBUtil;

@WebServlet("/SearchServlet")
public class SearchServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SearchServelt() {
		super();
		// TODO Auto-generated constructor stub
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 处理登陆事件
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session= request.getSession();
		// 获取页面传过来的值
		String str = request.getParameter("search");
		System.out.print(str);
		
		if(str==null){
			System.out.println("查询失败！");
		}else {
			
			DBUtil db = new DBUtil();
			ResultSet rs = db.getResult("select * from newsdetail where title  like '%" + str + "%'");
			ArrayList<NewsDetail> list = new ArrayList<NewsDetail>();

			try {
				while (rs.next()) {
					NewsDetail nd = new NewsDetail();
					nd.setId(rs.getInt("id"));
					nd.setTitle(rs.getString("title"));
					nd.setContent(rs.getString("content"));
					nd.setAuthor(rs.getString("author"));
					nd.setTime(rs.getString("time"));
					nd.setType(rs.getInt("type"));
					list.add(nd);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				if (db != null) {
					db.release();
				}
			}
			
			session.setAttribute("list", list);
			session.setAttribute("str", str);
			response.sendRedirect("jsp/search_1.jsp");
		}
		
	}

}
