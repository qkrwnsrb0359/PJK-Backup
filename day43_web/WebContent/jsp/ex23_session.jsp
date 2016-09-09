<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
<title>th125 JSP Template</title>
</head>
<body>
   <%
   			/* application.setAttribute("count", 0);
   			count(전역변수 : 서버에 접속한 브라우저(client)가 공유하는 자원)
   			
   			session.setAttribute("ID", "kingsmile");
   			ID는 sessionID에 고유하게 부여하는 변수
   			웹 서버에 접속한 사용자의 고유한 정보 : loginID, shopping cart 데이터,.... */
   %>
   <h3>세션 정보</h3>
   서버가 부여한 고유한 ID : <%= session.getId() %>
   <%
   			session.setAttribute("ID", "happydoyeon");
   			session.setAttribute("Login", "Fail");
   %>
   <h3>세션 변수값 읽어오기</h3>
   <%
   			String id = (String)session.getAttribute("ID");
   			String login = (String)session.getAttribute("Login");
   %>
   <hr>
   ID : <%= id %><br>
   Login : <%= login %><br>
   <hr>
   
   <% 
   			// sessionID 삭제하기
   			session.invalidate(); 
   	%>
</body>
</html>




