package edu.kosta.boardAction;

import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import edu.kosta.board.BoardDAO;

public class ListAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int pageSize = 7;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum == null) pageNum = "1";
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage * pageSize) -6; //시작값
		int endRow = currentPage * pageSize; //끝값
		int count = 0;
		int number = 0;
		
		List list = null;
		
		BoardDAO dao = BoardDAO.getInstance(); //db 연결
		count = dao.getListAllCount(); //전체페이지 
		
		if(count > 0) {
			list = dao.getSelectAll(startRow, endRow); 
		} else {
			list = Collections.EMPTY_LIST;
		}
		number = count - (currentPage - 1) * pageSize;

		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("count", new Integer(count));
		request.setAttribute("number", new Integer(number));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("list", list);
		System.out.println("number"+number);
		return "/board/list.jsp";
	}

}
