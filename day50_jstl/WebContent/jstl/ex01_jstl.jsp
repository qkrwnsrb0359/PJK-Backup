<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>JSTL core 라이브러리 사용 예제</title>
</head>
<body>
<c:set var="test" value="Hello JSTL!"/>
<h3>&lt;c:set&gt;사용 : <c:out value="${test }"/></h3><br>
<c:set var="num">1000</c:set>
<h3>&lt;c:set&gt;사용 : <c:out value="${num }"/></h3>
<hr>
<c:catch var="error">
<%= 10/0 %>
</c:catch>
<h3>&lt;c:catch&gt;로 잡아낸 오류 : <c:out value="${error }"/></h3>
<hr>
<%
	String str = "hello jstl~~~~~";
	out.print(str + "<br>");
%>
표현식을 이용한 출력 : <%=str %><br>
jstl 이용하면
<c:set var="str" value="hello jstl~~~"/>
str = <c:out value="${str}"/>
<hr>
<%
	String name = "happy";
	pageContext.setAttribute("id", "PJK");
	session.setAttribute("pwd", "oracle");
	application.setAttribute("team", "우리팀");
	request.setAttribute("age", 27);
%>

<c:set var="irum" value="<%=name %>"/> <!-- var irum = "happy"; -->
<%= name %><br>
<c:out value="${irum }"/><br>
name = ${name }<br>
name = <c:out value="${irum }" default="무명"/>
name = ${irum }<br>
<hr>

id = ${id }<br>
pwd = ${pwd }<br>
team = ${team }<br>
age = ${age }<br>
<hr>

<c:out value="ID=${id }"/><br>
<c:out value="pwd=${pwd }"/><br>
<c:out value="team=${team }"/><br>
<c:out value="age=${age }"/><br>
<hr>

<c:if test="${5 < 10 }">
	<h3>5 &lt; 10은 참</h3>
</c:if>
<c:if test="${5 > 10 }"> <!-- c:if 조건은 else가 없다 -->
	<h3>5 &gt; 10은 거짓</h3>
</c:if>
<c:if test="${(6+3) == 9 }">
	<h3>6+3 == 9는 참</h3>
</c:if>
<c:if test="${(6+3) != 9 }"> <!-- c:if 조건은 else가 없다 -->
	<h3>6+3 != 9는 거짓</h3>
</c:if>
<hr>
	<c:choose>
		<c:when test="${5+10 == 50 }">
			<h3>case1(5+10 == 50)</h3>
		</c:when>
		<c:when test="${50+10 == 60 }">
			<h3>case2(50+10 == 50)</h3>
		</c:when>
		<c:otherwise>
			<h3>default</h3>
		</c:otherwise>
	</c:choose>
</body>
</html>