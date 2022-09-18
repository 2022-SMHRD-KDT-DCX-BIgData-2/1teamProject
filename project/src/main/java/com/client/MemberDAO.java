package com.client;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.client.MemberDTO;

public class MemberDAO{
		
		private Connection conn;
		private PreparedStatement pstmt;
		private ResultSet rs;
		
		public MemberDAO(){
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
		
		public int login(String Userid, String Pwd) {
			String SQL= "SELECT pwd FROM memberDB WHERE userid= ?";
			try {
				pstmt= conn.prepareStatement(SQL);
				pstmt.setString(1, Userid);
				rs= pstmt.executeQuery();
				if(rs.next()) {
					if(rs.getString(1).equals(Pwd))
						return 1; // 로그인 성공
					else
						return 0; // 비밀번호 불일치
				}
				return -1; // 아이디 없음
			}catch(Exception e) {
				e.printStackTrace();
			}
			return -2; //DB연결 오류
		}		
		
		public int join(MemberDTO dto){
			String SQL= "INSERT INTO memberDB VALUES (?,?,?,?,?)";
		      try {		         
		         pstmt = conn.prepareStatement(SQL);   
		         pstmt.setString(1, dto.getName());
		         pstmt.setString(2, dto.getUserid());
		         pstmt.setString(3, dto.getPwd());
		         pstmt.setString(4, dto.getEmail_id()+"@"+dto.getEmail_domain());
		         pstmt.setString(5, dto.getPhone()); 
		         
		         return pstmt.executeUpdate();
		      } catch (Exception e) {
		    	  e.printStackTrace();
		      }
		      return -1;
		   }
		
		//아이디 중복체크..
		public boolean idcheck(String userid) {	
			String SQL = "SELECT userid from memberDB";
			try {
				pstmt = conn.prepareStatement(SQL); 
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					if(rs.getString("userid").equals(userid)) {
						return true;
					}
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return false;
			
		}
	}
	