<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="javax.sql.DataSource ,  javax.naming.*,   java.sql.*"   %>
<!DOCTYPE html>
<html><head>
<title>DBCP 커넥션 풀 예제</title>
</head>
<body>
<table  border="1">
	<%
			PreparedStatement  pstmt = null;
			ResultSet  rs = null;
			
			try{
				Context initCtx = new InitialContext();
				/* Context envCtx = (Context) initCtx.lookup("java:comp/env");
				DataSource ds = (DataSource) envCtx.lookup("jdbc:dbcpTestDB"); */
				
				DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc:dbcpTestDB");				
				Connection conn = ds.getConnection();
				//out.println("DBCP Connection success!!! <br><br>");
				
				String sql = "SELECT * FROM GIFT ";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					int gno = rs.getInt("gno");
					String gname = rs.getString("gname");
					int start = rs.getInt("g_start");
					int end = rs.getInt("g_end");
					
%>
	<tr>
			<td width="100"><%= gno %></td>
			<td width="100"><%= gname %></td>
			<td width="100"><%= start %></td>
			<td width="100"><%= end %></td>
	</tr>
<%
				} // while end
			}catch(Exception e) {
				e.printStackTrace();
			}
	%>
</table>
</body>
</html>