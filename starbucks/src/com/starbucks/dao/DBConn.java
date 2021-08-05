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
	    		//1�ܰ� - ����̹� �ε�
				Class.forName("oracle.jdbc.driver.OracleDriver");
				System.out.print("1�ܰ�");
				
				//2�ܰ� - Connection ��ü ����
				conn = DriverManager.getConnection(url, user, pass);
				System.out.print("2�ܰ�");
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  	
			
		}
		//Method
		public void getStatement() {
			try {			
				//3�ܰ� - Statement ��ü ����
				stmt = conn.createStatement();
				System.out.print("3�ܰ�");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//Method
		public void getPreparedStatement(String sql) {
			try {			
				//3�ܰ� - Statement ��ü ����
				pstmt = conn.prepareStatement(sql);
				System.out.print("3�ܰ�");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public void close() {
			try {
				//6�ܰ� - ��������
		    	if(rs != null) rs.close();
		    	if (pstmt != null) pstmt.close();
		    	if (conn != null) conn.close();
		    	
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
}
