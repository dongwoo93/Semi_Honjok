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
import honjok.web.dto.BoardCommentDTO;
import honjok.web.dto.BoardUserDTO;

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
			String id = "히오스";
            String count = request.getParameter("count");
			
			if(command.equals("/hontalkView.freeb")){
	            BoardDAO dao = new BoardDAO();
	            
	            List<BoardUserDTO> free = dao.selectFree();
	            List<BoardUserDTO> qna = dao.selectQna();
	            List<BoardUserDTO> counsel = dao.selectCounsel();
	            List<BoardUserDTO> tip = dao.selectTip();
	            
	            request.setAttribute("free", free);
	            request.setAttribute("qna", qna);
	            request.setAttribute("counsel", counsel);
	            request.setAttribute("tip", tip);

	            isRedirect=false;
	            dst = "/community/hontalkView.jsp";
	            
			}
			else if(command.equals("/boardView.freeb")) {
				String category = request.getParameter("cat");
				String header = request.getParameter("head");
				List<BoardUserDTO> result = new ArrayList<>();
				String navi;
				if(header!= null) {
					int currentPage = 0;
					String currentPageString = request.getParameter("currentPage");

					if(currentPageString == null){
						currentPage = 1;
					}else {
						currentPage = Integer.parseInt(currentPageString);
					}
					BoardDAO dao = new BoardDAO();
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
					BoardDAO dao = new BoardDAO();
					result = dao.selectData(currentPage*10-9,currentPage*10, category);
					navi = dao.getPageNavi(currentPage, category);
				}
				
				System.out.println(result);
				request.setAttribute("cat", category);
				request.setAttribute("navi", navi);
				request.setAttribute("result", result);

				isRedirect = false;
				dst = "community/freeboardView.jsp";
				
			}else if(command.equals("/freeboardWrite.freeb")) {
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
				
				String title = mr.getParameter("title");
				String writer = mr.getParameter("writer");
				String contents = mr.getParameter("contents");
				String header = mr.getParameter("header");
				String writedate = mr.getParameter("writedate");
				String ip = request.getRemoteAddr();

				dto.setTitle(title);
				dto.setWriter(writer);
				dto.setContents(contents);
				dto.setHeader(header);
				dto.setWritedate(writedate);
				dto.setIp(ip);
				
				int result = dao.insertData(dto);
				
				request.setAttribute("result", result);
				isRedirect = false; 
				dst = "freeboardResult.jsp";
			}else if(command.equals("/Board_Controller.freeb")) {
				String no = request.getParameter("no");
				int seq = Integer.parseInt(no);

				BoardDAO dao = new BoardDAO();
				List<BoardUserDTO> result = dao.readData(seq);
				BoardCommentDAO comment = new BoardCommentDAO();
				List<BoardCommentDTO> result2 = comment.selectComment(seq);
				
				if (!id.equals(result.get(0).getWriter())) {
	                int viewCount = Integer.parseInt(count) + 1;
	                dao.UpdateViewCount(seq, viewCount);
	             }
				
				request.setAttribute("result", result);
				request.setAttribute("result2", result2);
				request.setAttribute("no", no);
				System.out.println("제목 :" + result.get(0).getTitle());
				request.setAttribute("count", count);
				isRedirect = false;
				dst = "community/articleView.jsp";
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
				String writer = "끼욧";
				
				BoardCommentDTO dto = new BoardCommentDTO(boardseq, writer, content, ip);
				
				int result = dao.insertComment(dto);
				
				isRedirect = false;
				dst = "Board_Controller.freeb?no="+boardseq+"&count="+count;		
			}else if(command.equals("/fix.freeb")) {
				String seq = request.getParameter("no");
				int articleseq = Integer.parseInt(seq);
				
				BoardDAO dao = new BoardDAO();
				
				BoardUserDTO result = dao.modifyRead(articleseq);
				request.setAttribute("result", result);
				isRedirect = false;
				dst = "community/usermodify.jsp";
			}else if(command.equals("/fixcomplete.freeb")) {
				BoardDAO dao = new BoardDAO();
				BoardUserDTO dto = new BoardUserDTO();
				
				String article_seq = request.getParameter("seq");
				int articleseq = Integer.parseInt(article_seq);
				String categoryseq = request.getParameter("cat_seq");
				int cat_seq = Integer.parseInt(categoryseq);
				
				String header = request.getParameter("header");
				String title = request.getParameter("title");
				String contents = request.getParameter("contents");
				String category = request.getParameter("category");
				
				dto.setSeq(articleseq);
				dto.setCat_seq(cat_seq);
				dto.setHeader(header);
				dto.setTitle(title);
				dto.setContents(contents);
				dto.setCategory(category);
				
				int result = dao.modifyData(dto);
				request.setAttribute("result", result);
				isRedirect = false;
				dst = "community/modifyResult";
			}else if(command.equals("/delete.freeb")) {
				String articleseq = request.getParameter("seq");
				int seq = Integer.parseInt(articleseq);
				
				BoardDAO dao = new BoardDAO();
				BoardUserDTO dto = new BoardUserDTO();
				
				int result = dao.deleteData(seq);
				request.setAttribute("result", result);
				isRedirect = false;
				dst = "community/freeboardView.jsp";
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		if(isRedirect) {

		}else {

			RequestDispatcher rd = request.getRequestDispatcher(dst);
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
