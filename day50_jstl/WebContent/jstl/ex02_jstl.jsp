<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%-- <c:import url="java.util.*"/> --%>
<!DOCTYPE html>
<html>
<head>
	<title>JSTL core 라이브러리 사용 예제</title>
</head>
<body>
<%
	String[] sports ={"축구", "야구", "농구", "골프", "수영", "볼링", "배구", "핸드볼", "배드민턴"};
	HashMap map = new HashMap();
	map.put("name", "PJK");
	map.put("age", "27");
	map.put("tel", "123-4567-8901");
	map.put("date", new java.util.Date());
%>
<h1>스포츠 배열 2번째 값부터 3개만 출력</h1>
<c:set var="sportsArray" value="<%=sports %>"/>
<c:forEach var="i" items="${sportsArray }" begin="1" end="3" step="1" varStatus="status">
	i 값 : ${i} <br>
	루프 실행 현재 인덱스 값 : ${status.index }<br>
	루프 실행 횟수 : ${status.count }<br>
	begin 값 : ${status.begin }<br>
	end 값 : ${status.end }<br>
	step 값 : ${status.step }<br><br>
</c:forEach>
<hr>
<h1>Map</h1>
<c:set var="memberMap" value="<%=map %>"/>
<c:forEach var="i" items="${memberMap }">
	${i.key } : ${i.value }<br>
</c:forEach>
<hr>
<h2>스크립트릿과 JSTL 비교</h2>
<p>1번 jstl</p>
<c:forEach var="i" begin="1" end="10" step="2">
	<b>${i}</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</c:forEach>
<p> 1번 스크립트릿 </p>
<%
	for(int j = 1; j < 10; j++) {
		if(j % 2 != 0) {
%>
<b><%=j %></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%
		}
	}
%>
<p>2번 스크립트릿</p>
<%
	String a = "a, b, c, d, e, f, g, h, i, j, k";
	String[] alphabet = a.split(",");
	for(int i = 0; i< alphabet.length; i++) {
%>
	<b><%=alphabet[i] %></b> &nbsp;&nbsp;&nbsp;&nbsp;
<%
	}

%>
<p> 3번 jstl</p>
<c:set var="data" value="111, 222, 333, 444, 555"/>
<c:forTokens var="varData" items="${data }" delims=",">
	<b>${varData }</b><br>
</c:forTokens>

<p>3번 스크립트릿</p>
<%
	String data = "111, 222, 333, 444, 555";
	String varData[] = data.split(",");
	for(int i = 0; i < varData.length; i++) {
%>
	<b><%= varData[i] %></b>
<%
	}
%>
<hr>
<h2> 1 ~ 100까지 합</h2>
<c:set var="sum" value="0"/>
<c:forEach var="i" begin="1" end="100">
	<c:set var="sum" value="${sum + i}"/>
</c:forEach>
<font color="red">1~100합계 : ${sum }</font><br>
<hr><br>
<h2>구구단</h2><br>
<c:forEach var="i" begin="2" end="9"> 
	<font color="red"><h3>${i}단</h3></font>
	<c:forEach var="j" begin="1" end="9">
	<tr>
		<td>
		<c:set var="result" value="${i*j }"/> 
		${i} * ${j} = ${result}<br>
		</td>
	</c:forEach>
</c:forEach>
<hr>

</body>
</html>