<%@page import="dbclose.util.CloseUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.sql.*, javax.naming.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>DBCP 커넥션 풀 테스트</title>
</head>
<body>
<table border="1" width="50%">
	<%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc:MemberDB");
			Connection conn = ds.getConnection();
			
			// out.print("DBCP Connection success....");
			String name, email, contents;
			String sql = "select * from guestbook";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				name = rs.getString("name");
				email = rs.getString("email");
				contents = rs.getString("contents");
				
			%>
			<tr>
			<td><%=name %></td>
			<td><%=email %></td>
			<td><%=contents %></td>
			</tr>
			<%
			}
		} catch(Exception e) {
			
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
		}
	%>
	</table>
</body>
</html>