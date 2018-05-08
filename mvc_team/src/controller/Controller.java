package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.NullAction;


public class Controller extends HttpServlet {
	
	private boolean usingTemplate = false;
	private String templatePage = null;
	
	private Map commandHandlerMap = new java.util.HashMap();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		String configFile = config.getInitParameter("configFile");
		
		Properties prop = new Properties();
		FileInputStream fis = null;
		
		try {
		fis = new FileInputStream(configFile);
		prop.load(fis);
		}catch(IOException e) {
			throw new ServletException(e);
		}finally {
			if(fis!=null) try {fis.close();} catch(IOException ex) {}
		}
		
		Iterator keyIter = prop.keySet().iterator();
		while(keyIter.hasNext()) {
			String command = (String)keyIter.next();
			System.out.println("command : " + command);
			
			String handlerClassName = prop.getProperty(command).trim();
			System.out.println("handlerClassName : " + handlerClassName);
			
			try {
			Class handlerClass = Class.forName(handlerClassName);

			Object handlerInstance = handlerClass.newInstance();
			commandHandlerMap.put(command, handlerInstance);
			}catch(ClassNotFoundException e) {
				throw new ServletException(e);
			}catch(InstantiationException e) {
				throw new ServletException(e);
			}catch(IllegalAccessException e) {
				throw new ServletException(e);
			}
		}
		

		templatePage = config.getInitParameter("templatePage");
		
		if(templatePage!=null && !templatePage.equals("")) {
			usingTemplate=true;
		}
	}
	
	//1. HTTP 요청 받음, doGet(), doPost() 메소드 호출 	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		process(request, response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//2. 클라이언트가 요구하는 기능을 분석(방명록의 경우 글쓰기등) 
		String command = request.getRequestURI();
		System.out.println("RequestURI : " + request.getRequestURI());
		
		if(command.indexOf(request.getContextPath())==0) {
			command = command.substring(request.getContextPath().length());
			System.out.println("command : " + command);
		}
		Action action = (Action)commandHandlerMap.get(command);
		if(action==null) {
			action = new NullAction();
		}
		
		String viewPage = null;
		try {
		//3. 요청한 비즈니스 로직을 처리하는 Model 사용, Business Logic Class 
		//4. 결과를 request 또는 session의 setAttribute()메소드를 사용하여 저장 
		//5. 알맞은 뷰 선택 후,
		viewPage = action.execute(request,response);
		}catch(Throwable e) {
			throw new ServletException(e);
		}
		if(usingTemplate) {
			request.setAttribute("CONTENT_PAGE", viewPage);
		}
		
		//6. 뷰로 포워딩(또는 리다이렉트), jsp 페이지로 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher(usingTemplate ? templatePage : viewPage);
				
		dispatcher.forward(request, response);
		}
}
