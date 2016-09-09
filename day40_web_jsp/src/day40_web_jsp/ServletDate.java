package day40_web_jsp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;;

//@WebServlet(/DateServlet") // annotation

@WebServlet(name="ServletDate", urlPatterns="/hello.do")
public class ServletDate extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request, response);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		System.out.println("Hello Servlet!!!");
		PrintWriter out = response.getWriter();
		out.write("<html><head><title>Servlet Test</title></head></html>");
		out.write("<body><h1><font color='red'>Hello Servlet</font></h1></body>");
	}

}
