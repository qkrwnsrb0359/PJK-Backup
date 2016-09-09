package day40_web_jsp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
   public String user = "pjkpjk";
   public String passwd = "12345";

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
		   throws ServletException, IOException {
      process(req, resp);
   }

   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
		   throws ServletException, IOException {
      process(req, resp);
   }

   protected void process(HttpServletRequest req, HttpServletResponse resp) 
		   throws ServletException, IOException {
	   resp.setContentType("text/html; charset=utf-8");
	   
	   String id = req.getParameter("id");
	   String pwd = req.getParameter("pw");
	   
	   PrintWriter pw = resp.getWriter();
	   pw.print("<html><head><title>Login Servlet Test</title></head><body><b><br>");
	   if(user.equalsIgnoreCase(id) && passwd.equalsIgnoreCase(pwd)) {
		   pw.println("�ݰ���<br>");
		   pw.println("�ȳ��Ͻʴϱ� " + id + "��<br>");
		   pw.println("��ȣ�� " + pwd + "�Դϴ�.<br>");
	   } else if(user.equals(id) && !passwd.equals(pwd)) {
		   pw.println("��ȣƲ��<br>");
		   pw.println("<a href='view/login.html'>Login</a>");
	   } else {
		   pw.println("��ϵ��� ���� ���̵���<br>");
		   pw.println("<a href='view/login.html'>Login</a>");
	   }
	   
	   pw.println("</b></body></html>");
	   pw.close();
   }
}