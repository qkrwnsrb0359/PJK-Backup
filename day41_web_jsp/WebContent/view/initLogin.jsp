<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/login.js" type="text/javascript">
</script>
<title>Login Servlet Test</title>	
</head>
<body>
<center>
	<font size="4" color="blue"><b>Login JSP</b></font>
	<hr>
	<table border="0">
		<form action="../view/InitLoginServlet" name="form" method="get">
			<tr>
				<td>User ID:</td>
				<td><input type="text" name="id" id="id"></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="pw" id="pw"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="button" value="로그인" onclick="sendData();">
				<input type="reset" value="취소"">
				</td>
			</tr>
		</form>
	</table>
</center>
</body>
</html>