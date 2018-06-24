package honjok.web.controller;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import honjok.web.dao.BoardWriteDAO;


@WebServlet("/boardWrite")
public class BoardWriteController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		StringBuffer sb = new StringBuffer();
		String line = null;
		boolean isRedirect = true;
		String dst = null;
		String title = request.getParameter("title");
		String contents = request.getParameter("summernote");
		System.out.println(title);
		BoardWriteDAO dao = new BoardWriteDAO();
		try {
			BufferedReader reader = request.getReader();
			while ((line = reader.readLine()) != null)
				sb.append(line);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		//String contents = sb.toString();
		System.out.println(contents);
		try {
			dao.insertInfo(title, contents);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//isRedirect = false; 
		dst = "index.jsp";
		
		if(isRedirect) {
			response.sendRedirect(dst);
			System.out.println(dst);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher(dst);
			rd.forward(request, response);
		}

	}

}
