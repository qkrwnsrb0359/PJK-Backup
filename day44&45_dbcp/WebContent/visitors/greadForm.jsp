<%@page import="dbclose.util.CloseUtil"%>
<%@page import="com.kosta.visitors.BookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"  %>
<%@ page import="com.kosta.visitors.BookDAO" %>    
<%@ page errorPage="error.jsp"%>

<%!
	int numPerPage = 10; // 한페이지에 보여줄 게시글 수
	int numPerBlock = 10; // 한페이지에 보일 페이지 번호의 개수 지정
	
	public void jspInit() {
		BookDAO.loadOracleDriver();
	}
%>
<!DOCTYPE html>
<html>
<head>
	<title>초간단 방명록 리스트</title>
<link href="../css/mystyle.css" rel=stylesheet type="text/css"/>
</head>
<body>
	<h3 id="header">방명록</h3>
	<div align="center"><a href="gwriteForm.jsp">방명록작성(쓰기)</a></div>
	<div align="center"><a href="gdeleteForm.jsp">방명록삭제</a></div>
	<div align="center"><a href="gupdateForm.jsp">방명록갱신</a></div>
	<div id="menu"><%@include file="menu.jsp" %></div>
	<div id="main">
		<%
		Connection conn = BookDAO.getConnection();
		String pstr = request.getParameter("page");
		int mypage = 1;
		try {
			mypage = Integer.parseInt(pstr);
			
		} catch(Exception e) {
			try { // page 번호 없을때 
				mypage = BookDAO.getPageCount(conn, numPerPage);
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		} 
		
		Vector data = BookDAO.getData(conn, mypage, numPerPage);
		
		int size = data.size();
		out.print("<table width='100%'>");
		
		for(int i = 0; i < size; i++) {
			BookVO info = (BookVO)data.elementAt(i);
			String name = info.getName();
			String email = info.getEmail();
			String home = info.getHome();
			String contents = info.getContents();
		%>
			<tr bgcolor="e7e7e7">
			<td>이 름 : <%=name %></td>
			</tr>
			<tr>
			<td>E-Mail : 
			<% if(email != null && email.length() > 0) { %>
				<a href="mailto:<%=email %>"><%=email %></a>
			<% } %>
			</td>
			</tr>
			<tr>
			<td>HomePage : 
			<% if(home != null && home.length() > 0) { %>
				<a href="<%=home %>"><%=home %></a>
			<% } %>
			</td>
			</tr>
			<tr>
				<td>내 용 : <p style="text-align:justify"><%=contents %></p></td>
			</tr>
		<%
		}
		%>
		</table>
		<div>
			<%
				//현재 페이지 번호가 소속된 블록 번호를 계산
				int currentBlock = (int)Math.ceil(mypage / (double) numPerBlock);
				//데이터베이스 테이블에 저장된 총 페이지 수 얻기
				double totalPage = BookDAO.getPageCount(conn, numPerPage);
				//총 블록 수 계산
				int totalBlock = (int)Math.ceil(totalPage / numPerBlock);
				
				if(totalBlock > currentBlock) {
					int togo = (currentBlock + 1) * numPerBlock;
					if(togo > totalPage) {
						togo = (int)totalPage;
					}
			%>
				<a href="greadForm.jsp?page=<%=togo%>"> ◀</a>
			<%
				}
				
				for(int i = 1; i <= numPerBlock; i++) {
					int pNum = numPerBlock * (currentBlock - 1) + i;
					
					if(pNum > totalPage) continue;
					
					if(pNum == mypage) {
			%>
				<a href="greadForm.jsp?page=<%=pNum %>">
					<span style="text-decoration: underline;"><%=pNum %></span>
				</a> &nbsp;&nbsp;&nbsp;
			<%
					} else { %>
				<a href="greadForm.jsp?page=<%=pNum%>"><%=pNum %></a>&nbsp;&nbsp;&nbsp;
			<%			
					}
				}
				if(currentBlock > 1) {
			%>
				<a href="greadForm.jsp?page=<%=(currentBlock) * numPerBlock %>">다음</a>
			<%
				}
				CloseUtil.close(conn);
			%>
		</div>
	</div>
</body>
</html>