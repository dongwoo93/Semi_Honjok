package honjok.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import honjok.web.dao.BoardDAO;
import honjok.web.dao.MemberDAO;
import honjok.web.dao.MypageDAO;
import honjok.web.dto.BoardUserDTO;
import honjok.web.dto.MemberDTO;

@WebServlet("*.mp")
public class MypageController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());
			boolean isRedirect = true;
			String dst = null;

			if (command.equals("/selectdata.mp")) {
				String id = (String)request.getSession().getAttribute("loginId");
				ArrayList<BoardUserDTO> result = new ArrayList<>();
				MypageDAO dao = new MypageDAO();
				String navi = null;

				if(id!=null) {
					int currentPage = 0;
					String currentPageString = request.getParameter("currentPage");

					if(currentPageString == null){
						currentPage = 1;
					}else {
						currentPage = Integer.parseInt(currentPageString);
					}
					result = dao.selectData(currentPage*10-9,currentPage*10, id);
					navi = dao.getPageNavi(currentPage, id);
				}
				request.setAttribute("result", result);
				request.setAttribute("navi", navi);

				isRedirect = false;
				dst="boardmanagement.jsp";
			}
			
			else if(command.equals("/myinfo.mp")) {
				String id = (String)request.getSession().getAttribute("loginId");
				MemberDAO dao = new MemberDAO();
				ArrayList<MemberDTO> result = dao.outputData(id);
				request.setAttribute("result", result);
				isRedirect = false;
				dst="myinfo2.jsp";
			}
			
			else if(command.equals("/memberupdate.mp")) {
				String id = (String)request.getSession().getAttribute("loginId");
				MemberDAO dao = new MemberDAO();
				ArrayList<MemberDTO> result = dao.outputData(id);
				request.setAttribute("result", result);
				isRedirect = false;
				dst="memberupdate2.jsp";
				
			}else if(command.equals("/user_del_board.mp")) {
				String id = (String)request.getSession().getAttribute("loginId");
				MypageDAO dao = new MypageDAO();
				String delList = request.getParameter("delList");
				String[] delArr = delList.split(",", -1);
				for(int i = 0; i < delArr.length; i++) {
					dao.deleteData(Integer.parseInt(delArr[i]));
				}
				dst = "selectdata.mp?id="+id;
			}
			if (isRedirect) {
				response.sendRedirect(dst);
			} else {				
				RequestDispatcher rd = request.getRequestDispatcher(dst);
				rd.forward(request, response);
			}
		}catch(Exception e) {

		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}


}
