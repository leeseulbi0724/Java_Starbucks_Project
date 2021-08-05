<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.starbucks.dao.*, com.starbucks.vo.*"
	import="com.google.gson.*"
%>
<%
	String sid = request.getParameter("sid");
	serviceDAO dao = new serviceDAO();
	
	serviceVO vo = dao.getContentResult(sid);	
	
	//자바의 list 객체의 데이터를 JSON 객체로 변환 후 전송
	//JSON 객체 형태로 변환해주는 라이브러리 --> GSON
	//최종 전송 데이터 타입 {[{"rno":1, "empno":7369, "ename":"SMITH"},{....}]};
	Gson gson = new Gson();	
	
	JsonObject jobj = new JsonObject();	
	jobj.addProperty("id", vo.getId());
	jobj.addProperty("category", vo.getCategory());
	jobj.addProperty("email", vo.getEmail());
	jobj.addProperty("hp", vo.getHp());
	jobj.addProperty("place", vo.getPlace());
	jobj.addProperty("title", vo.getTitle());
	jobj.addProperty("content", vo.getContent());
	jobj.addProperty("sdate", vo.getSdate());
	jobj.addProperty("efile", vo.getEfile());
	jobj.addProperty("sfile", vo.getSfile());
	
	out.write(gson.toJson(jobj));
	


%>