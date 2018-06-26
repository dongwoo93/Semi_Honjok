package honjok.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import honjok.web.dao.CounselDAO;
import honjok.web.dto.CounselDTO;

/**
 * Servlet implementation class CounselController
 */
@WebServlet("*.coun")
public class CounselController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isRedirect = true;
		String dst = null;

		request.setCharacterEncoding("utf8");

		try {


			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();

			String command = requestURI.substring(contextPath.length());

			System.out.println(command);
			if(command.equals("/test.coun")) {
				System.out.println("µé¾î¿È");
				try {
					CounselDAO dao = new CounselDAO();
					List<CounselDTO> result = dao.selectData();

					request.setAttribute("result", result);

					isRedirect = false;
					dst = "community/counselView.jsp";
				}catch(Exception e) {
					e.printStackTrace();
				}
			}else if(command.equals("/counselView.coun")) {
				CounselDAO dao = new CounselDAO();
				List<CounselDTO> result = dao.selectData();

				request.setAttribute("result", result);

				isRedirect = false;
				dst = "community/counselView.jsp";
			}else if(command.equals("/counselWrite.coun")) {
				CounselDAO dao = new CounselDAO();
				CounselDTO dto = new CounselDTO();

				int result = dao.insertData1(dto);

				isRedirect = false; 
				dst = "counselResult.jsp";
			}else if(command.equals("/ajax01.coun")) {
				System.out.println("¿ÔÀ½1");
				try {
					CounselDAO dao = new CounselDAO();
					List<CounselDTO> result = dao.selectHeader1Data();

					request.setAttribute("result", result);

					isRedirect = false;
					dst = "community/counselView.jsp";
				}catch (Exception e) {
					e.printStackTrace();
				}
			}else if(command.equals("/ajax02.coun")) {
				System.out.println("¿ÔÀ½2");
				CounselDAO dao = new CounselDAO();
				List<CounselDTO> result = dao.selectHeader2Data();

				request.setAttribute("result", result);

				isRedirect = false;
				dst = "community/counselView.jsp";
			}else if(command.equals("/ajax03.coun")) {
				System.out.println("¿ÔÀ½3");
				CounselDAO dao = new CounselDAO();
				List<CounselDTO> result = dao.selectHeader3Data();

				request.setAttribute("result", result);

				isRedirect = false;
				dst = "community/counselView.jsp";
			}
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.html");
		}
		if(isRedirect) {
			response.sendRedirect(dst);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher(dst);
			rd.forward(request, response);
			System.out.println("³¢¿ä¿Ê");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
