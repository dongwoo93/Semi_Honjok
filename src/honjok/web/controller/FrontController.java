package honjok.web.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import honjok.web.beans.StatisticsData;
import honjok.web.dao.BoardLikeDAO;
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
				dst = "/community/index.jsp";	
				
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
				int update = 0;
				String boardseq = request.getParameter("boardno");
				String id = request.getParameter("memberid");
				BoardLikeDAO likeDao = new BoardLikeDAO();
				LikeDTO like = likeDao.SelectLike(boardseq, id);
				String likeStat = like.getLikeCheck();
				if(likeStat.equals("1")) {
					System.out.println("들어옴1");
					update = likeDao.UpdateLike(boardseq, id, "0");
				}else {
					System.out.println("들어옴2");
					update = likeDao.UpdateLike(boardseq, id, "1");
				}
				
				response.setCharacterEncoding("UTF-8");
				response.getWriter().println(update);
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
