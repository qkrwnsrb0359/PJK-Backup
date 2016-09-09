<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
<title>th125 JSP Template</title>
</head>
<body>
	<%
			Cookie newCookie = new Cookie("name", "kingsmile"); 
			newCookie.setMaxAge(0);  //사용 기간을 0으로 만들면 <--- 소멸
			//newCookie.setMaxAge(60);  // 60초 -----> 1분,   30일(30*24*60*60);  일*시*분*초
			response.addCookie(newCookie);
	%>
	<hr>
	<%
			Cookie[]  cookies = request.getCookies();
			if( cookies != null ||  cookies.length > 0 ) {
				for(int i =0; i< cookies.length ;  i++ ){
					if( cookies[i].getName().equals("name")) {
						// 재설정
						Cookie x = new Cookie("name", "5555");
						response.addCookie(x);
					} // in if end
					
					out.print(cookies[i].getName() + "<br>");
					out.print(cookies[i].getValue() + "<br>");
				} // for end
			} else {
				out.print("쿠키 정보 없네요~");
			}
	%>
</body>
</html>





