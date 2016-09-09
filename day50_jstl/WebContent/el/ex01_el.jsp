<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>EL 연산자 사용 예제</title>
</head>
<body>
	<h3>\${5 + 7} = ${5 + 7}</h3>
	<h3>\${5 - 7} = ${5 - 7}</h3>
	<h3>\${5 * 7} = ${5 * 7}</h3>
	<h3>\${5 / 7} = ${5 / 7}</h3>
	<h3>\${5 div 7} = ${5 div 7}</h3>
	<h3>\${5 % 7} = ${5 % 7}</h3>
	<h3>\${5 mod 7} = ${5 mod 7}</h3>
	<h3>\${5 != 7} = ${5 != 7}</h3>
	<h3>\${5 > 7} = ${5 > 7}</h3>
	<h3>\${5 <= 7} = ${5 <= 7}</h3>
	<h3>\${5 >= 7} = ${5 >= 7}</h3>
	<h3>\${5 + 7 == 12 ? "참" : "거짓"} = ${5 + 7 == 12 ? "참" : "거짓"}</h3>
	<h3>\${5 + 8 == 12 ? "참" : "거짓"} = ${5 + 8 == 12 ? "참" : "거짓"}</h3>
	
	<table border="1" width="100%">
		<tr>
			<td>\${header["host"] }</td>
			<td>${header["host"] }</td>
		</tr>
		<tr>
			<td>\${header['user-agent'] }</td>
			<td>${header['user-agent'] }</td>
		</tr>
	</table>
</body>
</html>