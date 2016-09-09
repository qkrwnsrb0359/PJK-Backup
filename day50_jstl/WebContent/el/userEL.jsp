<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="calc" uri="/WEB-INF/tlds/el_function.tld" %>
<!DOCTYPE html>
<html>
<head>
	<title>사용자 정의 태그 라이브러리</title>
</head>
<body>
<h3>표현언어에서 함수 사용하기 - 두 수의 합을 구하는 함수 호출</h3>
<p>
<form action="userEL.jsp" method="post">
	x : <input type="text" name="x" value="${param['x']}"><br>
	y : <input type="text" name="y" value="${param['y']}"><br>
	<input type="submit" value="더하기">
</form>
<hr>
<p>
합은 ? : ${calc:add(param["x"], param["y"]) }<br>
합은 ? : ${Calculator.add("3","9")}<br>
<hr>
<h3>표현언어에서 함수 사용하기 - 두 수의 곱을 구하는 함수 호출</h3>
<p>
<form action="userEL.jsp" method="post">
	x : <input type="text" name="x" value="${param['x']}"><br>
	y : <input type="text" name="y" value="${param['y']}"><br>
	z : <input type="text" name="z" value="${param['z']}"><br>
	<input type="submit" value="곱하기">
</form>
<hr>
<p>
합은 ? : ${calc:mul(param["x"], param["y"], param["z"]) }<br>
</body>
</html>