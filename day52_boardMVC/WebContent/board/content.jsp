<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../view/color.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>
<head><title>게시판</title>
</head> 
<body bgcolor = "${bodyback_c }">
<center><b>상세보기 페이지</b><br>
<form>
<table width = "50%" border = "1" cellspacing = "2" cellpadding = "0" bgcolor = "${bodyback_c }" align="center">

<tr height="30">
	<td align="center" width = "125" bgcolor="${value_c }">글번호</td>
	<td align="center" width = "125">${num}</td> 
	
	<td align="center" width = "125" bgcolor="${value_c }">조회수</td>
	<td align="center" width = "125">${readcount }</td>
</tr>
<tr height="30">
	<td align="center" width = "125" bgcolor="${value_c}">작성자</td>
	<td align="center" width = "125">${writer }</td>
	
	<td align="center" width = "125" bgcolor="${value_c}">작성일</td>
	<td align="center" width = "125">${reg_date }</td>
</tr>
<tr height="30">
	<td align="center" width = "125" bgcolor="${value_c }">글제목</td>
	<td align="center" width = "125">${subject }</td>
	<td align="center" width = "125" colspan="2 "></td>
</tr>
<tr>
<td align="center" width = "500" colspan="4" style="word-wrap:break-word"><pre>${content }</pre></td>
</tr>
<tr height ="30">
	<td colspan="4" align="right" bgcolor="${value_c }">
	<input type="button" value = "글수정" onclick="document.location.href='updateForm.do?num=${num}&pageNum=${pageNum}'"> 
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value = "글삭제" onclick="document.location.href='deleteForm.do?num=${num}&pageNum=${pageNum}'">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	<input type = "button"  value = "답글작성" onclick="document.location.href='writeForm.do?num=${num}&ref=${ref}&re_step=${re_step}&re_level=${re_level}'">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type = "button" value = "목록 보기" onclick="document.location.href='list.do?pageNum=${pageNum}'"> 
	</td>
</tr>
</table>
</form>
</center>
</body>
</html>