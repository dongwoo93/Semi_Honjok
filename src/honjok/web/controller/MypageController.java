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
import honjok.web.dao.MypageDAO;
import honjok.web.dto.BoardUserDTO;
import honjok.web.dto.MemberDTO;

@WebServlet("*.mp")
public class MypageController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());

			
			boolean isRedirect = true;
			String dst = null;


			if (command.equals("/selectdata.mp")) {
				String id = (String)request.getSession().getAttribute("loginId");
				MypageDAO dao = new MypageDAO();
				ArrayList<BoardUserDTO> result = dao.selectData(id);


				request.setAttribute("result", result);


				isRedirect = false;

				dst="boardmanagement.jsp";


			}
			
			else if(command.equals("/myinfo.mp")) {
				String id = (String)request.getSession().getAttribute("loginId");
				MemberDAO dao = new MemberDAO();
				ArrayList<MemberDTO> result = dao.outputData(id);
				
				request.setAttribute("result", result);


				isRedirect = false;

				dst="myinfo.jsp";
				
			}
			
			else if(command.equals("/memberupdate.mp")) {
				String id = (String)request.getSession().getAttribute("loginId");
				MemberDAO dao = new MemberDAO();
				ArrayList<MemberDTO> result = dao.outputData(id);
				
				request.setAttribute("result", result);


				isRedirect = false;

				dst="memberupdate.jsp";
				
			}


			if (isRedirect) {
				response.sendRedirect(dst);
			} else {				
				RequestDispatcher rd = request.getRequestDispatcher(dst);
				rd.forward(request, response);
			}

		}catch(Exception e) {

		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}


}
