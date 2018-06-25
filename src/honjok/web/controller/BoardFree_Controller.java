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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF8");

		boolean isRedirect = true;
		String dst = null;

		try{

			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());


			if(command.equals("/freeboardView.freeb")) {
				BoardFreeDAO dao = new BoardFreeDAO();
				List<BoardFreeDTO> result = dao.selectData();

				request.setAttribute("result", result);

				isRedirect=false;
				dst = "null";
				
			}else if(command.equals("/hontalkView.freeb")){
				BoardFreeDAO dao = new BoardFreeDAO();
				System.out.println("들어온다");
				
				List<BoardFreeDTO> result = dao.selectData();
				
				request.setAttribute("result", result);

				isRedirect=false;
				dst = "/community/hontalkView.jsp";
				
			}


		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.html");
		}
		
		if(isRedirect) {
			response.sendRedirect(dst);
		}else {
			RequestDispatcher rd = request.getServletContext().getRequestDispatcher(dst);
			rd.forward(request, response);
		}

		
	}



protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	doGet(request, response);
}

}
