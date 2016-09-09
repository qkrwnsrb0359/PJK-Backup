<%@page import="dbclose.util.CloseUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<%@ page import="com.kosta.visitors.BookDAO" %>    
<%@ page errorPage="error.jsp"%>

<% request.setCharacterEncoding("utf-8"); %>
<%-- <%
	BookVO vo = new BookVO();
%> --%>
<jsp:useBean id="vo" class="com.kosta.visitors.BookVO"/>
<jsp:setProperty property="*" name="vo"/>
<jsp:useBean id="sb" class="java.lang.StringBuffer"/>

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
	<title>초간단 방명록 글쓰기</title>
</head>
<body>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		conn = BookDAO.getConnection();
		sb.append("insert into guestBook(num, name, email, home, contents)");
		sb.append("values(book_num.nextval, ?, ?, ?, ?)");
		
		/* String sql = "insert into guestbook(num, name, email, home, contents) " +
					"values(book_num.nextval, ?, ?, ?, ?)"; */
		pstmt = conn.prepareStatement(sb.toString());
		pstmt.setString(1, vo.getName());
		pstmt.setString(2, vo.getEmail());
		pstmt.setString(3, vo.getHome());
		pstmt.setString(4, vo.getContents());
		pstmt.executeUpdate();
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		CloseUtil.close(conn);
		CloseUtil.close(pstmt);
	}
%>

<p>감사합니다 성공적으로 등록 되었습니다.
<p>방명록을 읽기 위해서는 <a href="greadForm.jsp">여기</a>를 클릭
<p>방명록을 쓰기 위해서는 <a href="gwriteForm.jsp">여기</a>를 클릭
</body>
</html>