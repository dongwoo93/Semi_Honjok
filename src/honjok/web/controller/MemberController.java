package honjok.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import honjok.web.dao.MemberDAO;
import honjok.web.dao.MypageDAO;
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
				String phone = request.getParameter("phone1");
				String email = request.getParameter("email");
				String zipcode = request.getParameter("zipcode");
				String address = request.getParameter("address");
				String gender = request.getParameter("gender");
				

				int result = dao.insertData(id, pw, name, phone, email, zipcode, address, gender);
				request.setAttribute("result", result);

				isRedirect = false;
				dst = "hollo.com";


			} else if(command.equals("/idcheck.mem")) {
				String id= request.getParameter("value");
				boolean result = dao.isIdExist(id);
				if(id==null) {
					out.println("");
					return;
				}
				if(result) {
					String check = "이미 존재하는 아이디입니다.";
					out.println(check);
					return;

				} else{
					String check = "사용할 수 있는 아이디 입니다.";
					out.println(check);
					return;
				}

			} else if(command.equals("/memberout.mem")) {

				String id = request.getParameter("id");
				System.out.println(id);
				
				if(id.contains("Naver") || id.contains("Kakao") || id.contains("Google")) {
					request.getSession().invalidate();
					dst ="memberoutproc.jsp";
				}else {
					String pw = request.getParameter("pw");

					boolean b = dao.idpwCheck(id, pw);
					
					System.out.println("memberout 들어옴");
					
					if(b) {
						int result = dao.deleteData(id,pw);
						request.setAttribute("result", result);
				
						
						isRedirect = false;
						
						if (result>0) {
							request.getSession().invalidate();
							dst ="memberoutproc.jsp";
							
						} else {
					  
						}
					}else {
						  // System.out.println("아이디 비번 다른경우 들어옴");
							int num = 1;
							request.setAttribute("num", num);
							isRedirect = false;
							dst = "memberout.jsp";
					}
				}
				
				
				
				
			}else if(command.equals("/memberout.mem")) {
				String id = (String) request.getSession().getAttribute("loginId");
				List<MemberDTO> result = dao.outputData(id);
				request.setAttribute("result", result);
				isRedirect = false;
				dst = "memberout.jsp";
			}


			else if(command.equals("/memberupdate.mem")) {
				
				
				String id = (String)request.getSession().getAttribute("loginId");
				String pw = request.getParameter("pw");
				String name = request.getParameter("name");
				String phone = request.getParameter("phone");
				String email = request.getParameter("email");
				String zipcode = request.getParameter("zipcode");
				String address = request.getParameter("address");

				


				int result = dao.updateData(id, pw, name, phone, email, zipcode, address);
				request.setAttribute("result", result);
				
				isRedirect = false;

				dst = "updateproc.jsp";

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
