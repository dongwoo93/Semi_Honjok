package honjok.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import honjok.web.dao.BoardCommentDAO;
import honjok.web.dao.BoardDAO;
import honjok.web.dao.BoardLikeDAO;
import honjok.web.dao.UserFilesDAO;
import honjok.web.dto.BoardCommentDTO;
import honjok.web.dto.BoardUserDTO;
import honjok.web.dto.LikeDTO;
import honjok.web.dto.UserFilesDTO;

@WebServlet("*.freeb")
public class Board_Controller extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isRedirect = true;
		String dst = null;

		request.setCharacterEncoding("utf8");

		try {
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());
//			String id = (String)request.getSession().getAttribute("loginId");

            String count = request.getParameter("count");
			
			if(command.equals("/hontalkView.freeb")){
	            BoardDAO dao = new BoardDAO();
	            
	            List<BoardUserDTO> free = dao.selectFree();
	            List<BoardUserDTO> qna = dao.selectQna();
	            List<BoardUserDTO> counsel = dao.selectCounsel();
	            List<BoardUserDTO> tip = dao.selectTip();
	            List<BoardUserDTO> best = dao.selectBest();
	            
	            request.setAttribute("free", free);
	            request.setAttribute("qna", qna);
	            request.setAttribute("counsel", counsel);
	            request.setAttribute("tip", tip);
	            request.setAttribute("best", best);

	            isRedirect=false;
	            dst = "/community/hontalkView2.jsp";
	            
			}
			else if(command.equals("/boardView.freeb")) {
				String id = (String) request.getSession().getAttribute("loginId");
				if (id != null) {
					
				}else {
					id = "nonmember";
				}
				String seq = request.getParameter("no");
				String category = request.getParameter("cat");
				String header = request.getParameter("head");
				List<BoardUserDTO> result = new ArrayList<>();
				String navi;
				BoardDAO dao = new BoardDAO();
				if(category.equals("best")) {

						int currentPage = 0;
						String currentPageString = request.getParameter("currentPage");

						if(currentPageString == null){
							currentPage = 1;
						}else {
							currentPage = Integer.parseInt(currentPageString);
						}
						
						result = dao.selectBest2(currentPage*10-9,currentPage*10);
						navi = dao.getPageBest(currentPage);
					
					
				}else {
					if(header!= null) {
						int currentPage = 0;
						String currentPageString = request.getParameter("currentPage");

						if(currentPageString == null){
							currentPage = 1;
						}else {
							currentPage = Integer.parseInt(currentPageString);
						}
						
						result = dao.selectData2(currentPage*10-9,currentPage*10, category, header);
						navi = dao.getPageNavi2(currentPage, category, header);
					}else {
						int currentPage = 0;
						String currentPageString = request.getParameter("currentPage");

						if(currentPageString == null){
							currentPage = 1;
						}else {
							currentPage = Integer.parseInt(currentPageString);
						}
						
						result = dao.selectData(currentPage*10-9,currentPage*10, category);
						navi = dao.getPageNavi(currentPage, category);
					}
				}
				
				List<BoardUserDTO> result2 = new ArrayList<>();
				result2 = dao.selectNotice();
				
				request.setAttribute("id", id);
				request.setAttribute("cat", category);
				request.setAttribute("navi", navi);
				request.setAttribute("result", result);
				request.setAttribute("result2", result2);

				isRedirect = false;
				dst = "community/freeboardView2.jsp";
				
			}else if(command.equals("/writecategory.freeb")) {
				String category = request.getParameter("cat");
				
				if(category.equals("free")) {
					request.setAttribute("cat", category);
				}else if(category.equals("coun")) {
					request.setAttribute("cat", category);
				}else if(category.equals("tip")) {
					request.setAttribute("cat", category);
				}else {
					request.setAttribute("cat", category);
				}
				
				isRedirect = false;
				dst = "community/freeboardWrite2.jsp";
				
			}else if(command.equals("/boardWrite.freeb")) {
				String id = (String)request.getSession().getAttribute("loginId");
				String realPath = request.getServletContext().getRealPath("/files/");
				
				File f = new File(realPath);
    			if(!f.exists()) {
    				f.mkdir();
    			}
    			
    			int maxSize = 1024 * 1024 * 100;
    			String enc = "UTF-8";
    			MultipartRequest mr = new MultipartRequest(request, realPath, maxSize, enc, new DefaultFileRenamePolicy());
    			Enumeration<String> names = mr.getFileNames();
    			
    			int result2 = 0;
    			

    			String title = mr.getParameter("title");
    			String category = mr.getParameter("hcat");
    			String contents = mr.getParameter("summernote");
    			String header = mr.getParameter("header");
    			String ip = request.getRemoteAddr();
    			String catseq = "0";
				
    			BoardDAO board = new BoardDAO();
    			UserFilesDAO file = new UserFilesDAO();
    			String postSeq = board.getBoardSeq();
    			
    			if(category.equals("free")) {
    				catseq = board.getFreeSeq();
    			}else if(category.equals("qna")) {
    				catseq = board.getQnaSeq();
    			}else if(category.equals("coun")) {
    				catseq = board.getCounSeq();
    			}else if(category.equals("tip")) {
    				catseq = board.getTipSeq();
    			}

    			BoardUserDTO boDto = new BoardUserDTO(Integer.parseInt(postSeq), Integer.parseInt(catseq), category, title, id, contents, header, ip);
    			
    			
    			
    			
    			int result = board.insertData(boDto);
    			
    			while(names.hasMoreElements()) {
    				String paramName = names.nextElement();
    				String originalName = mr.getOriginalFileName(paramName);
    				String systemName = mr.getFilesystemName(paramName);
    				
    				if(originalName != null) {
    					result2 = file.uploadFile(new UserFilesDTO(postSeq, originalName, systemName));	
    				}
    			}
    			
    			
    				isRedirect = true;
    				dst = "boardView.freeb?cat="+category;
    			
    				
    			
				
				
			}else if(command.equals("/Board_Controller.freeb")) {
				String no = request.getParameter("no");
				String id = (String)request.getSession().getAttribute("loginId");
				BoardLikeDAO like = new BoardLikeDAO();
				if(id != null) {
					try {
						boolean result = like.LikeExist(no, id);
						if(!result) {
							int insertLike = like.insertData(no, id);
						}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					LikeDTO likeDto = like.SelectLike(no, id);
					String likeStat = likeDto.getLikeCheck();
					request.setAttribute("likeStat", likeStat);
					
				}else {
					id = "nonmember";
					request.setAttribute("likeStat", "0");
				}
				request.setAttribute("id", id);
				int seq = Integer.parseInt(no);

				BoardDAO dao = new BoardDAO();
				List<BoardUserDTO> result = dao.readData(seq);
				BoardCommentDAO comment = new BoardCommentDAO();
				List<BoardCommentDTO> result2 = comment.selectComment(seq);
				UserFilesDAO fDao = new UserFilesDAO();
				List<UserFilesDTO> files = new ArrayList<>();
				files = fDao.selectFiles(no);
				
				if (!id.equals(result.get(0).getWriter())) {
	                int viewCount = Integer.parseInt(count) + 1;
	                dao.UpdateViewCount(seq, viewCount);
	             }

				request.setAttribute("result", result);
				request.setAttribute("result2", result2);
				request.setAttribute("no", no);
				request.setAttribute("count", count);
				request.setAttribute("file", files);
				
				isRedirect = false;
				dst = "community/articleView2.jsp";
			}else if(command.equals("/upload.freeb")) {
				BoardDAO dao = new BoardDAO();
				BoardUserDTO dto = new BoardUserDTO();

				String realPath = request.getServletContext().getRealPath("/files/");

				File f = new File(realPath);
				if(!f.exists()) {
					f.mkdir();
				}
				int maxSize = 1024 * 1024 * 100;
				String enc = "utf8";

				MultipartRequest mr = new MultipartRequest(request, realPath, maxSize, enc, new DefaultFileRenamePolicy());
				Enumeration<String> files = mr.getFileNames();
				String originalFileName = null;
				String systemFileName = null;
				while(files.hasMoreElements()) {
					String paramName = files.nextElement();
					originalFileName = mr.getOriginalFileName(paramName);
					systemFileName = mr.getFilesystemName(paramName);
				}
				realPath = contextPath + "/files/" + systemFileName;
				
				JSONObject json = new JSONObject();
				json.put("url", realPath);

				response.setCharacterEncoding("utf8");
				response.setContentType("application/json");
				response.getWriter().println(json.toJSONString());
				response.getWriter().flush();
				response.getWriter().close();
				return;
			}else if(command.equals("/comment.freeb")) {
				
				
				BoardCommentDAO dao = new BoardCommentDAO();
				
				String boardseq = request.getParameter("no");
				String content = request.getParameter("comment");
				String ip = request.getRemoteAddr();
				String writer = (String)request.getSession().getAttribute("loginId");
				
				BoardCommentDTO dto = new BoardCommentDTO(boardseq, writer, content, ip);
				
				int result = dao.insertComment(dto);
				
				request.setAttribute("result", result);
				
				isRedirect = false;
				dst = "Board_Controller.freeb?no="+boardseq+"&count="+count;		
			}else if(command.equals("/fix.freeb")) {
				String seq = request.getParameter("no");
				int articleseq = Integer.parseInt(seq);
				
				BoardDAO dao = new BoardDAO();
				
				BoardUserDTO result = dao.modifyRead(articleseq);
				request.setAttribute("result", result);
				request.setAttribute("no", seq);
				isRedirect = false;
				dst = "community/usermodify.jsp";
			}else if(command.equals("/fixcomplete.freeb")) {
				String id = (String)request.getSession().getAttribute("loginId");
				String realPath = request.getServletContext().getRealPath("/files/");
				
				File f = new File(realPath);
    			if(!f.exists()) {
    				f.mkdir();
    			}
    			
    			int maxSize = 1024 * 1024 * 100;
    			String enc = "UTF-8";
    			MultipartRequest mr = new MultipartRequest(request, realPath, maxSize, enc, new DefaultFileRenamePolicy());
    			Enumeration<String> names = mr.getFileNames();
    			
    			int result2 = 0;
    			
    			int seq = Integer.parseInt(mr.getParameter("hiddenseq"));
    			String title = mr.getParameter("titlemodi");
    			String contents = mr.getParameter("summernote");
    			String header = mr.getParameter("header");
    			String viewCount = mr.getParameter("hiddencount");
    			BoardUserDTO userDto = new BoardUserDTO(seq, title, contents, header);
				
    			BoardDAO board = new BoardDAO();
    			UserFilesDAO file = new UserFilesDAO();
    			
    			int result = board.modifyData(userDto);
    			
    			while(names.hasMoreElements()) {
    				String paramName = names.nextElement();
    				String originalName = mr.getOriginalFileName(paramName);
    				String systemName = mr.getFilesystemName(paramName);
    				
    				if(originalName != null) {
    					result2 = file.uploadFile(new UserFilesDTO(Integer.toString(seq), originalName, systemName));	
    				}
    			}
				
				
				isRedirect = false;
				dst = "Board_Controller.freeb?no="+Integer.toString(seq)+"&count="+viewCount;
			}else if(command.equals("/delete.freeb")) {
				String articleseq = request.getParameter("no");
				String category = request.getParameter("cat");
				int seq = Integer.parseInt(articleseq);
				BoardDAO dao = new BoardDAO();
				BoardUserDTO dto = new BoardUserDTO();
				

				
//				List<BoardUserDTO> free = dao.selectFree();
//	            List<BoardUserDTO> qna = dao.selectQna();
//	            List<BoardUserDTO> counsel = dao.selectCounsel();
//	            List<BoardUserDTO> tip = dao.selectTip();
	            
				int result = dao.deleteData(seq);
//				request.setAttribute("result", result);
//				request.setAttribute("free", free);
//	            request.setAttribute("qna", qna);
//	            request.setAttribute("counsel", counsel);
//	            request.setAttribute("tip", tip);
				isRedirect = false;
				dst = "boardView.freeb?cat="+category;
			}else if(command.equals("/delete_comment.freeb")) {
				String no = request.getParameter("no");
				String comSeq = request.getParameter("comSeq");
				String viewCountStr = request.getParameter("count");
				int viewCount = Integer.parseInt(viewCountStr) - 1;
				BoardCommentDAO dao = new BoardCommentDAO();
				int result = dao.deleteComment(Integer.parseInt(comSeq));
				if(result > 0) {
					dst = "Board_Controller.freeb?no="+no+"&count="+viewCount;
				}
			}else if(command.equals("/search.freeb")) {
				String select = request.getParameter("select");
				String search = request.getParameter("search");
				String category = request.getParameter("scat");
				List<BoardUserDTO> result = new ArrayList<>();
				String navi;
				
				BoardDAO dao = new BoardDAO();
				
				if(select.equals("title")) {
					int currentPage = 0;
					String currentPageString = request.getParameter("currentPage");

					if(currentPageString == null){
						currentPage = 1;
					}else {
						currentPage = Integer.parseInt(currentPageString);
					}
					
					result = dao.searchDataTitle(search, category, currentPage*10-9, currentPage*10);
					navi = dao.getPageNaviTitle(search, currentPage, category);
				}else if(select.equals("writer")) {
					int currentPage = 0;
					String currentPageString = request.getParameter("currentPage");

					if(currentPageString == null){
						currentPage = 1;
					}else {
						currentPage = Integer.parseInt(currentPageString);
					}
					result = dao.searchDataWriter(search, category, currentPage*10-9,currentPage*10);
					navi = dao.getPageNaviWriter(search, currentPage, category);
				}else {
					int currentPage = 0;
					String currentPageString = request.getParameter("currentPage");

					if(currentPageString == null) {
						currentPage = 1;
					}else {
						currentPage = Integer.parseInt(currentPageString);
					}
					result = dao.searchDataContents(search, category, currentPage*10-9,currentPage*10);
					navi = dao.getPageNaviContents(search, currentPage, category);
				}
				request.setAttribute("cat", category);
				request.setAttribute("result", result);
				request.setAttribute("navi", navi);
				
				
				isRedirect = false;
				dst = "community/freeboardView2.jsp";
			}else if(command.equals("/admin_del_board.freeb")) {
				BoardDAO dao = new BoardDAO();
				String delList = request.getParameter("delList");
				String category = request.getParameter("cat");
				String[] delArr = delList.split(",", -1);
				for(int i = 0; i < delArr.length; i++) {
					dao.deleteData(Integer.parseInt(delArr[i]));
				}
				
				dst = "boardView.freeb?cat="+category;
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
