<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>EL 사용법</title>
</head>
<body>
	<form action="ex02_el_result.jsp" method="post">
		<table border="1">
			<tr>
				<td>검색 : </td>
				<td><input type="search" placeholder="검색어 입력" name="search"></td>			
			</tr>
			<tr>
				<td>이름 : </td>
				<td><input type="text" placeholder="이름 입력" name="name"></td>			
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="전송"></td>			
			</tr>
		</table>
	</form>	
</body>
</html>