package com.cart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.product.ProductDTO;

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
	
	public int add(String userId, String martName, String prodImage,String prodName,int prodPrice, String link ) {
		String SQL = "INSERT INTO cart VALUES (null,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(SQL); 
	        pstmt.setString(1, userId);
	        pstmt.setString(2, martName);
	        pstmt.setString(3, prodImage);
	        pstmt.setString(4, prodName);
	        pstmt.setInt(5, prodPrice);
	        pstmt.setString(6,link);
	        return pstmt.executeUpdate();
		}catch (Exception e) {
	    	  e.printStackTrace();
	      }
	      return -1;
	}
	public ArrayList<CartDTO> cartlist(String userid){
		String SQL = "select * from cart where userId=?";
		ArrayList<CartDTO> list = new ArrayList<CartDTO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1 , userid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CartDTO dto = new CartDTO();
				dto.setProdCode(rs.getInt(1));
				dto.setUserid(rs.getString(2));
				dto.setMartName(rs.getString(3));
				dto.setProdImage(rs.getString(4));
				dto.setProdName(rs.getString(5));
				dto.setProdPrice(rs.getInt(6));
				dto.setLink(rs.getString(7));
				
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	public int delete(int prodCode){
		String SQL = "delete from cart where prodCode=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1 , prodCode);
			return pstmt.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
