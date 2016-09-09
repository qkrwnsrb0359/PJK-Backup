<%@page import="dbconn.util.ConnectionUtil"%>
<%@page import="dbclose.util.CloseUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>JDBC</title>
</head>
<body>

	<table style="border: 1px solid; width: 400px;">
		<tr>
			<th>부서코드</th>
			<th>부서명</th>
			<th>지역코드</th>
			<th>지사명</th>
		</tr>
		<%
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;

			try {
				conn = ConnectionUtil.getConnection("oracle");
				stmt = conn.createStatement();
				String sql = "SELECT * FROM DEPT2";
				rs = stmt.executeQuery(sql);

				while (rs.next()) {
					//rs.getInt(1);
		%>
		<tr>
			<td><%=rs.getInt(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getInt(3)%></td>
			<td><%=rs.getString(4)%></td>
		</tr>

		<%
			} // while end
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				CloseUtil.close(rs);
				CloseUtil.close(stmt);
				CloseUtil.close(conn);
			} // try end
		%>
	</table>
</body>
</html>