<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>결과받고 처리 더</title>
</head>
<body>

	<%
	/*       1. 한글처리
	         method="post"
	         request.setCharacterEncoding("utf-8");
	      
	         2. 한글처리
	         method="get"
	         get 방식 : URL  http://localhost:7070/day41_web/jsp/login.html?userId=kingsmile&pwd=1004&hobby=
	         request.setCharacterEncoding("euc-kr");  or utf-8
	         
	         get 방식은 설정(Tomcat)을 통해서도 한글처리 가능함
	         URIEncoding="UTF-8"  
	         
	                <Connector connectionTimeout="20000"  
	                URIEncoding="UTF-8"  reloadable="true"  privileged="true" 
	                port="7070" protocol="HTTP/1.1" redirectPort="8443"/> */
	%>

	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		String[] hobbys = request.getParameterValues("hobby");
		//checkbox 사용시 동일한 name 사용
	%>

	당신의 아이디 : <%= id %> <br>
	당신의 비밀번호 : <%= pwd %><br>
	
	<%
		if(hobbys != null) {
			for(int i = 0; i < hobbys.length; i++) {
	%>
	<%=hobbys[i] %>
	<%		
			}
		}
	%>
	
	<hr border="5">
	
	스크립트릿 부분에는 자바코드 사용 : 
	<%
		int x = 100;
	    String mun = "잉이잉";
	%>
	<font color="red"><%=x + mun%></font>
	
	<br>
		 
	선언문 부분에는 자바코드 사용 & 함수 사용 : 
	<%!
		int i = 200;
		public void show() {
			System.out.print(i);
		}
	%>
	<%show(); %>
	<br>
	<%=100+200+300 %>
</body>
</html>