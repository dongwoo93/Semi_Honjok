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
		String pName = request.getParameter("name");
		String price = request.getParameter("amount");
		String bName = request.getParameter("buyer_name");
		String bPhone = request.getParameter("buyer_phone");
		String bEmail = request.getParameter("buyer_email");
		String bAddress = request.getParameter("buyer_addr");
		String bPostcode = request.getParameter("buyer_postcode");
		
		request.setAttribute("name", pName);
		request.setAttribute("amount", price);
		request.setAttribute("buyer_email", bEmail);
		request.setAttribute("buyer_name", bName);
		request.setAttribute("buyer_tel", bPhone);
		request.setAttribute("buyer_addr", bAddress);
		request.setAttribute("buyer_postcode", bPostcode);
		
		String dst = "pay.jsp";
		
		RequestDispatcher rd = request.getRequestDispatcher(dst);
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
