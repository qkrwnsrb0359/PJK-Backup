<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Main Infomation</title>
</head>
<body>
	<table style="width:700">
		<tr>
			<td colspan="2">
				<jsp:include page="/module/Top.jsp"/>
			</td>
		</tr>
		<tr>
			<td style="width:200px">
				<jsp:include page="/module/Left.jsp"/>
			</td>
			<td style="width:500px">
				Web Site Main Content
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<jsp:include page="/module/Bottom.jsp"></jsp:include>
			</td >
		</tr>
		
	</table>
</body>
</html>