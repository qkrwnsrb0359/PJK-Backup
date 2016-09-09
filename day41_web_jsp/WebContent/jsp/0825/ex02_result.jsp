<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	public int add(int i, int j) {
		return i + j;
	}
	
	public int mul(int i, int j) {
		return i * j;
	}
%>
<!DOCTYPE html>
<html>
<head>
	<title>request 객체 다루기</title>
</head>
<body>
<!-- 	웹 브라우저가 웹 서버에 전송한 요청 관련 정보 제공
	주요 기능
	 - 클라이언트(웹 브라우저)와 관련된 정보 읽기 기능
	 - 서버와 관련된 정보 읽기 기능
	 - 클라이언트가 전송한 요청 파라미터 읽기 기능
	 - 클라이언트가 전송한 요청 해더 읽기 기능
	 - 클라이언트가 전송한 쿠키 읽기 기능
	 - 속성처리 기능 -->

<%
	request.setCharacterEncoding("utf-8");
%>
	<h3>Request 객체가 가지고 있는 함수</h3>
	클라이언트 IP 정보 가져오기 : <%= request.getRemoteAddr() %> <br>
	요청방식(인코딩) : <%= request.getCharacterEncoding() %> <br>
	전송방식 : <%= request.getMethod() %><br> 
	서버이름 : <%= request.getServerName() %><br>
	서버포트 : <%= request.getServerPort() %><br>
	컨텍스트 정보 : <%= request.getContextPath() %><br>
	전송된 데이터 : <%= request.getParameter("id") 
%>

 Hello World <br>
 <% int i = 100; %>
 i 변수 값 : <%= i %> 
 <hr>
 
 함수 호출 :
 <%
 		int result = add(10, 20);
 		int result2 = mul(30, 2);
 %>
 
 결과 : <%= result %><br>
 결과2 : <%= result2 %> <br>
 
 1 ~ 100 까지의 합을 출력하세요.
 <%
 		int sum =0;
  		for(int j=0; j <= 100; j++ ){
  			sum += j;
  		}
 %>
 sum = <%=  sum  %><br>
<hr>
<%
	for(int a = 2; a < 10; a++) {
		out.println("<br>[" + a + "단" + "]<br>");
		for(int b = 1; b < 10; b++) {
%>
<%=
	a + " * " + b + " = " + (a * b)
%><br>
<%
		}
	}
%>

</body>
</html>