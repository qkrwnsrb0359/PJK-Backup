package edu.kosta.boardAction;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.kosta.board.BoardDAO;
import edu.kosta.board.BoardVO;

public class ContentAction implements CommandAction{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try {
			BoardDAO dao = BoardDAO.getInstance();
			BoardVO vo = dao.getDataDetail(num); 
			
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
			request.setAttribute("reg_date", sdf.format(vo.getReg_date()));
		} catch(Exception e) {  
			e.printStackTrace();  
		} 
		
		return "/board/content.jsp";
	}

}
