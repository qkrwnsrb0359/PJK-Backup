package edu.kosta.ex0825;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InitLoginServlet extends HttpServlet {
	private String user;
	private String passwd;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print("<html><head><title>Login Servlet Test</title></head><body><b><br>");

			  
	   if(user.equalsIgnoreCase(id) && passwd.equalsIgnoreCase(pw)) {
		   out.println("반가워<br>");
		   out.println("안녕하십니까 " + id + "님<br>");
		   out.println("암호는 " + pw + "입니다.<br>");
	   } else if(user.equals(id) && !passwd.equals(pw)) {
		   out.println("암호틀림<br>");
		   out.println("<a href='initLogin.jsp'>Login</a>");
	   } else {
		   out.println("등록되지 않은 아이디임<br>");
		   out.println("<a href='initLogin.jsp'>Login</a>");
	   }   
	   out.println("</b></body></html>");
	   out.close();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print("<html><head><title>Login Servlet Test</title></head><body><b><br>");

			  
	   if(user.equalsIgnoreCase(id) && passwd.equalsIgnoreCase(pw)) {
		   out.println("반가워<br>");
		   out.println("안녕하십니까 " + id + "님<br>");
		   out.println("암호는 " + pw + "입니다.<br>");
	   } else if(user.equals(id) && !passwd.equals(pw)) {
		   out.println("암호틀림<br>");
		   out.println("<a href='/view/initLogin.jsp'>Login</a>");
	   } else {
		   out.println("등록되지 않은 아이디임<br>");
		   out.println("<a href='/view/initLogin.jsp'>Login</a>");
	   }   
	   out.println("</b></body></html>");
	   out.close();
	}		

	@Override
	public void init(ServletConfig config) 
			throws ServletException {
		this.user = config.getInitParameter("user");
		this.passwd = config.getInitParameter("pw");
		System.out.println("web.xml을 이용한 초기 설정값 로드 완료");
	}
}
