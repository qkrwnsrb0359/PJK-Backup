package day40_web_jsp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;;

//@WebServlet("/DateServlet") // annotation

@WebServlet(name="DateServlet", urlPatterns="/hello.do")
public class DateServlet extends HttpServlet{

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
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8"); // 한글나오게
		
		System.out.println("console mode print");
		
		Calendar cal = Calendar.getInstance(); // system이 갖고 있는 날짜/시간
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		int minute = cal.get(Calendar.MINUTE);
		int second = cal.get(Calendar.SECOND);
		
		PrintWriter out = response.getWriter();
		out.write("<html><head><title>Servlet Test</title></head>");
		out.write("<body><h1> 현재시간은 ");
		out.write(Integer.toString(hour) + "시 ");
		out.write(Integer.toString(minute) + "분 ");
		out.write(Integer.toString(second) + "초입니다.");
		out.write("</body></html>");
	}
}
