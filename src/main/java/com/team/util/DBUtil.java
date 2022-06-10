package com.team.util;

import java.sql.*;

public class DBUtil {
    Connection conn=null;
    Statement stat=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    public Connection getConn(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/news","root","123456");
            System.out.println("数据库连接成功！");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
    public void release(){
        try{
            if(rs!=null){
                rs.close();
            }
            if(stat!=null){
                stat.close();
            }
            if(conn!=null){
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public ResultSet getResult(String sql,String []args){
        rs=null;
        if(conn==null){
            conn=this.getConn();
            System.out.println("数据库连接成功！");
        }
        try{
            ps=conn.prepareStatement(sql);
            for(int i=0;i<args.length;i++){
                ps.setString(i+1,args[i]);
            }
            rs=ps.executeQuery();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return rs;
    }

    public ResultSet getResult(String sql){
        rs=null;
        if(conn==null){
            conn=this.getConn();
        }
        try{
            stat=conn.createStatement();
            rs=stat.executeQuery(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rs;
    }
    public void Insert(String sql){
    	if(conn==null){
            conn=this.getConn();
        }
    	try {
			ps=conn.prepareStatement(sql);
			ps.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    public void Delete(String sql){
    	if(conn==null){
            conn=this.getConn();
        }
    	try {
			ps=conn.prepareStatement(sql);
			ps.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    public void Update(String sql){
    	if(conn==null){
            conn=this.getConn();
        }
    	try {
			ps=conn.prepareStatement(sql);
			ps.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
//    public static void main(String[] args) {
//		DBUtil db  = new DBUtil();
//		db.getConn();
//	}

}
