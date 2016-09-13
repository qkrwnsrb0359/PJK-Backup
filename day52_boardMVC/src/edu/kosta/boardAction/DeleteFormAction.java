package edu.kosta.boardAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.kosta.board.BoardVO;

public class DeleteFormAction implements CommandAction{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("num", Integer.parseInt(request.getParameter("num")));
		request.setAttribute("pageNum", request.getParameter("pageNum"));
		return "/board/deleteForm.jsp";
	}
	
}
