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
import honjok.web.dao.BoardQnaDAO;
import honjok.web.dto.BoardFreeDTO;
import honjok.web.dto.BoardQnaDTO;

@WebServlet("*.qna")
public class BoardQnaController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isRedirect = true;
		String dst = null;

		request.setCharacterEncoding("utf8");

		try {
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();

			String command = requestURI.substring(contextPath.length());
			if(command.equals("/qnaView.qna")) {

				BoardQnaDAO dao = new BoardQnaDAO();
				List<BoardQnaDTO> result = dao.selectData();

				request.setAttribute("result", result);

				RequestDispatcher rd = request.getRequestDispatcher("community/qnaView.jsp");
				rd.forward(request, response);
			}else if(command.equals("/qnaWrite.qna")) {
				BoardQnaDAO dao = new BoardQnaDAO();
				BoardQnaDTO dto = new BoardQnaDTO();

				int result = dao.insertData(dto);

				isRedirect = false; 
				dst = "qnaResult.jsp";
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
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
