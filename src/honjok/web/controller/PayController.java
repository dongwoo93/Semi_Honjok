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
		String price2 = request.getParameter("product_price");
		String bName = request.getParameter("name");
		String product_name = request.getParameter("product_name");
		String bPhone1 = request.getParameter("phone1");
		String bPhone2 = request.getParameter("phone2");
		String bPhone3 = request.getParameter("phone3");
		String zipcode = request.getParameter("zipcode");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		
		String price = price2.replaceAll("\\,","");
		String phone = bPhone1 + bPhone2 + bPhone3 + "";
		String address = address1 + address2;
		
		
		request.setAttribute("price", price);
		request.setAttribute("buyer_name", bName);
		request.setAttribute("product_name", product_name);
		request.setAttribute("phone", phone);
		request.setAttribute("zipcode", zipcode);
		request.setAttribute("address", address);
		
		String dst = "pay.jsp";
		
		RequestDispatcher rd = request.getRequestDispatcher(dst);
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
