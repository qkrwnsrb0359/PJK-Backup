<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 		String user = "kingsmile";
 		String passwd = "1004";
 		String id = request.getParameter("uid");
 		String pwd = request.getParameter("pwd");
 		
 		boolean  loginState = false;
 		//db 연결 확인하고,....
 		//id == pwd 같다면 회원이라고 가정하고....
 		
 		//if(request.getParameter("uid").equals(request.getParameter("pwd"))  )
 		if( user.equals(id) && passwd.equals(pwd) ) {     //if( id.equals(pwd) ) {
 				session.setAttribute("uid", id);
 				loginState = true;
 		}
 %>
<!DOCTYPE html>
<html><head>
<title>Login Result</title>
</head>
<body>
	<% String userID = (String)session.getAttribute("uid"); %>
	<%= userID %>
	<hr>
	<%
			if( loginState == true) {
				out.print(id + "님 로그인한 상태");
			} else {
				out.print("로그인 되어 있지 않습니다.");
			}
	%>
</body>
</html>