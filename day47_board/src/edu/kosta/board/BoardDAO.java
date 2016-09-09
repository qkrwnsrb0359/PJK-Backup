package edu.kosta.board;

import java.sql.*;
import java.util.*;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import dbclose.util.CloseUtil;

public class BoardDAO {	//Controller
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {
		return instance;
	}
	public BoardDAO() {	}  //

	public Connection getConnection() throws Exception {
		// JNDI & Pool 형태로 연결 객체 생성해서 리턴할것....
		InitialContext ctx = new InitialContext(); 
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc:BoardDB");
		return ds.getConnection();
	} // getConnection() end

	//insert(vo) - 새로운 글을 게시판 테이블에 추가, 글 입력 처리에 사용하는 함수
	public void insert(BoardVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		
		//답변인지 일반글인지 구분해서 입력시켜줌
		
		int num = vo.getNum(); //부모글번호
		int ref = vo.getRef(); //부모의 ref(그룹화번호)
		int re_step = vo.getRe_step(); //부모의 그룹내 순서
		int re_level = vo.getRe_level(); //부모의 re_level(들여쓰기 정도)
		int number = 0; //board 테이블에 들어갈 번호
		String sql = "";
		
		try {
			conn = getConnection();
			
			//현재 board 테이블에 레코드의 유무 판단과 글번호를 결정
			pstmt = conn.prepareStatement("select max(num) from board");
			rs = pstmt.executeQuery();
			
			//레코드 존재시
			if(rs.next()) {
				number = rs.getInt(1) + 1; // 다음 글 번호(지금 추가되는 번호)는 [가장 큰 번호 + 1]
			} else {
				number = 1; // 첫번째 글
			} // 제목글과 답변글간의 순서 결정
			if(num != 0) { // 답변글은 부모글의 글번호를 가진다.
				sql = "update board set re_step=re_step+1 where ref=? and re_step=?"; 
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.executeUpdate();
				
				re_step = re_step + 1;
				re_level = re_level + 1;
				
			} else { // 부모글인 경우 글번호X
				ref = number;
				re_step = 0;
				re_level = 0;
			}
			
			sb.append("insert into board(num, writer, subject, email, content, passwd, ");
			sb.append("reg_date, ref, re_step, re_level, ip) ");
			sb.append(" values(board_num.nextVal, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getSubject());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getContent());
			pstmt.setString(5, vo.getPasswd());
			pstmt.setTimestamp(6, vo.getReg_date());
			pstmt.setInt(7, ref);
			pstmt.setInt(8, re_step);
			pstmt.setInt(9, re_level);
			pstmt.setString(10, vo.getIp());
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);	
		}	
	}
	//list.jsp 사용할 레코드 갯수 얻어옴
	public int getListAllCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from board" ); // 갯수를 가져옴
			rs = pstmt.executeQuery();
			
			if(rs.next()) count = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		return count;
	}
	
	public List<BoardVO> getSelectAll(int startRow, int endRow) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		List list = null;//글 목록 저장 변수
		StringBuffer sb = new StringBuffer();
		try {
			conn = getConnection();
			sb.append("select num, writer, email, subject, passwd, reg_date, ref, re_step, re_level, ");
			sb.append(" content, ip, readcount, r from(select num, writer, email, subject, passwd, ");
			sb.append(" reg_date, ref, re_step, re_level, content, ip, readcount, rownum r ");
			sb.append(" from(select num, writer, email, subject, passwd, reg_date, ref, re_step, re_level, ");
			sb.append("content, ip, readcount from board order by ref desc, re_step asc) ");
			sb.append(" order by ref desc, re_level asc) where r>=? and r<=? ");
			
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			if(rs.next()) { // rs 레코드를 가짐
				list = new ArrayList(endRow);
				
				do {
					BoardVO vo = new BoardVO();
					vo.setNum(rs.getInt("num"));
					vo.setWriter(rs.getString("writer"));
					vo.setEmail(rs.getString("email"));
					vo.setSubject(rs.getString("subject"));
					vo.setPasswd(rs.getString("passwd"));
					vo.setReg_date(rs.getTimestamp("reg_date"));
					vo.setReadcount(rs.getInt("readcount"));
					vo.setRef(rs.getInt("ref"));
					vo.setRe_step(rs.getInt("re_step"));
					vo.setRe_level(rs.getInt("re_level"));
					vo.setContent(rs.getString("content"));
					vo.setIp(rs.getString("ip"));
					//list 객체에 저장
					list.add(vo);
				} while(rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}  finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		return list;
	}
	
	//getDataDetail(num) <===== select문, content.jsp 상세페이지에서 사용할 함수
	//num에 해당하는 레코드를 board 테이블에서 검색함
	public BoardVO getDataDetail(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		String sql = null;
		BoardVO  vo = null;
		try {
			sql = "update board set readcount = readcount + 1 where num=?";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("select * from board where num=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				vo = new BoardVO();
				vo.setNum(rs.getInt("num"));
				vo.setWriter(rs.getString("writer"));
				vo.setEmail(rs.getString("email"));
				vo.setSubject(rs.getString("subject"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setReg_date(rs.getTimestamp("reg_date"));
				vo.setReadcount(rs.getInt("readcount"));
				vo.setRef(rs.getInt("ref"));
				vo.setRe_step(rs.getInt("re_step"));
				vo.setRe_level(rs.getInt("re_level"));
				vo.setContent(rs.getString("content"));
				vo.setIp(rs.getString("ip"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		return vo;
	}
	public BoardVO update(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		BoardVO vo = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from board where num=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new BoardVO();
				vo.setNum(rs.getInt("num"));
				vo.setWriter(rs.getString("writer"));
				vo.setEmail(rs.getString("email"));
				vo.setSubject(rs.getString("subject"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setReg_date(rs.getTimestamp("reg_date"));
				vo.setReadcount(rs.getInt("readcount"));
				vo.setRef(rs.getInt("ref"));
				vo.setRe_step(rs.getInt("re_step"));
				vo.setRe_level(rs.getInt("re_level"));
				vo.setContent(rs.getString("content"));
				vo.setIp(rs.getString("ip"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		return vo;
	}
	
	//글 수정 처리에서 사용할 함수, updatePro에서 사용
	public int update(BoardVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String dbpasswd = "";
		StringBuffer sb = new StringBuffer();
		int result = -1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select passwd from board where num=?");
			pstmt.setInt(1, vo.getNum());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbpasswd = rs.getString("passwd");
				if(dbpasswd.equals(vo.getPasswd())) {
					sb.append("update board set writer=?, email=?, subject=?, passwd=?, ");
					sb.append("content=? where num=?");
					pstmt = conn.prepareStatement(sb.toString());
					
					pstmt.setString(1, vo.getWriter());
					pstmt.setString(2, vo.getEmail());
					pstmt.setString(3, vo.getSubject());
					pstmt.setString(4, vo.getPasswd());
					pstmt.setString(5, vo.getContent());
					pstmt.setInt(6, vo.getNum());
					
					pstmt.executeUpdate();
					
					result = 1;
				} else {
					result = 0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		return result;
	}
	
	public int delete(int num, String passwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = -1;
		try {
			if (true) {
			conn = getConnection();
			pstmt = conn.prepareStatement("delete from board where num=? and passwd=?");
			pstmt.setInt(1, num);	
			pstmt.setString(2, passwd);	
			result = pstmt.executeUpdate();
			} else {
				result = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		return result;
	}
}
