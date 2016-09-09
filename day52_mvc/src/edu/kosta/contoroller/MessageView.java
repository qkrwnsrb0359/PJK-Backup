package edu.kosta.contoroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MessageView")
public class MessageView extends HttpServlet implements Servlet{
	
	//1.전송방식 결정
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}
	
	//2.사용자 요청 처리
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg = request.getParameter("message");
		Object result = null;
		
		if (msg == null || msg.equals("test")) {
			result = "메세지가 없거나, test로 넘어옴";
		} else if (msg.equals("name")) {
			result = "PJK";
		} else if (msg.equals("aa")) {
			result = "aa";
		} else {
			result = "찾는 type 없음";
		}
		
	//3. 저장 - request.setAttribute("변수", "데이터");
		request.setAttribute("result", result);
		
	//4. 해당 view로 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view/messageView.jsp");
		dispatcher.forward(request, response); //요청객체, 응답객체
		
	     /*RequestDispatcher는 클라이언트로부터 요청을 받고 그것을 서버상의 어떤 
         리소스(html, jsp, servlet page)로 보내는 작업을 할때 사용*/
	}
	
}
