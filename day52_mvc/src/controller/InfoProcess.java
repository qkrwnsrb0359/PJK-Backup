package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/InfoProcess")
public class InfoProcess extends HttpServlet implements CommandProcess {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
			process(request, response);
			RequestDispatcher  dispatcher = request.getRequestDispatcher("/view/show.jsp");
			dispatcher.forward(request, response);	
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
				process(request, response);
				RequestDispatcher  dispatcher = request.getRequestDispatcher("/view/show.jsp");
				dispatcher.forward(request, response);	
			} catch (Throwable e) {
				e.printStackTrace();
			}
	}
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setAttribute("name", "박준규");
		request.setAttribute("num", "010-4026-9571");
		return "/view/processView.jsp";
	}
}
