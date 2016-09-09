<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="edu.kosta.member.*" %>
<%@ include file="../view/color.jsp"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="vo" class="edu.kosta.member.MemberVO">
	<jsp:setProperty name="vo" property="*"/>
</jsp:useBean>

<%
	String id = (String)session.getAttribute("memID");
	vo.setId(id);
	MemberDAO dao = MemberDAO.getInstance(); // 연결
	dao.modify(vo);
%>

<!DOCTYPE html>
<html>
<head>
<link herf="../view/mystyle.css" rel="stylesheet" type="text/css" >
	<title>정보수정처리</title>
</head>
<body>
수정완료 <br>
<a href="main.jsp">메인가기</a>
</body>
</html>