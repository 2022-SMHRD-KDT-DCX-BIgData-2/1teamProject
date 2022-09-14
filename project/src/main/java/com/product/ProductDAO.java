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
				dto.setMartName(rs.getString(2));
				dto.setCategoryName(rs.getString(3));
				dto.setProdName(rs.getString(4));
				dto.setProdPrice(rs.getInt(5));
				dto.setProdImage(rs.getString(6));
				dto.setLink(rs.getString(7));
				dto.setProdStar(rs.getFloat(8));
				dto.setProdReview(rs.getInt(9));
				return dto;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}	
	public ArrayList<ProductDTO> productList(String categoryName){
		String SQL = "select * from product where categoryName=?";
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1 , categoryName);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setProdCode(rs.getInt(1));
				dto.setMartName(rs.getString(2));
				dto.setCategoryName(rs.getString(3));
				dto.setProdName(rs.getString(4));
				dto.setProdPrice(rs.getInt(5));
				dto.setProdImage(rs.getString(6));
				dto.setLink(rs.getString(7));
				dto.setProdStar(rs.getFloat(8));
				dto.setProdReview(rs.getInt(9));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
