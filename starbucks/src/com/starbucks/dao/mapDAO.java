package com.starbucks.dao;

import java.util.ArrayList;

import com.starbucks.vo.mapVO;

public class mapDAO extends DBConn {
	
	/** ������ ��/���� ��/�� �������� **/
	public ArrayList<mapVO> getData(String name) {
		ArrayList<mapVO> list = new ArrayList<mapVO>();
		
		String sql = "SELECT PROVINCE, COUNTY FROM SB_MAP WHERE PROVINCE=?";
		getPreparedStatement(sql);		
		
		
		try {
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				mapVO vo = new mapVO();
				vo.setProvince(rs.getString(1));
				vo.setCounty(rs.getString(2));
				
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return list;
		
	}

}
