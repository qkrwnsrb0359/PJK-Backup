package edu.kosta.member;

import java.sql.*;
import java.util.ArrayList;
import javax.sql.DataSource;
import dbclose.util.CloseUtil;
import javax.naming.Context;
import javax.naming.InitialContext;

public class MemberDAO { 
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	public MemberDAO() {
		
	}
	
	public Connection getConnection() throws Exception {
		// 연결은 JNDI & Pool 형태로 연결 객체 생성 후 리턴
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc:MemberDB");
		return ds.getConnection();
	}
	
	//insert
	public void insert(MemberVO vo) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		StringBuffer sb = new StringBuffer();
		sb.append("insert into Members(id, passwd, name, jumin1, jumin2, email, blog, reg_date)");
		sb.append(" values(?, ?, ?, ?, ?, ?, ?, ?)");
		
		conn = getConnection();
		pstmt = conn.prepareStatement(sb.toString());
		
		pstmt.setString(1, vo.getId());
		pstmt.setString(2, vo.getPasswd());
		pstmt.setString(3, vo.getName());
		pstmt.setString(4, vo.getJumin1());
		pstmt.setString(5, vo.getJumin2());
		pstmt.setString(6, vo.getEmail());
		pstmt.setString(7, vo.getBlog());
		pstmt.setTimestamp(8, vo.getReg_date());
		
		int result = pstmt.executeUpdate();
		System.out.println("result = " + result);
		
		CloseUtil.close(pstmt);
		CloseUtil.close(conn);
	}
	
	public ArrayList<MemberVO> selectAll() throws Exception {
		String sql = "select id, name, jumin1, email, blog, reg_date from members order by name desc";
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery(sql);
		
		MemberVO vo = null;
		ArrayList<MemberVO> data = new ArrayList<MemberVO>();
		
		while(rs.next()) {
			vo = new MemberVO();
			vo.setId(rs.getString("id"));
			vo.setName(rs.getString("name"));
			vo.setJumin1(rs.getString("jumin1"));
			vo.setEmail(rs.getString("email"));
			vo.setBlog(rs.getString("blog"));
			vo.setReg_date(rs.getTimestamp("reg_date"));
			data.add(vo);
		}
		CloseUtil.close(conn);
		CloseUtil.close(pstmt);
		
		return data;
	}
	//userCheck(id, pwd) - 로그인시 사용할 메소드 id/password 체크함
	public int userCheck(String id, String pwd) throws Exception {
		String sql = "select passwd from Members where id = ?";
		String dbpwd = ""; 
		int result = -1;
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			dbpwd = rs.getString("passwd");
			if(dbpwd.equals(pwd)) result = 1; // 인증성공
			else result = 0; // 인증실패(비번틀림)
		} else {
			result = -1; // 인증실패(아디없음)
		}
		CloseUtil.close(rs);
		CloseUtil.close(pstmt);
		CloseUtil.close(conn);
		
		return result;
	}
	
	//confirmID(id) - 회원 가입시 id를 체크할 때 사용할 메소드
	public int confirmID(String id) throws Exception {
		String sql = "select id from Members where id=?";
		String dbpwd = "";
		int result = -1;
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) result = 1; // 중복아이디
		else result = -1;
		
		CloseUtil.close(rs);
		CloseUtil.close(pstmt);
		CloseUtil.close(conn);
		
		return result;
	}
	
	//getMember(id) - 업데이트시 입력된 데이터를 보여줄 때 사용할 함수
	public MemberVO getMember(String id) throws Exception {
		String sql = "select * from Members where id = ?";
		MemberVO vo = null;
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			vo = new MemberVO();
			vo.setId(rs.getString("id"));
			vo.setPasswd(rs.getString("passwd"));
			vo.setName(rs.getString("name"));
			vo.setJumin1(rs.getString("jumin1"));
			vo.setJumin2(rs.getString("jumin2"));
			vo.setEmail(rs.getString("email"));
			vo.setBlog(rs.getString("blog"));
			vo.setReg_date(rs.getTimestamp("reg_date"));
		}
		CloseUtil.close(rs);
		CloseUtil.close(pstmt);
		CloseUtil.close(conn);
		
		return vo;
	}
	public void modify(MemberVO vo) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update Members set passwd=?, name=?, email=?, blog=? where id=?";	
		conn = getConnection();
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, vo.getPasswd());
		pstmt.setString(2, vo.getName());
		pstmt.setString(3, vo.getEmail());
		pstmt.setString(4, vo.getBlog());
		pstmt.setString(5, vo.getId());
		
		pstmt.executeQuery();
		
		CloseUtil.close(pstmt);
		CloseUtil.close(conn);
	}
	public int delete(String id, String pwd) throws Exception {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      int reslut = -1;
	      String sql = "delete Members where id = ? and passwd = ?";      
	      conn = getConnection();
	      pstmt = conn.prepareStatement(sql);
	      pstmt.setString(1, id);
	      pstmt.setString(2, pwd);
	      int i = pstmt.executeUpdate();
	      if(i != 0) {
	    	  reslut = 1;
	      }
	      else { 
	    	  reslut = -1;
	      }
	      CloseUtil.close(pstmt);
	      CloseUtil.close(conn);
	      
	      return reslut;
	   }
}
