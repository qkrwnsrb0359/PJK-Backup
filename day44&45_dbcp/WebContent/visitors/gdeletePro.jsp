<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="dbclose.util.CloseUtil"%>
<%@ page import="com.kosta.visitors.*"%>

<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="vo" class="com.kosta.visitors.BookVO"/>
<jsp:setProperty property="*" name="vo"/>

<%! //선언문에만 함수정의 가능
	public void jspInit() {
		try {
			BookDAO.loadOracleDriver();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
	<title>초간단 방명록 삭제처리</title>
</head>
<body>
<%
	Connection conn = BookDAO.getConnection();
/* 	String sql = "delete from guestBook where num = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, vo.getNum());
	pstmt.executeUpdate();
	CloseUtil.close(pstmt); */
	BookDAO.delete(conn, vo);
%>
<h3>방명록 삭제 완료!</h3>
<br><br><a href="gwriteForm.jsp"><font color="red">방명록쓰기</font></a>
<br><br><a href="greadForm.jsp"><font color="red">방명록읽기</font></a>
</body>
</html>