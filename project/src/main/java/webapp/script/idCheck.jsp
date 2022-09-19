<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
	String userid = request.getParameter("idcheck");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String SQL = "";
	String dbURL = "jdbc:mysql://project-db-stu.ddns.net:3307/seocho_0830_1?"+"useUnicode=true&characterEncoding=utf-8";
	String dbID = "seocho_0830_1";
	String dbpassword = "smhrd1";
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(dbURL,dbID,dbpassword);
		if(conn != null){
			SQL = "select userid from memberDB where userid = ?;";
			pstmt = conn.prepareStatement(SQL); 
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				out.println("아이디를 사용할 수 없습니다.");
			}else{
				out.println("사용가능한 아이디입니다.");
			}
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>