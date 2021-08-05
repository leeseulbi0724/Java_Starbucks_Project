package com.starbucks.dao;

import java.util.ArrayList;

import com.starbucks.vo.UserVO;

public class UserDAO extends DBConn {
	
	public boolean ChangePass(String id, String pass, String cpass) {
		boolean result = false;
		String sql = "update sb_member set pass=? where id = ? and pass=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, cpass);
			pstmt.setString(2, id);
			pstmt.setString(3, pass);
			
			
			int value = pstmt.executeUpdate();
			
			if(value != 0) {
				result = true;
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean ChangePass(String id, String pass) {
		boolean result = false;
		String sql = "update sb_member set pass=? where id = ?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, pass);
			pstmt.setString(2, id);			
			
			int value = pstmt.executeUpdate();
			
			if(value != 0) {
				result = true;
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	public boolean getDelete(String id) {
		boolean result = false;
		String sql = "DELETE FROM SB_MEMBER WHERE id = ?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, id);
			
			int value = pstmt.executeUpdate();
			
			if(value != 0) {
				result = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return result;
		
	}
	
	
	
	public boolean getPass(UserVO vo) {
		boolean result = false;
		String sql = "SELECT PASS FROM SB_MEMBER WHERE NAME=? AND ID=? AND HP=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getId());
			pstmt.setString(3, vo.getHp());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				result = true;
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public String getId(UserVO vo) {
		String id = null;
		String sql = "SELECT ID FROM SB_MEMBER WHERE NAME=? AND HP=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getHp());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				id = rs.getString(1);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return id;
	}
	
	public boolean getInsertResult(String id, String pass,String name, String email, String hp, String birth, String nick) {
		boolean result =  false;
		String sql = "insert into sb_member values(?,?,?,?,?,?,?, sysdate)";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.setString(5, hp);
			pstmt.setString(6, birth);
			pstmt.setString(7, nick);
			
			
			int value = pstmt.executeUpdate();
			
			if(value != 0) {
				result = true;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		close();
		return result;
	}
	
	public boolean getInsertResult(UserVO vo) {
		boolean result =  false;
		String sql = "insert into sb_member values(?,?,?,?,?,?,?, sysdate)";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPass());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getHp());
			pstmt.setString(6, vo.getBirth());
			pstmt.setString(7, vo.getNick());
			
			
			int value = pstmt.executeUpdate();
			
			if(value != 0) {
				result = true;
				close();
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	public boolean getUpdateResult(UserVO vo) {
		boolean result = false;
		String sql = "UPDATE SB_MEMBER SET NAME = ?, EMAIL= ? , HP= ?, BIRTH= ?, NICK= ? WHERE ID = ?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1,	vo.getName());
			pstmt.setString(2,	vo.getEmail());
			pstmt.setString(3,	vo.getHp());
			pstmt.setString(4,	vo.getBirth());
			pstmt.setString(5,	vo.getNick());
			pstmt.setString(6,	vo.getId());
			
			int value = pstmt.executeUpdate();
			
			if(value != 0) {
				result = true;
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	public boolean getLoginResult(String id, String pass) {
		
		boolean result = false;
		String sql= "select * from sb_member where id=? and pass=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = true;
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	public UserVO getMember(String id) {
		String sql = "SELECT NAME, NICK, HP, EMAIL, BIRTH FROM SB_MEMBER WHERE ID = ?";
		getPreparedStatement(sql);
		UserVO vo = new UserVO();
		try {
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				
				vo.setName(rs.getString(1));
				vo.setNick(rs.getString(2));
				vo.setHp(rs.getString(3));
				vo.setEmail(rs.getString(4));
				vo.setUser_birth(rs.getString(5));
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
		
	}
	public UserVO getMembertwo(String id) {
		String sql = "select \r\n" + 
				"substr(birth,1,4), \r\n" + 
				"substr(birth,6,2),\r\n" + 
				"substr(birth,9,2),\r\n" + 
				"substr(birth,12,1) \r\n" + 
				"from sb_member where id= ?";
		getPreparedStatement(sql);
		UserVO vo = new UserVO();
		try {
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				vo.setBirth_year(rs.getString(1));
				vo.setBirth_month(rs.getString(2));
				vo.setBirth_day(rs.getString(3));
				vo.setBirth_flag(rs.getString(4));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
		
	}
	public ArrayList<UserVO> getUserList(){
		ArrayList<UserVO> list = new ArrayList<UserVO>();
		String sql = "select rownum rno, id, name, birth, hp, email, nick, to_char(mdate, 'yyyy-mm-dd') mdate "
				+ "	from (select id, name, birth, hp, email, nick, mdate from sb_member "
				+ "			order by mdate desc)";
		getPreparedStatement(sql);
		
		try {
			rs = pstmt.executeQuery();
			while(rs.next()){
				UserVO vo = new UserVO();
				vo.setRno(rs.getInt(1));
				vo.setId(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setBirth(rs.getString(4));
				vo.setHp(rs.getString(5));
				vo.setEmail(rs.getString(6));
				vo.setNick(rs.getString(7));
				vo.setMdate(rs.getString(8));
				
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return list;
	}
}
