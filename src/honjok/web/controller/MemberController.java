package honjok.web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import honjok.web.dao.MemberDAO;


@WebServlet("*.mem")
public class MemberController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());

			MemberDAO dao = new MemberDAO();
			boolean isRedirect = true;
			String dst = null;



			if(command.equals("/signup.mem")) {
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				String name = request.getParameter("name");
				String phone = request.getParameter("phone");
				String email = request.getParameter("email");
				String zipcode = request.getParameter("zipcode");
				String address = request.getParameter("address");
				String gender = request.getParameter("gender");

				int result = dao.insertData(id, pw, name, phone, email, zipcode, address, gender);
				request.setAttribute("result", result);

				isRedirect = false;
				dst = "signup.jsp";


			} else if(command.equals("/idcheck.mem")) {
				String id= request.getParameter("value");
				boolean result = dao.isIdExist(id);
				if(result) {
					String check = "이미 존재하는 아이디입니다.";
					out.println(check);
					return;

				} else {
					String check = "사용할 수 있는 아이디 입니다.";
					out.println(check);
					return;

				}

			} else if(command.equals("/memberout.mem")) {
				
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				int result = dao.deleteData(id,pw);
				request.setAttribute("result", result);
				isRedirect = false;
				dst = "hollo.com";
			}
			
			if (isRedirect) {
				response.sendRedirect(dst);
			} else {				
				RequestDispatcher rd = request.getRequestDispatcher(dst);
				rd.forward(request, response);
			}




		} catch(Exception e) {

		}
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
