package com.starbucks.dao;

import java.util.ArrayList;

import com.starbucks.vo.CoffeeVO;
import com.starbucks.vo.menuVO;

public class coffeeDAO extends DBConn {
	//관리자 커피 메뉴 삭제
	public boolean getDeleteResult(ArrayList<String> clist) {
		boolean result = false;
		
		for (int i = 0; i<clist.size(); i++) {
			String sql = "delete from sb_coffee_detail where dproduct_name=?";
			getPreparedStatement(sql);
			
			try {
				pstmt.setString(1, clist.get(i));
				int val = pstmt.executeUpdate();
				
				if ( val != 0) {
					result = true;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}
		return result;
	}
 	public boolean getListDeleteResult(ArrayList<String> clist) {
		boolean result = false;
		
		for (int i = 0; i<clist.size(); i++) {
			String sql = "delete from sb_coffee_img where cimg_text=?";
			getPreparedStatement(sql);
			
			try {
				pstmt.setString(1, clist.get(i));
				int val = pstmt.executeUpdate();
				
				if ( val != 0) {
					result = true;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}
		return result;
	}
	
	
	//관리자 커피 상세 메뉴 등록
	public boolean getMenuInsert(CoffeeVO vo) {
		boolean result = false;
		String sql = " insert into sb_coffee_detail values('d_'||sequ_starbucks_id.nextval,?,?,?,?,?,?,?,?,?,?,?,?)";
		getPreparedStatement(sql);
		
		try {
			
			pstmt.setString(1, vo.getCtype_id());
			pstmt.setString(2, vo.getCimg_file());
			pstmt.setString(3, vo.getDproduct_name());
			pstmt.setString(4, vo.getDproduct_ename());
			pstmt.setString(5, vo.getDproduct_text());
			pstmt.setString(6, vo.getDproduct_note());
			pstmt.setString(7, vo.getDproduct_enjoy());
			pstmt.setString(8, vo.getDproduct_content());
			pstmt.setString(9, vo.getDproduct_story());
			pstmt.setString(10, vo.getDproduct_tasting());
			pstmt.setString(11, vo.getProduct_name());
			pstmt.setString(12, vo.getCimg_bfile());
			
			int val = pstmt.executeUpdate();
			
			if(val != 0) {
				result=true;

			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public boolean getMenuListInsert(CoffeeVO vo) {
		boolean result = false;
		String sql = " insert into sb_coffee_img values('L_'||sequ_starbucks_id.nextval,?,?,?,?,?,?,?)";
		getPreparedStatement(sql);
		
		try {
			
			pstmt.setString(1, vo.getCid());
			pstmt.setString(2, vo.getCtype_id());
			pstmt.setString(3, vo.getCimg_file());
			pstmt.setString(4, vo.getDproduct_name());
			pstmt.setString(5, vo.getM_new());
			pstmt.setString(6, vo.getLimit());
			pstmt.setString(7, vo.getSoldout());
			
			int val = pstmt.executeUpdate();
			
			if(val != 0) {
				result=true;
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//관리자 커피 메뉴 리스트
	public ArrayList<CoffeeVO> getMenuList(){
		ArrayList<CoffeeVO> list = new ArrayList<CoffeeVO>();
		String sql ="select cimg_file , cid, ctype_id, cimg_text from sb_coffee_img";
		getPreparedStatement(sql);
		
		try {
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CoffeeVO vo = new CoffeeVO();
				vo.setCimg_file(rs.getString(1));
				vo.setCid(rs.getString(2));
				vo.setCtype_id(rs.getString(3));
				vo.setDproduct_name(rs.getString(4));
				
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


		//coffee 커피타입 - checkbox
		public ArrayList<CoffeeVO> getCheckList(String bean, String type){
			ArrayList<CoffeeVO> list = new ArrayList<CoffeeVO>();
			String sql = "select distinct i.ctype_id, l.clogo, l.cname from sb_coffee_img i, sb_coffee_list l where l.ctype_id=i.ctype_id and i.cid=? order by clogo";
			getPreparedStatement(sql);
			
			try {
				pstmt.setString(1, bean);
				pstmt.setString(1, type);
				
				rs = pstmt.executeQuery();
				while(rs.next()){
					CoffeeVO vo = new CoffeeVO();
					vo.setCtype_id(rs.getString(1));
					vo.setClogo(rs.getString(2));
					vo.setCname(rs.getString(3));
					
					list.add(vo);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			close();
			return list;
		}
//coffee 커피타입 
	public ArrayList<CoffeeVO> getList(String bean){
		ArrayList<CoffeeVO> list = new ArrayList<CoffeeVO>();
		String sql ="select distinct i.ctype_id, l.clogo, l.cname from sb_coffee_img i, sb_coffee_list l where l.ctype_id=i.ctype_id and i.cid=? order by clogo";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, bean);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				CoffeeVO vo = new CoffeeVO();
				vo.setCtype_id(rs.getString(1));
				vo.setClogo(rs.getString(2));
				vo.setCname(rs.getString(3));
				
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
}
		
		// coffee 커피타입별 이미지 & 이름
		public ArrayList<CoffeeVO> getImgList(String bean, String ctype){
			ArrayList<CoffeeVO> list = new ArrayList<CoffeeVO>();
			String sql = "select ctype_id, cimg_file, cimg_text, m_new, limit, soldout  from sb_coffee_img where cid=? and ctype_id=?";
			getPreparedStatement(sql);
			
			try {
				pstmt.setString(1, bean);
				pstmt.setString(2, ctype);
				
				rs = pstmt.executeQuery();
				while(rs.next()){
					CoffeeVO vo = new CoffeeVO();
					vo.setCtype_id(rs.getString(1));
					vo.setCimg_file(rs.getString(2));
					vo.setCimg_text(rs.getString(3));
					vo.setM_new(rs.getString(4));
					vo.setLimit(rs.getString(5));
					vo.setSoldout(rs.getString(6));
					
					list.add(vo);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		//coffee 커피타입 & 커피정보
		public CoffeeVO getDetailImg(String ctype, String cimg){
			CoffeeVO vo = new CoffeeVO();
			String sql = "select l.clogo, l.cname, l.ctext, cimg_file, dproduct_name ,dproduct_ename,  dproduct_text,"
					+ " dproduct_note,  dproduct_enjoy, dproduct_content, dproduct_story , dproduct_tasting, product_name, cimg_bfile "
					+ " from sb_coffee_detail d, sb_coffee_list l where l.ctype_id=? and cimg_file=?";
			getPreparedStatement(sql);
			
			try {
				pstmt.setString(1, ctype);
				pstmt.setString(2, cimg);
				
				rs = pstmt.executeQuery();
				while(rs.next()){
					vo.setClogo(rs.getString(1));
					vo.setCname(rs.getString(2));
					vo.setCtext(rs.getString(3));
					vo.setCimg_file(rs.getString(4));
					vo.setDproduct_name(rs.getString(5));
					vo.setDproduct_ename(rs.getString(6));
					vo.setDproduct_text(rs.getString(7));
					vo.setDproduct_note(rs.getString(8));
					vo.setDproduct_enjoy(rs.getString(9));
					vo.setDproduct_content(rs.getString(10));
					vo.setDproduct_story(rs.getString(11));
					vo.setDproduct_tasting(rs.getString(12));
					vo.setProduct_name(rs.getString(13));
					vo.setCimg_bfile(rs.getString(14));
					
		
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return vo;
		}
		//coffee 관련제품
		public CoffeeVO getProductlImg(String pname){
			CoffeeVO vo = new CoffeeVO();
			String sql = "select dproduct_text, ctype_id, cimg_file from SB_COFFEE_DETAIL where dproduct_name=? ";
			getPreparedStatement(sql);
			
			try {
				pstmt.setString(1, pname);
				
				rs = pstmt.executeQuery();
				while(rs.next()){
					vo.setDproduct_text(rs.getString(1));
					vo.setCtype_id(rs.getString(2));
					vo.setCimg_file(rs.getString(3));
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return vo;
		}
		
		
		
		
		
		//espresso 리스트
		public ArrayList<CoffeeVO> getEspressoList(){
			ArrayList<CoffeeVO> list = new ArrayList<CoffeeVO>();
			String sql = "select etype_id, ename, efile_main, eimg_main_text from sb_espresso_list" ;
			getPreparedStatement(sql);
			
			try {
				rs = pstmt.executeQuery();
				while(rs.next()){
					CoffeeVO vo = new CoffeeVO();
					vo.setEtype_id(rs.getString(1));
					vo.setEname(rs.getString(2));
					vo.setEfile_main(rs.getString(3));
					vo.setEimg_main_text(rs.getString(4));
	
					list.add(vo);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		
		//에스프레소 타입
		public CoffeeVO getEspressoDetail(String etype){
			CoffeeVO vo = new CoffeeVO();
			String sql = "select ename, ename_tit, efile_content, etitle, econtent from sb_espresso_list where etype_id=? ";
			getPreparedStatement(sql);
			
			try {
				pstmt.setString(1, etype);
				
				rs = pstmt.executeQuery();
				while(rs.next()){
					vo.setEname(rs.getString(1));
					vo.setEname_tit(rs.getString(2));
					vo.setEfile_content(rs.getString(3));
					vo.setEtitle(rs.getString(4));
					vo.setEcontent(rs.getString(5));
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return vo;
		}
		
		// 에스프레소 관련제품
		public ArrayList<menuVO> getEspressoProduct(String etype){
			ArrayList<menuVO> list = new ArrayList<menuVO>();
			String sql = "select intro_t , img , k_name, mid from sb_espresso_product, sb_menu  where k_name=eproduct_name and etype_id=? " ;
			getPreparedStatement(sql);
			
			try {
				pstmt.setString(1, etype);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					menuVO vo = new menuVO();
					vo.setIntro_t(rs.getString(1));
					vo.setImg(rs.getString(2));
					vo.setK_name(rs.getString(3));
					vo.setMid(rs.getString(4));
					
					list.add(vo);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		
}











