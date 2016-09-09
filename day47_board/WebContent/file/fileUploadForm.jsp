<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>파일 업로드 예제</title>
</head>
<body>
	<form action="fileUploadPro.jsp" name="fileForm" method="post" enctype="multipart/form-data">
		작성자 : <input type="text" name="user"><br>
		제  목 : <input type="text" name="title"><br> 
		파일명 : <input type="file" name="upload"><br><br>
		<input type="submit" value="파일첨부">
	</form>
</body>
</html>