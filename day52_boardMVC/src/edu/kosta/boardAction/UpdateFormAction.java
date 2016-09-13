package edu.kosta.boardAction;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.kosta.board.BoardDAO;
import edu.kosta.board.BoardVO;

public class UpdateFormAction implements CommandAction{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int num = 0, ref = 1, re_step = 0, re_level = 0;
		num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");

		try {
			BoardDAO dao = BoardDAO.getInstance();
			BoardVO vo = dao.update(num);
			request.setAttribute("num", vo.getNum());
			request.setAttribute("writer", vo.getWriter());
			request.setAttribute("email", vo.getEmail());
			request.setAttribute("subject", vo.getSubject());
			request.setAttribute("passwd", vo.getPasswd());
			request.setAttribute("readcount", vo.getReadcount());
			request.setAttribute("ref", vo.getRef());
			request.setAttribute("re_step", vo.getRe_step());
			request.setAttribute("re_level", vo.getRe_level());
			request.setAttribute("content", vo.getContent());
			request.setAttribute("ip", vo.getIp());
			request.setAttribute("pageNum", pageNum);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "/board/updateForm.jsp";
	}

}
