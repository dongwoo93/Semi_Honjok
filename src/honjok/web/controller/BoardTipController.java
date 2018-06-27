package honjok.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import honjok.web.dao.BoardTipDAO;
import honjok.web.dto.BoardDTO;


@WebServlet("*.tip")
public class BoardTipController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isRedirect = true;
		String dst = null;
		try {
			request.setCharacterEncoding("UTF-8");
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());
			BoardTipDAO dao = new BoardTipDAO();
			//System.out.println(command);
			if(command.equals("/select.tip")) {
				int currentPage = 0;

				String currentPageString = request.getParameter("currentPage");
				List<BoardDTO> result = new ArrayList<>();
				if (currentPageString == null) {
					currentPage = 1;
				}else {
					currentPage = Integer.parseInt(currentPageString);
				}

				String navi = dao.getPageNavi(currentPage);
				result = dao.selectNaviData(currentPage*8-7,currentPage*8);
				response.setCharacterEncoding("UTF-8");
				request.setAttribute("board", result);
				request.setAttribute("navi", navi);
				request.setAttribute("page", currentPageString);
				/*for(int i =0; result.size()>i;i++) {
					System.out.println(result.get(i).getContents());
				}*/
				isRedirect = false;
				dst = "board/boardtip.jsp";
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		if(isRedirect) {
			response.sendRedirect(dst);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher(dst);
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
