package honjok.web.controller;

import java.io.File;
import java.io.IOException;
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

import honjok.web.dao.BoardUserTipDAO;
import honjok.web.dao.BoardUserTipDAO;
import honjok.web.dto.BoardUserDTO;
import honjok.web.dto.CommentFreeDTO;

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
//			String id = (String)request.getSession().getAttribute("loginId");
			String id = "È÷¿À½º";
			String count = request.getParameter("count");

			if(command.equals("/test.utip")) {
				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");

				if(currentPageString == null){
					currentPage = 1;
				}else {
					currentPage = Integer.parseInt(currentPageString);
				}
				BoardUserTipDAO dao = new BoardUserTipDAO();
				List<BoardUserDTO> result = dao.selectData(currentPage*10-9,currentPage*10);
				String navi = dao.getPageNavi(currentPage);

				request.setAttribute("navi", navi);
				request.setAttribute("result", result);

				isRedirect = false;
				dst = "community/userTipView.jsp";
			}else if(command.equals("/userTipView.UserTip")) {
				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");

				if(currentPageString == null){
					currentPage = 1;
				}else {
					currentPage = Integer.parseInt(currentPageString);
				}
				BoardUserTipDAO dao = new BoardUserTipDAO();
				List<BoardUserDTO> result = dao.selectData(currentPage*10-9,currentPage*10);
				String navi = dao.getPageNavi(currentPage);

				request.setAttribute("navi", navi);
				request.setAttribute("result", result);

				isRedirect = false;
				dst = "community/UserTipboardView.jsp";
			}else if(command.equals("/userTipWrite.UserTip")) {
				BoardUserTipDAO dao = new BoardUserTipDAO();
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
				dst = "userTipResult.jsp";
			}else if(command.equals("/ajax01.utip")) {
				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");

				if(currentPageString == null){
					currentPage = 1;
				}else {
					currentPage = Integer.parseInt(currentPageString);
				}
				BoardUserTipDAO dao = new BoardUserTipDAO();
				List<BoardUserDTO> result = dao.selectHeader1Data(currentPage*10-9,currentPage*10);
				String navi = dao.getPageNavi(currentPage);

				request.setAttribute("navi", navi);
				request.setAttribute("result", result);

				isRedirect = false;
				dst = "community/userTipboardView.jsp";
			}else if(command.equals("/ajax02.utip")) {
				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");

				if(currentPageString == null){
					currentPage = 1;
				}else {
					currentPage = Integer.parseInt(currentPageString);
				}
				BoardUserTipDAO dao = new BoardUserTipDAO();
				List<BoardUserDTO> result = dao.selectHeader2Data(currentPage*10-9,currentPage*10);
				String navi = dao.getPageNavi(currentPage);

				request.setAttribute("navi", navi);
				request.setAttribute("result", result);

				isRedirect = false;
				dst = "community/userTipboardView.jsp";
			}else if(command.equals("/ajax03.utip")) {
				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");

				if(currentPageString == null){
					currentPage = 1;
				}else {
					currentPage = Integer.parseInt(currentPageString);
				}
				BoardUserTipDAO dao = new BoardUserTipDAO();
				List<BoardUserDTO> result = dao.selectHeader3Data(currentPage*10-9,currentPage*10);
				String navi = dao.getPageNavi(currentPage);

				request.setAttribute("navi", navi);
				request.setAttribute("result", result);

				isRedirect = false;
				dst = "community/userTipboardView.jsp";
			}else if(command.equals("/Board_Controller.freeb")) {
				String no = request.getParameter("no");
				int seq = Integer.parseInt(no);

				BoardUserTipDAO dao = new BoardUserTipDAO();
				List<BoardUserDTO> result = dao.readData(seq);

				if (!id.equals(result.get(0).getWriter())) {
					int viewCount = Integer.parseInt(count) + 1;
					dao.UpdateViewCount(seq, viewCount);
				}

				request.setAttribute("result", result);
				request.setAttribute("count", count);
				isRedirect = false;
				dst = "community/articleView.jsp";
			}else if(command.equals("/upload.freeb")) {
				BoardUserTipDAO dao = new BoardUserTipDAO();
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
				String no = request.getParameter("no");
				int seq = Integer.parseInt(no);

				BoardUserTipDAO dao = new BoardUserTipDAO();
				CommentFreeDTO dto = new CommentFreeDTO();

				String boardseq = request.getParameter("board_free_seq");
				int Boardseq = Integer.parseInt(boardseq);
				String text = request.getParameter("commu_free_text");
				String ip = request.getRemoteAddr();

				dto.setBoard_free_seq(Boardseq);
				dto.setCommu_free_text(text);
				dto.setFree_ip(ip);

				int result = dao.insertComment(dto);

				request.setAttribute("result", result);
				isRedirect = false;
				dst = "community/articleView.jsp";
			}else if(command.equals("/fix.freeb")) {

			}else if(command.equals("/delete.freeb")) {

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
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
