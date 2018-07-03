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
import honjok.web.dao.AdminLikeDAO;
import honjok.web.dao.BoardTipDAO;
import honjok.web.dao.MapDAO;
import honjok.web.dto.AdminFilesDTO;
import honjok.web.dto.AdminLikeDTO;
import honjok.web.dto.BoardDTO;
import honjok.web.dto.MapDTO;

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

			if(command.equals("/selectNaviCat.tip")) {
				String category = request.getParameter("category");
				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");
				List<BoardDTO> result = new ArrayList<>();
				List<AdminFilesDTO> fileResult = new ArrayList<>();
				if (currentPageString == null) {
					currentPage = 1;
				}else {
					currentPage = Integer.parseInt(currentPageString);
				}
				String navi = dao.getPageNaviAll(currentPage, category);
				result = dao.selectNaviAllData(currentPage*8-7,currentPage*8, category);
				fileResult = fileDAO.getAllThum_sysFileName(category); 
				response.setCharacterEncoding("UTF-8");
				request.setAttribute("board", result);
				request.setAttribute("thumbnail", fileResult);
				request.setAttribute("navi", navi);
				request.setAttribute("page", currentPage);
//				for(int i =0; fileResult.size()>i;i++) {
//					System.out.println(result.get(i).getViewcount());
//				}
				isRedirect = false;
				dst = "board/boardtip.jsp";
			}else if(command.equals("/selectView.tip")) {
				List<BoardDTO> result = new ArrayList<>();
				String seq = request.getParameter("seq");
				String id = "ykng10";

				request.setAttribute("id", id);
				AdminLikeDAO like = new AdminLikeDAO();
				try {
					boolean likeResult = like.LikeExist(seq, id);
					if(!likeResult) {
						int insertLike = like.insertData(seq, id);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				AdminLikeDTO likeDTO = like.selectArticleLike(seq, id);
				String likeStat = likeDTO.getLike_check();
				
				ArrayList<MapDTO> map = new ArrayList<>();
				MapDAO dao2 = new MapDAO();
				
				map = dao2.selectData(seq);
				System.out.println(map.get(0).getX());
				System.out.println(map.get(0).getY());
				
				
				int viewcount = Integer.parseInt(request.getParameter("viewcount")) + 1;
				int upResult = dao.UpdateViewCount(seq, viewcount);
				if(upResult > 0) {
					result = dao.selectAllData(seq);
					/*for(int i =0; result.size()>i;i++) {
						System.out.println(result.get(i).getSubject());
					}*/	
					response.setCharacterEncoding("UTF-8");
					request.setAttribute("result", result);
					request.setAttribute("likeStat", likeStat);
					request.setAttribute("no", seq);
					
				}
				request.setAttribute("map", map);
				
				isRedirect = false;
				dst = "board/boardView.jsp";
			}
			else if(command.equals("/delete.tip")) {
				String seq = request.getParameter("seq");
				AdminFilesDTO fileDTO = fileDAO.isExsitThum_sysFile(seq);
				String systemFileName = fileDTO.getThum_sysFileName();
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
				dst = "selectNaviCat.tip";
			}else if(command.equals("/modify.tip")) {
				List<BoardDTO> result = new ArrayList<>();
				String seq = request.getParameter("seq");
				AdminFilesDTO fileDTO = fileDAO.isExsitThum_sysFile(seq);
				result = dao.selectAllData(seq);
				/*for(int i =0; result.size()>i;i++) {
					System.out.println(result.get(i).getSubject());
				}*/
				
				response.setCharacterEncoding("UTF-8");
				request.setAttribute("result", result);
				request.setAttribute("thumbnail", fileDTO);
				isRedirect = false;
				dst = "board/boardtipModify.jsp";
			}else if(command.equals("/selectNaviSub.tip")){
				String category = request.getParameter("category");
				String subject = request.getParameter("subject");
				String currentPageString = request.getParameter("currentPage");
				int currentPage = 0;
				List<BoardDTO> result = new ArrayList<>();
				List<AdminFilesDTO> fileResult = new ArrayList<>();
				if (currentPageString == null) {
					currentPage = 1;
				}else {
					currentPage = Integer.parseInt(currentPageString);
				}
				String navi = dao.getPageNavi(currentPage, category, subject);
				result = dao.selectNaviData(currentPage*8-7,currentPage*8, category, subject);
				fileResult = fileDAO.getSubThum_sysFileName(category, subject); 
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
