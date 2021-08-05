package com.starbucks.dao;

import java.util.ArrayList;

import com.starbucks.vo.serviceVO;

public class serviceDAO extends DBConn {
	
	/** ���� ����ϱ� **/
	public boolean getInsertResult(serviceVO vo) {
		boolean result = false;
		
		String sql = "INSERT INTO SB_SERVICE VALUES('S_'||SEQU_SB_SERVICE_SID.NEXTVAL,?,?,?,?,?,?,?,SYSDATE,?,?,0)";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getCategory());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getHp());
			pstmt.setString(5, vo.getPlace());
			pstmt.setString(6, vo.getTitle());
			pstmt.setString(7, vo.getContent());
			pstmt.setString(8, vo.getEfile());
			pstmt.setString(9, vo.getSfile());
			
			int val = pstmt.executeUpdate();
			
			if ( val != 0) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return result;
	}
	
	/** ���� ���� ���� �������� (�����Ϸ�) **/
	public int getBeforeCount(String name) {
		int count = 0;
		
		String sql = "SELECT COUNT(*) FROM SB_SERVICE WHERE ID=? AND REPLY=0";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, name);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	/** ���� ���� ���� �������� (�亯�Ϸ�) **/
	public int getAfterCount(String name) {
		int count = 0;
		
		String sql = "SELECT COUNT(*) FROM SB_SERVICE WHERE ID=? AND REPLY=1";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, name);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	/** ��ü ���� ���� �������� **/
	public ArrayList<serviceVO> getSelectResult() {
		ArrayList<serviceVO> list = new ArrayList<serviceVO>();
		
		String sql = " SELECT ROWNUM NUM, SID, CATEGORY, ID, TITLE, TO_CHAR(SDATE,'YYYY-MM-DD'), REPLY, EFILE, SFILE"
				+ " FROM(SELECT SID, CATEGORY, ID, TITLE, SDATE, REPLY, EFILE, SFILE FROM SB_SERVICE ORDER BY SDATE)"
				+ " ORDER BY NUM DESC";
		getPreparedStatement(sql);
		
		try {
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				serviceVO vo = new serviceVO();
				
				vo.setRno(rs.getInt(1));
				vo.setSid(rs.getString(2));
				vo.setCategory(rs.getString(3));
				vo.setId(rs.getString(4));
				vo.setTitle(rs.getString(5));
				vo.setSdate(rs.getString(6));
				vo.setReply(rs.getInt(7));
				vo.setEfile(rs.getString(8));
				vo.setSfile(rs.getString(9));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return list;
	}
	
	/** ���� �α��� ���� ���� ���� �������� **/
	public ArrayList<serviceVO> getSelectResult(String name) {
		ArrayList<serviceVO> list = new ArrayList<serviceVO>();
		
		String sql = " SELECT ROWNUM NUM, SID, CATEGORY, ID, TITLE, TO_CHAR(SDATE,'YYYY-MM-DD'), REPLY, EFILE, SFILE"
				+ " FROM(SELECT SID, CATEGORY, ID, TITLE, SDATE, REPLY, EFILE, SFILE FROM SB_SERVICE WHERE ID=? ORDER BY SDATE)"
				+ " ORDER BY NUM DESC";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				serviceVO vo = new serviceVO();
				
				vo.setRno(rs.getInt(1));
				vo.setSid(rs.getString(2));
				vo.setCategory(rs.getString(3));
				vo.setId(rs.getString(4));
				vo.setTitle(rs.getString(5));
				vo.setSdate(rs.getString(6));
				vo.setReply(rs.getInt(7));
				vo.setEfile(rs.getString(8));
				vo.setSfile(rs.getString(9));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/** �ش� ���� �������������� **/
	public serviceVO getContentResult(String sid) {
		serviceVO vo = new serviceVO();
		
		String sql = "SELECT ID, CATEGORY, MAIL, HP, PLACE, TITLE, CONTENT, SDATE, EFILE, SFILE FROM SB_SERVICE WHERE SID=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, sid);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo.setId(rs.getString(1));
				vo.setCategory(rs.getString(2));
				vo.setEmail(rs.getString(3));
				vo.setHp(rs.getString(4));
				vo.setPlace(rs.getString(5));
				vo.setTitle(rs.getString(6));
				vo.setContent(rs.getString(7));
				vo.setSdate(rs.getString(8));
				vo.setEfile(rs.getString(9));
				vo.setSfile(rs.getString(10));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	/** ���� ��� �����ϱ� **/
	public boolean getCommentInsert(String comment, String sid) {
		boolean result = false;
		
		String sql = "INSERT INTO SB_SERVICE_COMMENT VALUES(?,?,SYSDATE)";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, sid);
			pstmt.setString(2, comment);
			
			int val = pstmt.executeUpdate();
			
			if ( val != 0) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/** ���� ��� ���� �Ϸ� �� �亯���� �����ϱ� **/
	public void getReplyResult(String sid) {
		
		
		String sql = "UPDATE SB_SERVICE SET REPLY=1 WHERE SID=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, sid);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
	}
	
	/** ���� ��� ��ü ���� �������� **/
	public ArrayList<serviceVO> getCommentResult() {
		ArrayList<serviceVO> list = new ArrayList<serviceVO>();
		
		String sql = "SELECT SID, MENT, TO_CHAR(CDATE,'YYYY-MM-DD') FROM SB_SERVICE_COMMENT";
		getPreparedStatement(sql);
		
		try {
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				serviceVO vo = new serviceVO();
				vo.setSid(rs.getString(1));
				vo.setComment(rs.getString(2));
				vo.setCdate(rs.getString(3));
				
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return list;
	}
	
	/** �ش� ���� �亯 �������� **/
	public serviceVO getCommentResult(String sid) {
		serviceVO vo = new serviceVO();
		
		String sql = "SELECT SID, MENT, CDATE FROM SB_SERVICE_COMMENT WHERE SID=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, sid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				vo.setSid(rs.getString(1));
				vo.setComment(rs.getString(2));
				vo.setCdate(rs.getString(3));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
		
	}
	
	

}
