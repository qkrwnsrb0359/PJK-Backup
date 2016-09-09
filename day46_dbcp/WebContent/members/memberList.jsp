<%@ page import="edu.kosta.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.* , java.util.*" %>
<%@ page import="edu.kosta.member.*" %>
<%@ include file="../view/color.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link href="../view/mystyle.css" rel="stylesheet" type="text/css">
	<title>회원 리스트</title>
</head>
<body>
<table border="1" cellspacing="0" cellpadding="0" width="40%">
	<tr align="center">
		<td bgcolor="<%=title_c%>">ID</td>
		<td bgcolor="<%=title_c%>">회원명</td>
		<td bgcolor="<%=title_c%>">생년월일</td>
		<td bgcolor="<%=title_c%>">이메일</td>
		<td bgcolor="<%=title_c%>">블로그</td>
		<td bgcolor="<%=title_c%>">가입일자</td>
	</tr>
	<%
		MemberDAO dao = MemberDAO.getInstance();
		ArrayList<MemberVO> data = dao.selectAll(); 
		MemberVO vo = null;
		
		for(int i = 0; i < data.size(); i++) {
			vo = data.get(i);
			String id = vo.getId();
			String name = vo.getName();
			String jumin1 = vo.getJumin1();
			String email = vo.getEmail();
			String blog = vo.getBlog();
			Timestamp reg_date = vo.getReg_date();
	%>
		<tr>
			<td><%=id %></td>
			<td><%=name %></td>
			<td><%=jumin1 %></td>
			<td><%=email %></td>
			<td><%=blog %></td>
			<td><%=reg_date %></td>
		</tr>
	<% } %>
		<tr>
			<td colspan="6">
			<input type="button" value="메인으로" onclick="window.location='main.jsp'">
			</td>
		</tr>
</table>

</body>
</html>