package honjok.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import honjok.web.beans.StatisticsData;
import honjok.web.dao.AdminFileDAO;
import honjok.web.dao.AdminLikeDAO;
import honjok.web.dao.BoardDAO;
import honjok.web.dao.BoardLikeDAO;
import honjok.web.dao.BoardTipDAO;
import honjok.web.dto.AdminFilesDTO;
import honjok.web.dto.AdminLikeDTO;
import honjok.web.dto.BoardDTO;
import honjok.web.dto.LikeDTO;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.com")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StatisticsData std = new StatisticsData();
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dst = null;
		request.setCharacterEncoding("UTF-8");
		try {
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());
		
			
			if(command.equals("/hollo.com")) {
				BoardTipDAO dao = new BoardTipDAO();
				AdminFileDAO fileDAO = new AdminFileDAO();
				List<BoardDTO> result = dao.selectLatestData();
				List<AdminFilesDTO> fileResult = fileDAO.getThum_sysFileName();
				request.setAttribute("result", result);
				request.setAttribute("thumbnail", fileResult);
				dst = "/community/index2.jsp";	
				
			}else if(command.equals("/data.com")) {
				JSONArray result = std.getOneTotal();
				JSONArray result2 = new JSONArray();
				response.setCharacterEncoding("UTF-8");
				response.setContentType("application/json");
				for(int i = 0; i<3; i++) {
					JSONObject tmp = (JSONObject) result.get(i);
					result2.add(tmp);					
				}
				response.getWriter().print(result2);
				response.getWriter().flush();
				response.getWriter().close();
				return;
			}else if(command.equals("/latest.com")) {
				
			}else if(command.equals("/like.com")) {
				int likeResult = 0;
				BoardDAO board = new BoardDAO();
				int update = 0;
				String boardseq = request.getParameter("boardno");
				String id = request.getParameter("memberid");
				int likeCount = board.selectLike(boardseq);
				
				BoardLikeDAO likeDao = new BoardLikeDAO();
				
				LikeDTO like = likeDao.SelectLike(boardseq, id);
				String likeStat = like.getLikeCheck();
				if(likeStat.equals("1")) {
					System.out.println("들어옴1");
					update = likeDao.UpdateLike(boardseq, id, "0");
					likeResult = likeCount - 1;
					board.UpdateLikeCount(boardseq, likeResult);
				}else {
					System.out.println("들어옴2");
					update = likeDao.UpdateLike(boardseq, id, "1");
					likeResult = likeCount + 1;
					board.UpdateLikeCount(boardseq, likeResult);
				}
				
				response.setCharacterEncoding("UTF-8");
				response.getWriter().println(likeResult);
				return;
			}else if(command.equals("/admin_like.com")) {
				int update = 0;
				int likeResult = 0;
				String boardseq = request.getParameter("boardno");
				String id = request.getParameter("memberid");
				AdminLikeDAO likeDAO = new AdminLikeDAO();
				int likeCount = likeDAO.selectLike(boardseq);
				AdminLikeDTO like = likeDAO.selectArticleLike(boardseq, id);
				String likeStat = like.getLike_check();
				if(likeStat.equals("1")) {
					System.out.println("들어옴1");
					update = likeDAO.UpdateLike(boardseq, id, "0");
					likeResult = likeCount - 1;
					likeDAO.updateLikeCount(boardseq, likeResult);
				}else {
					System.out.println("들어옴2");
					update = likeDAO.UpdateLike(boardseq, id, "1");
					likeResult = likeCount + 1;
					likeDAO.updateLikeCount(boardseq, likeResult);
				}
				
				response.setCharacterEncoding("UTF-8");
				response.getWriter().println(likeResult);
				return;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getServletContext().getRequestDispatcher(dst);
		rd.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
