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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import honjok.web.beans.StatisticsData;
import honjok.web.dao.BoardFreeDAO;
import honjok.web.dto.BoardFreeDTO;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.com")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StatisticsData std = new StatisticsData();
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dst = null;
		request.setCharacterEncoding("UTF-8");
		try {
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());
		
			
			if(command.equals("/hollo.com")) {
				
				dst = "/community/index.jsp";
				
			}else if(command.equals("/data.com")) {
				JSONArray result = std.getOneTotal();
				JSONArray result2 = new JSONArray();
				response.setCharacterEncoding("UTF-8");
				response.setContentType("application/json");
				for(int i = 0; i<3; i++) {
					JSONObject tmp = (JSONObject) result.get(i);
					result2.add(tmp);					
				}
				response.getWriter().print(result2);
				response.getWriter().flush();
				response.getWriter().close();
				return;
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
