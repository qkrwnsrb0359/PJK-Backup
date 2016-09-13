package my.bb2Action;

import java.io.*;
import com.oreilly.servlet.multipart.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.*;

import my.bbs2.*;

public class Write_OkAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		BbsManager mgr = BbsManager.getInstance();
		MultipartRequest mr = null;
		
		try{
			//web2/bbs2/Upload/안에 업로드
			String upDir = request.getSession().getServletContext().getRealPath("/bbs2/Upload");
			// ServletContext타입의 내장객체 : application
			File up = new File(upDir);
			
			if(up != null){
				up.mkdir();
			}
			mr = new MultipartRequest(request,upDir,10*1024*1024,"utf-8",new DefaultFileRenamePolicy());
			
		} catch(IOException e){
			System.out.println("파일 업로드 실패");
			e.getStackTrace();
		}
			int result = mgr.writeOk(mr);
			request.setAttribute("result", result);
			request.setAttribute("mr", mr);
		return "/bbs2/Bbs_writeOk.jsp";
	}
}
