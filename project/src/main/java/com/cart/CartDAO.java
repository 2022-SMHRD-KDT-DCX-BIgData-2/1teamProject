package com.cart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CartDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public CartDAO(){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String dbURL = "jdbc:mysql://project-db-stu.ddns.net:3307/seocho_0830_1?"+"useUnicode=true&characterEncoding=utf-8";
			String dbID = "seocho_0830_1";
			String dbpassword = "smhrd1";
			conn = DriverManager.getConnection(dbURL,dbID,dbpassword);
			System.out.println("DB연결성공");
		}catch(Exception e) {
			System.out.println("DB연결실패");
			e.printStackTrace();
		}
	}
	
	
	public int check(CartDTO dto) {
		String SQL= "SELECT * FROM product WHERE userid= ?";
		try {
	        pstmt.setString(1, dto.getUserid());
	        pstmt.setString(2, dto.getMartName());
	        pstmt.setString(3, dto.getProdImage());
	        pstmt.setString(4, dto.getProdName());
	        pstmt.setInt(5, dto.getProdPrice()); 
			rs= pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1) == dto.getPwd())
					return 1; 
				else
					return 0; 
			}
			return -1; // 아이디 없음
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //DB연결 오류
	}		
	
	
	public int add(CartDTO dto) {
		String SQL = "INSERT INTO cart VALUES (?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL); 
	        pstmt.setString(1, dto.getUserid());
	        pstmt.setString(2, dto.getMartName());
	        pstmt.setString(3, dto.getProdImage());
	        pstmt.setString(4, dto.getProdName());
	        pstmt.setInt(5, dto.getProdPrice()); 
	        
	        return pstmt.executeUpdate();
		}catch (Exception e) {
	    	  e.printStackTrace();
	      }
	      return -1;
	}
	
	public int delete(CartDTO dto) {
		String SQL = "DELETE * FROM cart WHERE userid=?";
		try {
			pstmt = conn.prepareStatement(SQL); 
	        pstmt.setString(1, dto.getUserid());
	        pstmt.setString(2, dto.getMartName());
	        pstmt.setString(3, dto.getProdImage());
	        pstmt.setString(4, dto.getProdName());
	        pstmt.setInt(5, dto.getProdPrice()); 
	        
	        return pstmt.executeUpdate();
		}catch (Exception e) {
	    	  e.printStackTrace();
	      }
	      return -1;
	}
}
