package com.starbucks.dao;

import com.starbucks.vo.eventVO;

public class eventDAO extends DBConn {
	
	/** �̺�Ʈ ���̵� �޾Ƽ� �� ���� �������� **/
	public eventVO getContentResult(String eid) {
		eventVO vo = new eventVO();
		
		String sql = "SELECT TITLE, TO_CHAR(START_DATE,'YYYY-MM-DD'), TO_CHAR(LAST_DATE,'YYYY-MM-DD'), EID FROM SB_EVENT WHERE EID=?";
		getPreparedStatement(sql);
		
		try {
		
			pstmt.setString(1, eid);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				vo.setTitle(rs.getString(1));
				vo.setStart_date(rs.getString(2));
				vo.setLast_date(rs.getString(3));
				vo.setEid(rs.getString(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return vo;
	}	
	
}
