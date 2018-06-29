package honjok.web.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import honjok.web.dao.BoardFreeDAO;

/**
 * Servlet implementation class TestController
 */
@WebServlet("/TestController")
public class TestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardSeq = "2";
		String id = "ykng10";
		request.setAttribute("boardSeq", boardSeq);
		request.setAttribute("id", id);
		BoardFreeDAO dao = new BoardFreeDAO();
		try {
			boolean result = dao.LikeExist(boardSeq, id);
			if(!result) {
				int insertLike = dao.insertData(boardSeq, id);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//dao.selectData()
		String dst = "socialtest.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(dst);
        rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
