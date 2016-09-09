<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
<title>th125 JSP Template</title>
</head>
<body>
    <!-- window 7 cookie 위치
    	C:\Users\kosta\AppData\Roaming\Microsoft\Windows\Cookies 
    -->

<%
 		//request.setCharacterEncoding("utf-8");
		//Cookie  cookie = new Cookie("irum", "doyeon");
		Cookie  cookie = new Cookie("kostaName", URLEncoder.encode("강감찬", "utf-8"));
		// Client 브라우저에게 Cookie 전달
		response.addCookie(cookie);
%>
<hr>
	서버 도메인 이름 : <%= cookie.getDomain() %> <br>
	서버에서 설정 이름 : <%= cookie.getName() %> <br>
	서버에서 설정된 값 : <%= cookie.getValue() %> <br>
<hr>
<%
		//Client 쿠키 정보 읽어오기
		Cookie[] cs = request.getCookies();
		if ( cs != null || cs.length > 0 ) {
			
			for(int i =0; i < cs.length; i++ ) {
				out.print(cs[i].getName() + "<br>");
				out.print(cs[i].getValue() + "<br>");
				out.print(URLDecoder.decode(cs[i].getValue(), "utf-8")  + "<br>");
			} //for end
		} else {
			out.print("Client 저장된 쿠키 정보가 없습니다.");
		}
%>
</body>
</html>



