package com.kosta.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MessageProcess")
public class MessageProcess extends HttpServlet implements CommandProcess {

	/*@Override
	public void process(HttpServletRequest request, 
							HttpServletResponse response) throws Throwable {
			//2. 요청분석, 작업처리
			
			//3. 저장
			request.setAttribute("message", "hi~~~ MVC 기반의 테스트입니다");
			//4. 뷰 페이지로 이동
			RequestDispatcher  dispatcher = request.getRequestDispatcher("/view/processView.jsp");
			dispatcher.forward(request, response);	
	}*/

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
			process(request, response);
			RequestDispatcher  dispatcher = request.getRequestDispatcher("/view/processView.jsp");
			dispatcher.forward(request, response);	
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
				process(request, response);
				RequestDispatcher  dispatcher = request.getRequestDispatcher("/view/processView.jsp");
				dispatcher.forward(request, response);	
			} catch (Throwable e) {
				e.printStackTrace();
			}
	}

	@Override
	public String process(HttpServletRequest request, 
					HttpServletResponse response) throws Throwable {
		//2. 요청분석, 작업처리
		//3. 저장
		request.setAttribute("message", "String return type MVC");
		//4. 이동 뷰 페이지 
		return "/view/processView.jsp";
	}
}
