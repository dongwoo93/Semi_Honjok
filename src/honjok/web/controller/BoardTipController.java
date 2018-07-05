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
				/*for(int i =0; fileResult.size()>i;i++) {
					System.out.println(result.get(i).getViewcount());
				}*/
				isRedirect = false;
				dst = "board/boardtip2.jsp";
			}else if(command.equals("/selectView.tip")) {
				BoardDTO result = new BoardDTO();
				String seq = request.getParameter("seq");
				String id = (String)request.getSession().getAttribute("loginId");
				AdminLikeDAO like = new AdminLikeDAO();
				
				if(id != null) {
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
					request.setAttribute("likeStat", likeStat);
				}else {
					id = "nonmember";
					request.setAttribute("likeStat", "0");
				}
				
				request.setAttribute("id", id);
				ArrayList<MapDTO> map = new ArrayList<>();
				MapDAO dao2 = new MapDAO();

				map = dao2.selectData(seq);
				
				
				int viewcount = Integer.parseInt(request.getParameter("viewcount")) + 1;
				int upResult = dao.UpdateViewCount(seq, viewcount);
				if(upResult > 0) {
					result = dao.selectAllData(seq);
					/*for(int i =0; result.size()>i;i++) {
						System.out.println(result.get(i).getSubject());
					}*/	
					response.setCharacterEncoding("UTF-8");
					request.setAttribute("result", result);
					request.setAttribute("no", seq);
				}
				request.setAttribute("map", map);
				List<BoardDTO> latest = dao.selectLatestData();
				request.setAttribute("latest", latest);
				isRedirect = false;
				dst = "board/boardView2.jsp";
			}
			else if(command.equals("/delete.tip")) {
				String seq = request.getParameter("seq");
				System.out.println("delete in");
				System.out.println("delete seq" + seq);
				AdminFilesDTO fileDTO = fileDAO.isExsitThum_sysFile(seq);

				String systemFileName = fileDTO.getThum_sysFileName();
				System.out.println("systemFileName: " + systemFileName);
				if(!(systemFileName.equals(""))) {
					//../../../.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/Semi_Honjok
					String realPath = request.getServletContext().getRealPath("/files/");
					File file = new File(realPath + "/"+ systemFileName);
					System.out.println("들어옴 2");
					System.out.println(file);
					if(file.exists() ){
						System.out.println("들어옴 3");
						if(file.delete()){
							System.out.println("들어옴 4");
							List<String> list = fileDAO.getNote_sysFileName(seq);
							System.out.println(list.size());
							if(list.size() != 0) {
								System.out.println("들어옴5");
								
								for(int i=0; i < list.size(); i++) {
									String Path = request.getServletContext().getRealPath("/files/");
									File file2 = new File(Path + "/"+ list.get(i));
									System.out.println(i+"번" + file2);
									if(file2.exists() ){
										System.out.println("존재");
										if(file2.delete()){
											System.out.println("삭제 성공");
										}
									}
								}
								
								

							}
						}else {
							
						}
						System.out.println("들어옴 6");
						int result = dao.deleteData(seq);
					}else{}

				}
				dst = "hollo.com";
			}else if(command.equals("/modify.tip")) {
				BoardDTO result = new BoardDTO();
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
				dst = "board/boardtip2.jsp";
			}else if(command.equals("/searchtitle.tip")) {
				String keyword = request.getParameter("keyword");
				String currentPageString = request.getParameter("currentPage");
				List<BoardDTO> result = new ArrayList<>();
				List<AdminFilesDTO> thumbnail = new ArrayList<>();
				int currentPage = 0;
				if(currentPageString == null){
					currentPage = 1;
				}else {
					currentPage = Integer.parseInt(currentPageString);
				}
				result = dao.getSearchData(keyword, currentPage*8-7, currentPage*8);
				String navi = dao.getKeywordNavi(currentPage, keyword);
				for (BoardDTO tmp : result) {
					String seq = tmp.getSeq();
					thumbnail.add(fileDAO.isExsitThum_sysFile(seq));
				}
				request.setAttribute("board", result);
				request.setAttribute("navi", navi);
				request.setAttribute("thumbnail", thumbnail);
				isRedirect = false;
				dst = "board/boardtip2.jsp";
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
