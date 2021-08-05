package com.starbucks.dao;

import java.util.ArrayList;

import com.starbucks.vo.menuVO;

public class menuDAO extends DBConn {
	
	//관리자 메뉴 삭제
	public boolean getMenuDelete(ArrayList<String> mlist) {
		boolean result = false;
		
		for (int i = 0; i<mlist.size(); i++) {
			String sql = "delete from sb_menu where mid=?";
			getPreparedStatement(sql);
			
			try {
				pstmt.setString(1, mlist.get(i));
				int val = pstmt.executeUpdate();
				
				if ( val != 0) {
					result = true;
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}			
		}
		
		close();
		return result;
	}
	
	
	//관리자 메뉴 등록
	public boolean getMenuInsert(menuVO vo) {
		boolean result = false;
		String sql = " insert into sb_menu values('m_'||sequ_menu.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		getPreparedStatement(sql);
		
		try {
			
			pstmt.setString(1, vo.getM_type());
			pstmt.setString(2, vo.getP_type());
			pstmt.setString(3, vo.getK_name());
			pstmt.setString(4, vo.getE_name());
			pstmt.setString(5, vo.getIntro_t());
			pstmt.setString(6, vo.getIntro_b());
			pstmt.setString(7, vo.getNutri_inform());
			pstmt.setString(8, vo.getKcal());
			pstmt.setString(9, vo.getFat());
			pstmt.setString(10, vo.getProtein());
			pstmt.setString(11, vo.getNa());
			pstmt.setString(12, vo.getSugar());
			pstmt.setString(13, vo.getCaffeine());
			pstmt.setString(14, vo.getAllergy());
			pstmt.setString(15, vo.getImg());
			pstmt.setString(16, vo.getM_new());
			pstmt.setString(17, vo.getLimit());
			pstmt.setString(18, vo.getTheme());
			
			int val = pstmt.executeUpdate();
			
			if(val != 0) {
				result=true;
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} 
		close();
		return result;
	}
	
	//관리자 메뉴 리스트
	public ArrayList<menuVO> getMenuList(){
		ArrayList<menuVO> list = new ArrayList<menuVO>();
		String sql = " select mid, k_name, img, kcal, sugar, protein, na, fat, caffeine, "
				+ " p_type, m_type, m_new, limit, theme from sb_menu order by m_type, p_type ";
		getPreparedStatement(sql);
		
		try {
			rs = pstmt.executeQuery();
			while(rs.next()) {
				menuVO vo = new menuVO();
				vo.setMid(rs.getString(1));
				vo.setK_name(rs.getString(2));
				vo.setImg(rs.getString(3));
				vo.setKcal(rs.getString(4));
				vo.setSugar(rs.getString(5));
				vo.setProtein(rs.getString(6));
				vo.setNa(rs.getString(7));
				vo.setFat(rs.getString(8));
				vo.setCaffeine(rs.getString(9));
				vo.setP_type(rs.getString(10));
				vo.setM_type(rs.getString(11));
				vo.setM_new(rs.getString(12));
				vo.setLimit(rs.getString(13));
				vo.setTheme(rs.getString(14));
				
				list.add(vo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		close();
		return list;
	}
	
	
	//음료 리스트
	public ArrayList<menuVO> getDrinkList(){
		ArrayList<menuVO> list = new ArrayList<menuVO>();
		String sql = " select mid, k_name, img, kcal, sugar, protein, na, fat, caffeine, "
				+ " p_type, m_type, m_new, limit, theme from sb_menu where m_type = '음료' order by mid ";
		getPreparedStatement(sql);
		
		try {
			rs = pstmt.executeQuery();
			while(rs.next()) {
				menuVO vo = new menuVO();
				vo.setMid(rs.getString(1));
				vo.setK_name(rs.getString(2));
				vo.setImg(rs.getString(3));
				vo.setKcal(rs.getString(4));
				vo.setSugar(rs.getString(5));
				vo.setProtein(rs.getString(6));
				vo.setNa(rs.getString(7));
				vo.setFat(rs.getString(8));
				vo.setCaffeine(rs.getString(9));
				vo.setP_type(rs.getString(10));
				vo.setM_type(rs.getString(11));
				vo.setM_new(rs.getString(12));
				vo.setLimit(rs.getString(13));
				vo.setTheme(rs.getString(14));
				
				list.add(vo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		close();
		return list;
	}
	//푸드 리스트
	public ArrayList<menuVO> getFoodList(){
		ArrayList<menuVO> list = new ArrayList<menuVO>();
		String sql = " select mid, k_name, img, kcal, sugar, protein, na, fat, p_type, m_type, m_new, limit, theme from sb_menu where m_type = '푸드' order by mid ";
		getPreparedStatement(sql);
		
		try {
			rs = pstmt.executeQuery();
			while(rs.next()) {
				menuVO vo = new menuVO();
				vo.setMid(rs.getString(1));
				vo.setK_name(rs.getString(2));
				vo.setImg(rs.getString(3));
				vo.setKcal(rs.getString(4));
				vo.setSugar(rs.getString(5));
				vo.setProtein(rs.getString(6));
				vo.setNa(rs.getString(7));
				vo.setFat(rs.getString(8));
				vo.setP_type(rs.getString(9));
				vo.setM_type(rs.getString(10));
				vo.setM_new(rs.getString(11));
				vo.setLimit(rs.getString(12));
				vo.setTheme(rs.getString(13));
				
				list.add(vo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		close();
		return list;
	}
	//상품 리스트
	public ArrayList<menuVO> getProductList(){
		ArrayList<menuVO> list = new ArrayList<menuVO>();
		String sql = " select mid, k_name, img, p_type, m_type, m_new, limit, theme from sb_menu where m_type = '상품' order by mid ";
		getPreparedStatement(sql);
		
		try {
			rs = pstmt.executeQuery();
			while(rs.next()) {
				menuVO vo = new menuVO();
				vo.setMid(rs.getString(1));
				vo.setK_name(rs.getString(2));
				vo.setImg(rs.getString(3));
				vo.setP_type(rs.getString(4));
				vo.setM_type(rs.getString(5));
				vo.setM_new(rs.getString(6));
				vo.setLimit(rs.getString(7));
				vo.setTheme(rs.getString(8));
				
				list.add(vo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		close();
		return list;
	}
	//신상 리스트
		public ArrayList<menuVO> getNewList(){
			ArrayList<menuVO> list = new ArrayList<menuVO>();
			String sql = " select mid, k_name, img, limit from sb_menu where limit='limit' order by mid ";
			getPreparedStatement(sql);
			
			try {
				rs = pstmt.executeQuery();
				while(rs.next()) {
					menuVO vo = new menuVO();
					vo.setMid(rs.getString(1));
					vo.setK_name(rs.getString(2));
					vo.setImg(rs.getString(3));
					vo.setLimit(rs.getString(4));
					
					list.add(vo);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			close();
			return list;
		}
	
	//상세화면 이미지들
	public ArrayList<menuVO> getImg(){
		ArrayList<menuVO> list = new ArrayList<menuVO>();
		String sql = " select big_img, small_img from sb_menu_detail ";
		getPreparedStatement(sql);
		
		try {
			rs = pstmt.executeQuery();
			while(rs.next()) {
				menuVO vo = new menuVO();
				vo.setBig_img(rs.getString(1));
				vo.setSmall_img(rs.getString(2));
				
				list.add(vo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		close();
		return list;
	}
	
	
	//상세메뉴
	public menuVO getMenuDetail(String mid){
		menuVO vo = new menuVO();
		String sql = "select m_type, k_name, e_name, intro_t, intro_b, nutri_inform, kcal, "
				+ " fat, protein, na, sugar, caffeine, allergy, img, p_type "
				+ " from sb_menu where mid=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setM_type(rs.getString(1));
				vo.setK_name(rs.getString(2));
				vo.setE_name(rs.getString(3));
				vo.setIntro_t(rs.getString(4));
				vo.setIntro_b(rs.getString(5));
				vo.setNutri_inform(rs.getString(6));
				vo.setKcal(rs.getString(7));
				vo.setFat(rs.getString(8));
				vo.setProtein(rs.getString(9));
				vo.setNa(rs.getString(10));
				vo.setSugar(rs.getString(11));
				vo.setCaffeine(rs.getString(12));
				vo.setAllergy(rs.getString(13));
				vo.setImg(rs.getString(14));
				vo.setP_type(rs.getString(15));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		close();
		return vo;
		
	}
	
	
}