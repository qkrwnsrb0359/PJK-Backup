<%@page import="dbconn.util.ConnectionUtil"%>
<%@page import="dbclose.util.CloseUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.kosta.visitors.*" %>
<%@ page errorPage="error.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="vo" class="com.kosta.visitors.BookVO" />
<jsp:setProperty property="*" name="vo"/>

<!DOCTYPE html>
<html>
   <head>
      <title>업데이트</title>
   </head>
   <body>
      <%
         Connection conn = BookDAO.getConnection();
         int a = Integer.parseInt(request.getParameter("num"));
         String b = request.getParameter("name");
         String c = request.getParameter("email");
         String d = request.getParameter("home");
         String e = request.getParameter("contents");
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery("select * from guestbook");
         int count = 0;
         while(rs.next()){
            count+=1;
         }
      
         if(b == null || e == null){
            out.print("제대로 써요.");
            %>
            <a href="gupdateForm.jsp">뒤로</a>
            <%
         }else {
            String sql="update guestbook set name=?, email=?, home=?,   contents=? where num=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(5, a);
            pstmt.setString(1, b);
            pstmt.setString(2, c);
            pstmt.setString(3, d);
            pstmt.setString(4, e);
            pstmt.executeUpdate();
            CloseUtil.close(pstmt);
            %>
            <h3>수정완료</h3>
            <a href="gupdateForm.jsp">뒤로</a>
            <%
         }
         
      %>
   </body>
</html>