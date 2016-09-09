package com.kosta.visitors;

import java.io.PrintWriter;
import java.sql.*;
import java.util.Vector;

import dbclose.util.CloseUtil;

public class BookDAO { // controller
	
	public static void loadOracleDriver() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			// DBMS 에러를 찾는데 도움
			DriverManager.setLogWriter(new PrintWriter(System.out));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection(String url, String user, String passwd) throws SQLException {
		return DriverManager.getConnection(url, user, passwd);		
	}

	public static Connection getConnection() throws SQLException {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "PJK";
		String passwd = "oracle";
		return DriverManager.getConnection(url, user, passwd);
	}
	
	//getPageCount(conn, numPerPage) 페이지 카운트
	public static int  getPageCount(Connection conn, int numPerPage) throws SQLException {
		String sql = "select count(num) from guestbook";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		int max = 0;
		
		while (rs.next()) {
			max = rs.getInt(1);
			break;
		}
		
		CloseUtil.close(stmt);
		int pageCount = (int)Math.ceil(max / (double)numPerPage); // 5 = (13 / 3.0) <=== 4.333...
		pageCount = Math.max(pageCount, 1); // 5, 1
		
		return pageCount;
	}
	
	//getDate() 전체 레코드 화면 출력 메소드
	public static Vector<BookVO> getData(Connection conn, int mypage, int numPerPage) throws SQLException {
		int start = (mypage - 1) * numPerPage;
		int end = mypage * numPerPage;
		
		String sql = "select name, email, home, contents from guestBook where num >"
					+ start + " and num <= " + end + " order by num desc";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		Vector<BookVO> data = new Vector<BookVO>();
		
		while(rs.next()) {
			BookVO vo = new BookVO();
			vo.setName(rs.getString("name"));
			vo.setEmail(rs.getString("email"));
			vo.setHome(rs.getString("home"));
			vo.setContents(rs.getString("contents"));
			data.add(vo);
		}
		CloseUtil.close(rs);
		CloseUtil.close(stmt);
		return data;
	}
	
	public static void delete(Connection conn, BookVO vo) throws SQLException {
		String sql = "delete from guestBook where num = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, vo.getNum());
		pstmt.executeUpdate();
		
		CloseUtil.close(pstmt);
	}
	
	public static void insert(Connection conn, BookVO vo) throws SQLException{
	      StringBuffer sb = new StringBuffer();
	      
	      PreparedStatement pstmt = null;
	      
	      try{
	         conn = BookDAO.getConnection();
	         sb.append("INSERT INTO GUESTBOOK(NUM, NAME, EMAIL, HOME, CONTENTS) ");
	         sb.append("VALUES(BOOK_NUM.NEXTVAL, ?, ?, ?, ?)");
	         
	         pstmt = conn.prepareStatement(sb.toString());
	         pstmt.setString(1, vo.getName());
	         pstmt.setString(2, vo.getEmail());
	         pstmt.setString(3, vo.getHome());
	         pstmt.setString(4, vo.getContents());
	         
	         pstmt.executeUpdate();
	      } catch(Exception e){
	         e.printStackTrace();
	      } finally{
	         CloseUtil.close(pstmt);
	         CloseUtil.close(conn);
	      }
	   }
}
