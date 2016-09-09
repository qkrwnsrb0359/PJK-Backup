<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../view/color.jsp" %>
<%@ page import="edu.kosta.member.*"%> 
<!DOCTYPE html>
<html>
<head>
<link href="../view/mystyle.css" rel="stylesheet" type="text/css">
	<title>탈퇴</title>
</head>
<%
	String id = (String)session.getAttribute("memID");
	String pwd = request.getParameter("passwd");
	
	MemberDAO dao = MemberDAO.getInstance();
	int check = dao.delete(id, pwd);
	
	if(check == 1) {
		session.invalidate();
%>
<body bgcolor="<%=bodyback_c%>"> 
<form action="main.jsp" method="post" name="userinput">
	<table width="270" border="0" align="center" cellpadding="5">
		<tr bgcolor="<%=title_c%>">
		<td height="39" align="center">
			<font size="+1"><b>회원탈퇴완료!</b></font>
		</td>
		</tr>
		<tr bgcolor="<%=value_c%>">
		<td align="center">
			<p> ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ
			<meta http-equiv="Refresh" contents="5; url=main.jsp">
		</td>
		</tr>
		<tr bgcolor="<%=value_c%>">
		<td>
			<input type="submit" value="확인">
		</td>
		</tr>
	</table>
</form>
<%		
	} else {
%>
	<script type="text/javascript">
		alert("비밀번호 틀림");
		history.go(-1);
	</script>
<%
	}
%>
</body>
</html>