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

import honjok.web.dao.BoardTipDAO;
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
			//System.out.println(command);
			if(command.equals("/selectNavi.tip")) {
				int currentPage = 0;

				String currentPageString = request.getParameter("currentPage");
				List<BoardDTO> result = new ArrayList<>();
				if (currentPageString == null) {
					currentPage = 1;
				}else {
					currentPage = Integer.parseInt(currentPageString);
				}
				System.out.println("페이지 " + currentPage);
				String navi = dao.getPageNavi(currentPage);
				result = dao.selectNaviData(currentPage*8-7,currentPage*8);
				response.setCharacterEncoding("UTF-8");
				request.setAttribute("board", result);
				request.setAttribute("navi", navi);
				request.setAttribute("page", currentPage);
				/*for(int i =0; result.size()>i;i++) {
					System.out.println(result.get(i).getContents());
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
				String systemFileName = dao.getSystemFileName(seq);
				System.out.println(systemFileName);
				
				if(!(systemFileName.equals(""))) {
					//../../../.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Semi_Honjok
					File file = new File("Semi_Honjok\\files\\"+systemFileName);
					System.out.println(file.getAbsolutePath());
			        
			        if(file.exists() ){
			            if(file.delete()){
			                System.out.println("파일삭제 성공");
			                int result = dao.deleteData(seq);
							if(result > 0) {
								System.out.println("삭제 완료");
							}else {
								System.out.println("삭제 실패");
							}
							dst = "board/boardtip.jsp";
			            }else{
			                System.out.println("파일삭제 실패");
			            }
			        }else{
			            System.out.println("파일이 존재하지 않습니다.");
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
