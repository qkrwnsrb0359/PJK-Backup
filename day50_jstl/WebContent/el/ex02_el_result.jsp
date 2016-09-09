<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <% session.setAttribute("test", "이것은 test에 들어가는 내용이다"); %>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
</head>
<body>
<%	request.setCharacterEncoding("utf-8"); %>
	<h3>이름 : ${param.name }</h3>
	<h3>이름 : ${param['name'] }</h3>
	<h3>검색어 : ${param.search }</h3>
	<h3>세션테스트 : ${sessionScope.test }</h3>
<%-- <%

	String search = request.getParameter("search");
	String name = request.getParameter("name");
%>
검색어:<%=search %><br>
이름:<%=name %> --%>
</body>
</html>