package honjok.web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import honjok.web.beans.ShoppingSearch;


@WebServlet("*.shop")
public class ShoppingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		try {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		if(command.equals("")) {
			String keyword = request.getParameter("keyword");
			ShoppingSearch shop = new ShoppingSearch();
			
				JsonArray result = shop.getList(keyword);
				response.setCharacterEncoding("UTF-8");
				response.setContentType("application/json");
				new Gson().toJson(result, response.getWriter());
		}else if(command.equals("shoplist.shop")) {
			
		}
		
		
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
