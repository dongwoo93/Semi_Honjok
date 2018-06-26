package honjok.web.controller;

import java.io.IOException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import testDAO.testDAO;




@WebServlet("*.do")
public class MemberController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isRedirect = true;
		String dst = null;
		
		request.setCharacterEncoding("utf8");
		
		try {
			
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			
			String command = requestURI.substring(contextPath.length());
			if(command.equals("/test.do")) {
				
				try {
				
				String id = request.getParameter("id");
				String email = request.getParameter("email");
				String name = request.getParameter("name");
				
				email = email.replace("\"", "");
				name = name.replace("\"", "");
				
						
				System.out.println(id);
				System.out.println(email);
				System.out.println(name);
				
				testDAO dao = new testDAO();
				System.out.println("들어옴");
				int result = dao.insertData(id, name, email);
				
				System.out.println(result);
				
				isRedirect = false;
				dst = "login.html";
				
				}catch(Exception e) {
					e.printStackTrace();
				}
			}else if(command.equals("/naver.do")) {
				System.out.println("들어옴");
				String clientId = "0QWAu0ecnrYTQlD9z0JZ"; //애플리케이션 클라이언트 아이디값";
			    String redirectURI = URLEncoder.encode("http://localhost:8080/Semi_Honjok/callback.jsp", "UTF-8");
			    SecureRandom random = new SecureRandom();
			    String state = new BigInteger(130, random).toString();
			    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
			    apiURL += "&client_id=" + clientId;
			    apiURL += "&redirect_uri=" + redirectURI;
			    apiURL += "&state=" + state;
			    
			    response.sendRedirect(apiURL);
			    return;
			    /*session.setAttribute("state", state);*/
			    //RequestDispatcher rd = request.getRequestDispatcher(apiURL);
			    //rd.forward(request, response);
			    /*isRedirect = false;
				dst = apiURL;*/
				
			}
				
		}catch(Exception e) {
			
		}
		if(isRedirect) {
			response.sendRedirect(dst);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher(dst);
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
