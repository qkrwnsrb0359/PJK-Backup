<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<html>
<head><title>삭제 페이지</title></head>
<link href="../css/mystyle.css" rel="stylesheet" type="text/css">
<body>
	<div id="header">
		<%@include file="header.jsp" %>
	</div>
	<div id="menu">
		<%@include file="menu.jsp" %>
	</div>
	<div id="main">
		<form method="post" action="gdeletePro.jsp">
			<table>
				<tr>
					<td>
						지울 방명록 번호
					</td>
					<td>
						<input type="text" name="num">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="삭제">&nbsp;&nbsp;&nbsp;
						<input type="reset" value="취소">
						<br><br><a href="gwriteForm.jsp"><font color="red">방명록쓰기</font></a>
						<br><br><a href="greadForm.jsp"><font color="red">방명록읽기</font></a>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>