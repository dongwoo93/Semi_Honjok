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

/**
 * Servlet implementation class ShoppingController
 */
@WebServlet("/ShoppingController")
public class ShoppingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String keyword = request.getParameter("keyword");
		ShoppingSearch shop = new ShoppingSearch();
		try {
			JsonArray result = shop.getList(keyword);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			new Gson().toJson(result, response.getWriter());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
