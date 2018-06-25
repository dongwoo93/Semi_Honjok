package honjok.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import honjok.web.dao.BoardFreeDAO;
import honjok.web.dto.BoardFreeDTO;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.com")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dst = null;
		try {
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());
		
			
			if(command.equals("/hollo.com")) {
				System.out.println("µé¾î¿È");
				dst = "/community/index.jsp";
			}
		}catch (Exception e) {
			
		}
		
		RequestDispatcher rd = request.getServletContext().getRequestDispatcher(dst);
		rd.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
