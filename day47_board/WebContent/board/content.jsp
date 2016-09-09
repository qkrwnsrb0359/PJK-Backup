<%@page import="edu.kosta.board.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../view/color.jsp" %>
<!DOCTYPE>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import = "java.text.SimpleDateFormat"%>
<!-- <%@ include file = "/view/style.css"%> -->

<html>
<head><title>게시판</title>
<link href="../view/style.css" rel = "stylesheet" type = "text/css">
</head> 
<%
request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
try {
	BoardDAO dao = BoardDAO.getInstance();
	BoardVO vo = dao.getDataDetail(num); 
	
	int ref = vo.getRef();
	int re_step = vo.getRe_step();
	int re_level = vo.getRe_level();
	
	System.out.print("content.jsp : ref : " + ref + "re_step : " + re_step + "re_level : " + re_level);
%>
<body bgcolor = "<%= bodyback_c %>">
<center><b>상세보기 페이지</b><br>
<form>
<table width = "50%" border = "1" cellspacing = "2" cellpadding = "0" 
bgcolor = "<%= bodyback_c %>" align="center">

<tr height="30">
	<td align="center" width = "125" bgcolor="<%=value_c%>">글번호</td>
	<td align="center" width = "125"><%=vo.getNum() %></td> 
	
	<td align="center" width = "125" bgcolor="<%=value_c%>">조회수</td>
	<td align="center" width = "125"><%=vo.getReadcount() %></td>
</tr>
<tr height="30">
	<td align="center" width = "125" bgcolor="<%=value_c%>">작성자</td>
	<td align="center" width = "125"><%=vo.getWriter() %></td>
	
	<td align="center" width = "125" bgcolor="<%=value_c%>">작성일</td>
	<td align="center" width = "125"><%=sdf.format(vo.getReg_date()) %></td>
</tr>
<tr height="30">
	<td align="center" width = "125" bgcolor="<%=value_c%>">글제목</td>
	<td align="center" width = "125"><%=vo.getSubject() %></td>
	<td align="center" width = "125" colspan="2 "></td>
</tr>
<tr>
<td align="center" width = "500" colspan="4" style="word-wrap:break-word"><pre><%=vo.getContent() %></pre></td>
</tr>
<tr height ="30">
	<td colspan="4" align="right" bgcolor="<%=value_c%>">
	<input type="button" value = "글수정" onclick="document.location.href='updateForm.jsp?num=<%=vo.getNum()%>&pageNum=<%=pageNum%>'"> 
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type = "button" value = "글삭제" onclick="document.location.href='deleteForm.jsp?num=	<%=vo.getNum()%>&pageNum=<%=pageNum%>'">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	
	<% if((ref == ref)&&(ref != num)){ %>
	<input type = "button"  value = "답글작성" onclick="document.location.href='writeForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'">
	<%}else{ %>
	 <input type = "button"  value = "답글작성" onclick="document.location.href='writeForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'">
	<%} %>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type = "button" value = "목록 보기" onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'"> 
	</td>
</tr>
</table>
<%	} catch(Exception e){  e.printStackTrace();  } %>
</form>
</center>
</body>
</html>