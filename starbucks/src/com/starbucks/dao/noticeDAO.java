package com.starbucks.dao;

import java.sql.Blob;
import java.util.ArrayList;
import com.starbucks.vo.noticeVO;

public class noticeDAO extends DBConn {
	
	
	/** 공지사항 글쓰기 **/
	public boolean getInsertResult(noticeVO vo) {
		boolean result = false;		
		
		try {
			String sql = "INSERT INTO SB_NOTICE VALUES('N_'||SEQU_SB_NOTICE_NID.NEXTVAL,?,?,SYSDATE,0,?,?)";
			getPreparedStatement(sql);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getNfile());
			pstmt.setString(4, vo.getSfile());
			
			int val = pstmt.executeUpdate();
			
			if ( val != 0) {
				result=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return result;
	}
	
	/** 공지사항 목록 **/
	public ArrayList<noticeVO> getSelectResult() {
		ArrayList<noticeVO> list = new ArrayList<noticeVO>();
		
		try {
			String sql = " SELECT ROWNUM RNO, NID, TITLE, CONTENT, TO_CHAR(NDATE,'YYYY-MM-DD'), COUNT, SFILE"
					+ " FROM(SELECT ROWNUM RNO, NID, TITLE, CONTENT, NDATE, COUNT, SFILE "
					+ " FROM(SELECT NID, TITLE, CONTENT, NDATE, COUNT, SFILE FROM SB_NOTICE ORDER BY NID DESC) ORDER BY RNO DESC) "
					+ " ORDER BY NDATE DESC";
			getPreparedStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				noticeVO vo = new noticeVO();
				vo.setNo(rs.getInt(1));
				vo.setNid(rs.getString(2));
				vo.setTitle(rs.getString(3));
				vo.setContent(rs.getString(4));
				vo.setDate(rs.getString(5));
				vo.setCount(rs.getInt(6));
				vo.setSfile(rs.getString(7));
				
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return list;
	}
	
	/** 공지사항 목록 : 페이징 처리 **/
	public ArrayList<noticeVO> getList(int start, int end){
		ArrayList<noticeVO> list = new ArrayList<noticeVO>();
		String sql = " SELECT RNO, NID, TITLE, CONTENT, TO_CHAR(NDATE, 'YYYY-MM-DD'), COUNT"
							+ " FROM ( SELECT ROWNUM RNO, NID, TITLE, CONTENT, NDATE, COUNT"
							+ " FROM(SELECT ROWNUM RNO, NID, TITLE, CONTENT, NDATE, COUNT"
							+ " FROM(SELECT NID, TITLE, CONTENT, NDATE, COUNT FROM SB_NOTICE ORDER BY NID DESC) ORDER BY RNO DESC)"
							+ " ORDER BY NDATE DESC) WHERE RNO BETWEEN ? AND ?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				noticeVO vo = new noticeVO();
				vo.setNo(rs.getInt(1));
				vo.setNid(rs.getString(2));
				vo.setTitle(rs.getString(3));
				vo.setContent(rs.getString(4));
				vo.setDate(rs.getString(5));
				vo.setCount(rs.getInt(6));
				
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		
		return list;
	}
	
	/** 전체 카운트 가져오기 **/
	//execTotalCount()
	public int execTotalCount(){
		int count = 0;
		String sql = " SELECT COUNT(*) FROM SB_NOTICE";
		getPreparedStatement(sql);
		
		try {
			rs = pstmt.executeQuery();
			if(rs.next()) count = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return count;
	}
	
	/** 공지사항 상세보기 **/
	public noticeVO getContentResult(String nid) {
		noticeVO vo = new noticeVO();
		
		try {
			String sql = "SELECT TITLE, CONTENT, SFILE, NFILE FROM SB_NOTICE WHERE NID=?";
			getPreparedStatement(sql);
			
			pstmt.setString(1, nid);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				vo.setTitle(rs.getString(1));
				vo.setContent(rs.getString(2));
				vo.setSfile(rs.getString(3));
				vo.setNfile(rs.getString(4));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	/** 공지사항 삭제 **/
	public boolean getDeleteResult(ArrayList<String> nlist) {
		boolean result = false;
		for (int i = 0; i<nlist.size(); i++) {
			String sql = "DELETE FROM SB_NOTICE WHERE NID=?";
			getPreparedStatement(sql);
			
			try {
				pstmt.setString(1, nlist.get(i));
				
				int val = pstmt.executeUpdate();
				
				if ( val != 0) {
					result = true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}
		close();
		return result;
	}
	
	/** 공지사항 수정 (파일x) **/
	public boolean getUpdateResult(noticeVO vo) {
		boolean result =false;
		
		String sql = "UPDATE SB_NOTICE SET TITLE=?, CONTENT=? WHERE NID=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getNid());
			
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
	
	/** 공지사항 수정 (파일o) **/
	public boolean getUpdateFileResult(noticeVO vo) {
		boolean result =false;
		
		String sql = "UPDATE SB_NOTICE SET TITLE=?, CONTENT=?, NFILE=?, SFILE=? WHERE NID=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getNfile());
			pstmt.setString(4, vo.getSfile());
			pstmt.setString(5, vo.getNid());
			
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
	
	/** 공지사항 클릭시 조회수 추가 **/
	public void getCountUp(String nid) {
		
		String sql = "UPDATE SB_NOTICE SET COUNT=COUNT+1 WHERE NID=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, nid);			
			pstmt.executeUpdate();			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
	}	
	
	/** 공지사항 이전글 다음글 가져오기 **/
	public noticeVO getNext(int count) {
		noticeVO vo = new noticeVO();
		
		String sql = " SELECT RNO, NID, TITLE"
				+ " FROM ( SELECT ROWNUM RNO, NID, TITLE"
				+ " FROM(SELECT ROWNUM RNO, NID, TITLE"
				+ " FROM(SELECT NID, TITLE FROM SB_NOTICE ORDER BY NID DESC) ORDER BY RNO DESC)"
				+ " ORDER BY NID DESC) WHERE RNO=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setInt(1, count);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo.setNo(rs.getInt(1));
				vo.setNid(rs.getString(2));
				vo.setTitle(rs.getString(3));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return vo;
	}

	
}