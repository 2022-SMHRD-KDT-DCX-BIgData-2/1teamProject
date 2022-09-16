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
	// 밑에 productAll() 로직을 통해서 전체상품의 길이를 추출 -> prodCode 값에 0~전체상품길이 중 랜덤값이 들어와서 상품정보를 리턴해주는 로직
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
	
	//상품 리스트를 카테고리 기준으로 조회 하는 DAO문 
	public ArrayList<ProductDTO> productList(String categoryName){
		
		String SQL = "select * from product where categoryName=?";
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		try {
			//셀렉트 구문 작동 시켜서 pstmt에 값을 저장
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			//매개 변수로 들어온 값을 위 SQL 문안에 ? 값에 대입시켜줌
			pstmt.setString(1 , categoryName);
			//rs 값에 SQL 문으로 검색한 정보를 넣어줌 
			rs = pstmt.executeQuery();
			// rs에 값이 있으면 다음값이 없을때까지 무한 반복문 작동
			while(rs.next()) {
				//rs가 객체? 형태로 값을 받아옴 데이터베이스 안에 있는 컬럼값 기준으로해서 1번부터 ~9번까지 값을 받아오고
				//데이터 베이스에있는 컬럼value 값의 자료형에 따라 rs.getInt / rs.getString()... 등으로 값을 가져온후
				//값에 맞는 dto 값을 세팅 해줌
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
				//값에 맞는 dto 값을 위에 선언해준 ArrayList에 값을 넣어줌
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		//반복문이 다끝나면 호출해준 곳으로 ArrayList의 정보를 리턴해줌
		return list;
	}
	//위 방식과 동일한 방식으로 모든 상품의 정보를 담아주는 로직
	//mainPage 추천 상품정보를 보여주기위해 전체상품정보의 총 갯수를 가져오기위해 사용한 로직입니다.
	public ArrayList<ProductDTO> productAll(){
		String SQL = "select * from product";
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
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
	//키워드 및 검색 기능 DAO
	
	public ArrayList<ProductDTO> productSearch(String search){
		//밑에 셀렉트 구문처럼 %매개변수% 를 사용하게됐을때 해당 값을 포함하고 있는 모든 정보를 받아오게됨 !  
		String SQL = "select * from product where prodName like '%%"+search+"%%';";
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
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
	
	//마트이름 기준으으로 상품정보를 받아오는 로직 작동 형식은 위 DAO 로직과 동일함 
	public ArrayList<ProductDTO> martprod(String martName){
		String SQL = "select * from "+martName+";";
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
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
