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
import javax.websocket.Session;

import com.team.entity.NewsDetail;
import com.team.util.DBUtil;

@WebServlet("/delnew")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session= request.getSession();
		String id = request.getParameter("id");
		DBUtil db = new DBUtil();
		db.Delete("delete from newsdetail where id ='"+id+"'");
		
		ResultSet rs = db.getResult("select * from newsdetail");
	    ArrayList<NewsDetail> list=new ArrayList<NewsDetail>();	
	    
	    try {
			while(rs.next()) {
				NewsDetail nd= new NewsDetail();
				nd.setId(rs.getInt("id"));
				nd.setTitle(rs.getString("title"));
				nd.setContent(rs.getString("content"));
				nd.setAuthor(rs.getString("author"));
				nd.setTime(rs.getString("time"));
				nd.setType(rs.getInt("type"));
				list.add(nd);
				}
			 System.out.print(list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			if(db!=null) {
				db.release();
			}
		}
	   
	    session.setAttribute("list", list);
		
	    response.sendRedirect("jsp/allnews_1.jsp");
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
