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
import honjok.web.dao.BoardFreeDTO;

@WebServlet("*.freeb")
public class BoardFree_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {

			BoardFreeDAO dao = new BoardFreeDAO();
			List<BoardFreeDTO> result = dao.selectData();


			request.setAttribute("result", result);
			
			RequestDispatcher rd = request.getRequestDispatcher("community/freeboardView.jsp");
			rd.forward(request, response);

		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.html");
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
