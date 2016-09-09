<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="edu.kosta.member.*" %>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="vo" class="edu.kosta.member.MemberVO">
	<jsp:setProperty name="vo" property="*"/>
</jsp:useBean>

<%
	vo.setReg_date(new Timestamp(System.currentTimeMillis()));
	MemberDAO dao = MemberDAO.getInstance(); // 연결
	dao.insert(vo);
%>
<jsp:getProperty property="name" name="vo"/>님의 회원가입을 축하합니다. !!
<!DOCTYPE html>
<html>
<head>
	<title>회원가입 처리</title>
</head>
<body>
	<form action="memberList.jsp" method="post">
			<input type="submit" value="회원 목록">
	</form>
</body>
</html>