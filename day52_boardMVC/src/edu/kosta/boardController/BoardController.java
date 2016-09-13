package edu.kosta.boardController;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import edu.kosta.boardAction.CommandAction;

public class BoardController extends HttpServlet {
	private Map commandMap = new HashMap<>();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		String props = config.getInitParameter("propertyConfig"); // web.xml 설정 파일 읽음
		Properties pr = new Properties();
		FileInputStream f = null;
		
		try {
			f = new FileInputStream(props);
			pr.load(f);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(f != null) {
				try {
				f.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		Iterator keyIter = (Iterator)pr.keySet().iterator();
		
		while(keyIter.hasNext()) {
			String command = (String) keyIter.next();
			
			String className = pr.getProperty(command);
			
			try {
				Class commandClass = Class.forName(className);
				Object commandInstance = commandClass.newInstance();
				commandMap.put(command, commandInstance);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = null;
		CommandAction ca = null;
		
		try {
			String command = request.getRequestURI();
			System.out.println("command : " + command); // /day52_boardMVC/writeForm.do
			System.out.println("request.getContextPath() : " + request.getContextPath());
			
			if(command.indexOf(request.getContextPath()) == 0) {
				command = command.substring(request.getContextPath().length() + 1);
				System.out.println("if command : " + command);
			}
			
			ca = (CommandAction) commandMap.get(command);
			System.out.println("ca : " + ca);
			view = ca.process(request, response);
			System.out.println("view : " + view);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("CONTENT", view);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/template/template.jsp");
		dispatcher.forward(request, response);
		
	}
}
