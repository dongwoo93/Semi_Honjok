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
		String pName = "[留덉�留됲듅媛�] �뿏�룎�렖 �윭釉붾━�봽由큈 媛뺤븘吏��떚�뀛痢�(�븨�겕) S~2XL 媛뺤븘吏��샆 誘쇱냼留� �굹�떆�떚";
		String price = "12900";
		
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
