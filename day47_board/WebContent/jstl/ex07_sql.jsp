<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
	<title>sql 태그 예제 - update, param</title>
</head>
<body>
	<h3>sql 태그 예제 - update, param</h3>
	<sql:update dataSource="jdbc:BoardDB">
		update board set writer=? where num=?
		<sql:param value="${'PJK' }"/>
		<sql:param value="${23 }"/>
	</sql:update>
		
	<sql:query var="rs" dataSource="jdbc:BoardDB">select * from board</sql:query>
	<table>
		<tr> <!-- 필드명 출력 -->
			<c:forEach var="columnName" items="${rs.columnNames }">
				<th><c:out value="${calumnName }"/></th>
			</c:forEach>
		</tr>
		<c:forEach var="row" items="${rs.rowsByIndex }"> <!-- 레코드 수 만큼 반복 -->
		<tr>
			<c:forEach var="column" items="${row }" varStatus="i" > <!-- 필드 수 만큼 반복 -->
				<td>
					<c:if test="${column != null}"> <!-- 해당 필드값이 null이 아니면 -->
						<c:out value="${column }"/>
					</c:if>
					<c:if test="${column == null}"> <!-- 해당 필드값이 null이면 -->
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</c:if>
				</td>
			</c:forEach>
		</tr>
		</c:forEach> 
	</table>
</body>
</html>