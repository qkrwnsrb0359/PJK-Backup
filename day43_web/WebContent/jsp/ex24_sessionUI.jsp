<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
<title>Session Login</title>
</head>
<body>
	<form action="ex24_sessionOK.jsp" method="post">
		ID : <input type="text" name="uid"  id="uid" size="10" >
		PWD : <input type="password" name="pwd"  id="pwd" size="10"  maxlength="5"> <br><br>
		<input type="submit" value="로그인" >
	</form>
</body>
</html>