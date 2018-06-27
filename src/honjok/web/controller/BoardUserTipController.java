package honjok.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import honjok.web.dao.BoardUserTipDAO;
import honjok.web.dto.BoardUserTipDTO;


@WebServlet("*.utip")
public class BoardUserTipController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isRedirect = true;
		String dst = null;

		request.setCharacterEncoding("utf8");

		try {


			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();

			String command = requestURI.substring(contextPath.length());

			System.out.println(command);
			if(command.equals("/test.utip")) {
				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");

				if(currentPageString == null){
					currentPage = 1;
				}else {
					currentPage = Integer.parseInt(currentPageString);
				}
				BoardUserTipDAO dao = new BoardUserTipDAO();
				List<BoardUserTipDTO> result = dao.selectData(currentPage*10-9,currentPage*10);
				String navi = dao.getPageNavi(currentPage);

				request.setAttribute("navi", navi);
				request.setAttribute("result", result);

				isRedirect = false;
				dst = "community/userTipView.jsp";
			}else if(command.equals("/userTipView.UserTip")) {
				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");

				if(currentPageString == null){
					currentPage = 1;
				}else {
					currentPage = Integer.parseInt(currentPageString);
				}
				BoardUserTipDAO dao = new BoardUserTipDAO();
				List<BoardUserTipDTO> result = dao.selectData(currentPage*10-9,currentPage*10);
				String navi = dao.getPageNavi(currentPage);

				request.setAttribute("navi", navi);
				request.setAttribute("result", result);

				isRedirect = false;
				dst = "community/UserTipboardView.jsp";
			}else if(command.equals("/userTipWrite.UserTip")) {
				BoardUserTipDAO dao = new BoardUserTipDAO();
				BoardUserTipDTO dto = new BoardUserTipDTO();

				int result = dao.insertData(dto);

				isRedirect = false; 
				dst = "userTipResult.jsp";
			}else if(command.equals("/ajax01.utip")) {
				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");

				if(currentPageString == null){
					currentPage = 1;
				}else {
					currentPage = Integer.parseInt(currentPageString);
				}
				BoardUserTipDAO dao = new BoardUserTipDAO();
				List<BoardUserTipDTO> result = dao.selectHeader1Data(currentPage*10-9,currentPage*10);
				String navi = dao.getPageNavi(currentPage);

				request.setAttribute("navi", navi);
				request.setAttribute("result", result);

				isRedirect = false;
				dst = "community/userTipboardView.jsp";
			}else if(command.equals("/ajax02.utip")) {
				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");

				if(currentPageString == null){
					currentPage = 1;
				}else {
					currentPage = Integer.parseInt(currentPageString);
				}
				BoardUserTipDAO dao = new BoardUserTipDAO();
				List<BoardUserTipDTO> result = dao.selectHeader2Data(currentPage*10-9,currentPage*10);
				String navi = dao.getPageNavi(currentPage);

				request.setAttribute("navi", navi);
				request.setAttribute("result", result);

				isRedirect = false;
				dst = "community/userTipboardView.jsp";
			}else if(command.equals("/ajax03.utip")) {
				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");

				if(currentPageString == null){
					currentPage = 1;
				}else {
					currentPage = Integer.parseInt(currentPageString);
				}
				BoardUserTipDAO dao = new BoardUserTipDAO();
				List<BoardUserTipDTO> result = dao.selectHeader3Data(currentPage*10-9,currentPage*10);
				String navi = dao.getPageNavi(currentPage);

				request.setAttribute("navi", navi);
				request.setAttribute("result", result);

				isRedirect = false;
				dst = "community/userTipboardView.jsp";
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
