package com.product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class ProductDAO {

	private Connection conn;
	private ResultSet rs;
	
	public ProductDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String dbURL = "jdbc:mysql://localhost:3306/lotte?"+"useUnicode=true&characterEncoding=utf-8";
			String dbID = "root";
			String dbpassword = "1234";
			conn = DriverManager.getConnection(dbURL,dbID,dbpassword);
			System.out.println("DB연결성공");
		}catch(Exception e) {
			System.out.println("DB연결실패");
			e.printStackTrace();
		}
	}
	
	public ProductDTO mainSug(int prodCode) {
		String SQL = "select * from product where prodCode= ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1 , prodCode);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setProdCode(rs.getInt(1));
				dto.setCategoryName(rs.getString(2));
				dto.setProdName(rs.getString(3));
				dto.setProdPrice(rs.getInt(4));
				dto.setProdImage(rs.getString(5));
				dto.setLink(rs.getString(6));
				dto.setProdStar(rs.getFloat(7));
				dto.setProdReview(rs.getInt(8));
				return dto;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}	
}
