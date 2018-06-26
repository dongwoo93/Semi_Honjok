package honjok.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import honjok.web.dao.BoardFreeDAO;
import honjok.web.dto.BoardFreeDTO;

@WebServlet("*.freeb")
public class BoardFree_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isRedirect = true;
		String dst = null;


		request.setCharacterEncoding("utf8");

		try {
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();

			String command = requestURI.substring(contextPath.length());

			if(command.equals("/test.freeb")) {
				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");

				if(currentPageString == null){
					currentPage = 1;
				}else {
					currentPage = Integer.parseInt(currentPageString);
				}
				BoardFreeDAO dao = new BoardFreeDAO();
				List<BoardFreeDTO> result = dao.selectData(currentPage*10-9,currentPage*10);
				String navi = dao.getPageNavi(currentPage);
				
				request.setAttribute("navi", navi);
				request.setAttribute("result", result);

				isRedirect = false;
				dst = "community/freeboardView.jsp";
			}else if(command.equals("/freeboardView.freeb")) {
				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");

				if(currentPageString == null){
					currentPage = 1;
				}else {
					currentPage = Integer.parseInt(currentPageString);
				}
				BoardFreeDAO dao = new BoardFreeDAO();
				List<BoardFreeDTO> result = dao.selectData(currentPage*10-9,currentPage*10);

				request.setAttribute("result", result);

				isRedirect = false;
				dst = "community/freeboardView.jsp";
			}else if(command.equals("/freeboardWrite.freeb")) {
				BoardFreeDAO dao = new BoardFreeDAO();
				BoardFreeDTO dto = new BoardFreeDTO();

				int result = dao.insertData(dto);

				isRedirect = false; 
				dst = "freeboardResult.jsp";
			}else if(command.equals("/ajax01.freeb")) {
				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");

				if(currentPageString == null){
					currentPage = 1;
				}else {
					currentPage = Integer.parseInt(currentPageString);
				}
				BoardFreeDAO dao = new BoardFreeDAO();
				List<BoardFreeDTO> result = dao.selectChatData(currentPage*10-9,currentPage*10);

				request.setAttribute("result", result);

				isRedirect = false;
				dst = "community/freeboardView.jsp";
			}else if(command.equals("/ajax02.freeb")) {
				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");

				if(currentPageString == null){
					currentPage = 1;
				}else {
					currentPage = Integer.parseInt(currentPageString);
				}
				BoardFreeDAO dao = new BoardFreeDAO();
				List<BoardFreeDTO> result = dao.selectHumorData(currentPage*10-9,currentPage*10);

				request.setAttribute("result", result);

				isRedirect = false;
				dst = "community/freeboardView.jsp";
			}else if(command.equals("/ajax03.freeb")) {
				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");

				if(currentPageString == null){
					currentPage = 1;
				}else {
					currentPage = Integer.parseInt(currentPageString);
				}
				BoardFreeDAO dao = new BoardFreeDAO();
				List<BoardFreeDTO> result = dao.selectBeastData(currentPage*10-9,currentPage*10);

				request.setAttribute("result", result);

				isRedirect = false;
				dst = "community/freeboardView.jsp";
			}else if(command.equals("/BoardFree_Controller.freeb")) {
				String no = request.getParameter("no");
				int seq = Integer.parseInt(no);
				System.out.println(seq);

				BoardFreeDAO dao = new BoardFreeDAO();
				System.out.println("1");
				List<BoardFreeDTO> result = dao.readData(seq);
				System.out.println("2");

				request.setAttribute("result", result);
				System.out.println("3");
				isRedirect = false;
				dst = "community/articleView.jsp";
			}
		}catch(Exception e) {
			System.out.println("¿¹¿Ü·Î ¿È");
			e.printStackTrace();
		}
		if(isRedirect) {
			System.out.println("µÎ¹øÂ°·Î ¿È");
		}else {
			System.out.println("¿©±âµµ¿È");
			RequestDispatcher rd = request.getRequestDispatcher(dst);
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
