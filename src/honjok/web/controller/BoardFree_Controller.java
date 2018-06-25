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
import honjok.web.dao.BoardWriteDAO;
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
				try {
					BoardFreeDAO dao = new BoardFreeDAO();
					List<BoardFreeDTO> result = dao.selectData();

					request.setAttribute("result", result);

					isRedirect = false;
					dst = "community/freeboardView.jsp";
				}catch(Exception e) {
					e.printStackTrace();
				}
			}else if(command.equals("/freeboardView.freeb")) {
				BoardFreeDAO dao = new BoardFreeDAO();
				List<BoardFreeDTO> result = dao.selectData();

				request.setAttribute("result", result);

				RequestDispatcher rd = request.getRequestDispatcher("community/freeboardView.jsp");
				rd.forward(request, response);
			}else if(command.equals("/freeboardWrite.freeb")) {
				BoardFreeDAO dao = new BoardFreeDAO();
				BoardFreeDTO dto = new BoardFreeDTO();

				int result = dao.insertData(dto);

				isRedirect = false; 
				dst = "freeboardResult.jsp";
			}else if(command.equals("/ajax01.freeb")) {
				System.out.println("ø‘¿Ω1");
				try {
					BoardFreeDAO dao = new BoardFreeDAO();
					List<BoardFreeDTO> result = dao.selectChatData();

					request.setAttribute("result", result);

					isRedirect = false;
					dst = "community/freeboardView.jsp";
				}catch (Exception e) {
					e.printStackTrace();
				}
			}else if(command.equals("/ajax02.freeb")) {
				System.out.println("ø‘¿Ω2");
				BoardFreeDAO dao = new BoardFreeDAO();
				List<BoardFreeDTO> result = dao.selectHumorData();

				request.setAttribute("result", result);

				isRedirect = false;
				dst = "community/freeboardView.jsp";
			}else if(command.equals("/ajax03.freeb")) {
				System.out.println("ø‘¿Ω3");
				BoardFreeDAO dao = new BoardFreeDAO();
				List<BoardFreeDTO> result = dao.selectBeastData();

				request.setAttribute("result", result);

				isRedirect = false;
				dst = "community/freeboardView.jsp";
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
			System.out.println("≥¢ø‰ø ");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
