package com.starbucks.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConn {
		//Field
		String url = "jdbc:oracle:thin:@localhost:1521";
		String user = "scott";
		String pass = "tiger";
		Connection conn;
		PreparedStatement pstmt;
		Statement stmt;
		ResultSet rs;
		
		//Constructor
		public DBConn() {
	    	try {
	    		//1단계 - 드라이버 로딩
				Class.forName("oracle.jdbc.driver.OracleDriver");
				System.out.print("1단계");
				
				//2단계 - Connection 객체 생성
				conn = DriverManager.getConnection(url, user, pass);
				System.out.print("2단계");
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  	
			
		}
		//Method
		public void getStatement() {
			try {			
				//3단계 - Statement 객체 생성
				stmt = conn.createStatement();
				System.out.print("3단계");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//Method
		public void getPreparedStatement(String sql) {
			try {			
				//3단계 - Statement 객체 생성
				pstmt = conn.prepareStatement(sql);
				System.out.print("3단계");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public void close() {
			try {
				//6단계 - 연결종료
		    	if(rs != null) rs.close();
		    	if (pstmt != null) pstmt.close();
		    	if (conn != null) conn.close();
		    	
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
}
