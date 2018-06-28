package honjok.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import honjok.web.dao.BoardWriteDAO;
import honjok.web.dto.BoardDTO;

/**
 * Servlet implementation class BoardSelectController
 */
@WebServlet("/BoardSelectController")
public class BoardSelectController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*BoardWriteDAO dao = new BoardWriteDAO();
		boolean isRedirect = true;
		String dst = "null";
		try {
			List<BoardDTO> list = dao.boardSelect();
			request.setAttribute("result", list);
			isRedirect = false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		dst = "/board/boardview.jsp";
		if(isRedirect) {
			response.sendRedirect(dst);
		}else {
		RequestDispatcher rd = request.getRequestDispatcher(dst);
		rd.forward(request, response);
		}*/
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
