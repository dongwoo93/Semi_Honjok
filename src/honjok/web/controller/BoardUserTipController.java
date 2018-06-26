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
				System.out.println("����");
				try {
					BoardUserTipDAO dao = new BoardUserTipDAO();
					List<BoardUserTipDTO> result = dao.selectData();

					request.setAttribute("result", result);

					isRedirect = false;
					dst = "community/userTipView.jsp";
				}catch(Exception e) {
					e.printStackTrace();
				}
			}else if(command.equals("/userTipView.UserTip")) {
				BoardUserTipDAO dao = new BoardUserTipDAO();
				List<BoardUserTipDTO> result = dao.selectData();

				request.setAttribute("result", result);

				isRedirect = false;
				dst = "community/UserTipboardView.jsp";
			}else if(command.equals("/userTipWrite.UserTip")) {
				BoardUserTipDAO dao = new BoardUserTipDAO();
				BoardUserTipDTO dto = new BoardUserTipDTO();

				int result = dao.insertData1(dto);

				isRedirect = false; 
				dst = "userTipResult.jsp";
			}else if(command.equals("/ajax01.utip")) {
				System.out.println("����1");
				try {
					BoardUserTipDAO dao = new BoardUserTipDAO();
					List<BoardUserTipDTO> result = dao.selectHeader1Data();

					request.setAttribute("result", result);

					isRedirect = false;
					dst = "community/userTipboardView.jsp";
				}catch (Exception e) {
					e.printStackTrace();
				}
			}else if(command.equals("/ajax02.utip")) {
				System.out.println("����2");
				BoardUserTipDAO dao = new BoardUserTipDAO();
				List<BoardUserTipDTO> result = dao.selectHeader2Data();

				request.setAttribute("result", result);

				isRedirect = false;
				dst = "community/userTipboardView.jsp";
			}else if(command.equals("/ajax03.utip")) {
				System.out.println("����3");
				BoardUserTipDAO dao = new BoardUserTipDAO();
				List<BoardUserTipDTO> result = dao.selectHeader3Data();

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
			System.out.println("�����");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
