<%@page import="edu.kosta.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="vo" class="edu.kosta.board.BoardVO">
	<jsp:setProperty name="vo" property="*"/>
</jsp:useBean>

<%

	String pageNum = request.getParameter("pageNum");
	BoardDAO dao = BoardDAO.getInstance();
	
	int check = dao.delete(vo.getNum(),	vo.getPasswd()); // 실제 변경 내용 반영
	
	if(check != 0) {
%>
	<meta http-equiv="Refresh" content="0; url=list.jsp?pageNum=<%=pageNum %>">
<%		
	} else {
%>
	<script type="text/javascript">

	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);

	</script>
<%		
	}
%>
