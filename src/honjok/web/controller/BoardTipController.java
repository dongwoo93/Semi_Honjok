package honjok.web.controller;



import java.io.File;

import java.io.IOException;

import java.util.ArrayList;

import java.util.List;



import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;



import honjok.web.dao.AdminFileDAO;

import honjok.web.dao.BoardTipDAO;

import honjok.web.dto.AdminFilesDTO;

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
			AdminFileDAO fileDAO = new AdminFileDAO();

			if(command.equals("/selectNavi.tip")) {
				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");
				List<BoardDTO> result = new ArrayList<>();
				List<AdminFilesDTO> fileResult = new ArrayList<>();
				if (currentPageString == null) {
					currentPage = 1;
				}else {
					currentPage = Integer.parseInt(currentPageString);
				}
				String navi = dao.getPageNavi(currentPage);
				result = dao.selectNaviData(currentPage*8-7,currentPage*8);
				fileResult = fileDAO.getThum_sysFileName(); 
				response.setCharacterEncoding("UTF-8");
				request.setAttribute("board", result);
				request.setAttribute("thumbnail", fileResult);
				request.setAttribute("navi", navi);
				request.setAttribute("page", currentPage);
				/*for(int i =0; fileResult.size()>i;i++) {
					System.out.println(fileResult.get(i).getThum_sysFileName());
				}*/
				isRedirect = false;
				dst = "board/boardtip.jsp";
			}else if(command.equals("/selectView.tip")) {
				List<BoardDTO> result = new ArrayList<>();
				String seq = request.getParameter("seq");
				result = dao.selectAllData(seq);
				response.setCharacterEncoding("UTF-8");
				request.setAttribute("result", result);
				isRedirect = false;
				dst = "board/boardView.jsp";
			}else if(command.equals("/delete.tip")) {
				String seq = request.getParameter("seq");
				String systemFileName = fileDAO.isExsitThum_sysFile(seq);

				if(!(systemFileName.equals(""))) {
					//../../../.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/Semi_Honjok
					String realPath = request.getServletContext().getRealPath("/files/");
					File file = new File(realPath + "/"+ systemFileName);

					if(file.exists() ){
						if(file.delete()){
							int result = dao.deleteData(seq);
							if(result > 0) {
							}else {
							}
							dst = "board/boardtip.jsp";
						}else{
						}
					}else{
					}
				}
				dst = "selectNavi.tip";
			}else if(command.equals("/modify.tip")) {

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
