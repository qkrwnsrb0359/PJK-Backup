package edu.kosta.boardAction;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.kosta.board.BoardDAO;
import edu.kosta.board.BoardVO;

public class UpdateProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String pageNum = request.getParameter("pageNum");
		BoardVO vo = new BoardVO();
		int num = Integer.parseInt(request.getParameter("num"));
		vo.setWriter(request.getParameter("writer"));
		vo.setEmail(request.getParameter("email"));
		vo.setSubject(request.getParameter("subject"));
		vo.setPasswd(request.getParameter("passwd"));
		vo.setContent(request.getParameter("content"));
		vo.setNum(num);
		BoardDAO dao = BoardDAO.getInstance();
		int check = dao.update(vo);
		request.setAttribute("check", check);
		return "/board/updatePro.jsp";
	}
}
