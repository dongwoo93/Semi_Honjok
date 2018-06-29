package honjok.web.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PayController
 */
@WebServlet("/PayController")
public class PayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String pName = "[마지막특가] 엔돌펫 러블리프릴T 강아지티셔츠(핑크) S~2XL 강아지옷 민소매 나시티";
		String price = "12900";
		System.out.println(pName);
		System.out.println(price);
		
		request.setAttribute("name1", pName);
		request.setAttribute("price1", price);
		
		String dst = "pay.jsp";
		
		RequestDispatcher rd = request.getRequestDispatcher(dst);
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
