<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="edu.kosta.board.*" %>
<%@ page import="java.sql.Timestamp" %>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="vo" class="edu.kosta.board.BoardVO">
	<jsp:setProperty name="vo" property="*"/>
</jsp:useBean>

<%
	vo.setReg_date(new Timestamp(System.currentTimeMillis()));
	vo.setIp(request.getRemoteAddr());
	BoardDAO dao = BoardDAO.getInstance();
	dao.insert(vo);
	/* response.sendRedirect("list.jsp"); */
%>
<script type="text/javascript">
	window.location.replace("list.jsp")
</script>
<h1>글 작성 완료!!</h1>
