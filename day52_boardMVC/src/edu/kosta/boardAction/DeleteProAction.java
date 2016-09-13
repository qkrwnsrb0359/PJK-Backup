package edu.kosta.boardAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.kosta.board.BoardDAO;
import edu.kosta.board.BoardVO;

public class DeleteProAction implements CommandAction{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String pageNum = request.getParameter("pageNum");
		BoardDAO dao = BoardDAO.getInstance();
		
		int check = dao.delete(Integer.parseInt(request.getParameter("num")), request.getParameter("passwd")); // 실제 변경 내용 반영	
		request.setAttribute("check", check);
		return "/board/deletePro.jsp";
	}

}
