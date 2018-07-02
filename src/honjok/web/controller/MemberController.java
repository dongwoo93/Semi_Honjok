package honjok.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import honjok.web.dao.MemberDAO;
import honjok.web.dto.MemberDTO;


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
					String check = "아이디가 중복되었습니다";
					out.println(check);
					System.out.println(check);
					return;

				} else {
					String check = "중복되지 않아,사용가능합니다";
					out.println(check);
					return;

				}

			} else if(command.equals("/memberout.mem")) {
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");

				int result = dao.deleteData(id,pw);
				request.setAttribute("result", result);
				isRedirect = false;
				if (result>0) {
					dst = "hollo.com";
				} else {

				}
			}


			else if(command.equals("/memberupdate.mem")) {
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				String name = request.getParameter("name");
				String phone = request.getParameter("phone");
				String email = request.getParameter("email");
				String zipcode = request.getParameter("zipcode");
				String address = request.getParameter("address");




				int result = dao.updateData(id, pw, name, phone, email, zipcode, address);
				request.setAttribute("result", result);
				isRedirect = false;

				dst = "hollo.com";

			}



			else if (command.equals("/memberouputdata.mem")) {
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				String name = request.getParameter("name");
				String phone = request.getParameter("phone");
				String email = request.getParameter("email");
				String zipcode = request.getParameter("zipcode");
				String address = request.getParameter("address");
				String gender = request.getParameter("gender");
                System.out.println(id);
                System.out.println(name);
				ArrayList<MemberDTO> result = dao.outputData(id);
				
				
				request.setAttribute("result", result);


				isRedirect = false;

				dst="myinfo.jsp";

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
