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

import honjok.web.dao.BoardFreeDAO;
import honjok.web.dao.BoardQnaDAO;
import honjok.web.dto.BoardFreeDTO;
import honjok.web.dto.BoardQnaDTO;

@WebServlet("*.qna")
public class BoardQnaController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isRedirect = true;
		String dst = null;

		request.setCharacterEncoding("utf8");

		try {
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();

			String command = requestURI.substring(contextPath.length());
			if(command.equals("/qnaView.qna")) {
				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");

				if(currentPageString == null){
					currentPage = 1;
				}else {
					currentPage = Integer.parseInt(currentPageString);
				}
				BoardQnaDAO dao = new BoardQnaDAO();
				List<BoardQnaDTO> result = dao.selectData(currentPage*10-9,currentPage*10);
				String navi = dao.getPageNavi(currentPage);

				request.setAttribute("navi", navi);
				request.setAttribute("result", result);

				isRedirect = false;
				dst = "community/qnaView.jsp";
			}else if(command.equals("/qnaWrite.qna")) {
				BoardQnaDAO dao = new BoardQnaDAO();
				BoardQnaDTO dto = new BoardQnaDTO();

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
				System.out.println(realPath);
				JSONObject json = new JSONObject();
				json.put("url", realPath);
				System.out.println(json.toJSONString());
				response.setCharacterEncoding("utf8");
				response.setContentType("application/json");
				response.getWriter().println(json.toJSONString());
				response.getWriter().flush();
				response.getWriter().close();
				
				String id = (String)request.getAttribute("loginId");
				String title = mr.getParameter("title");
				String writer = mr.getParameter("writer");
				String contents = mr.getParameter("contents");
				String writedate = mr.getParameter("writedate");
				String ip = request.getRemoteAddr();

				dto.setTitle(title);
				dto.setWriter(writer);
				dto.setContents(contents);
				dto.setWritedate(writedate);
				dto.setIp(ip);

				int result = dao.insertData(dto);
				
				request.setAttribute("result", result);
				isRedirect = false; 
				dst = "qnaResult.jsp";
			}else if(command.equals("/upload.qna")) {
				BoardQnaDAO dao = new BoardQnaDAO();
				BoardQnaDTO dto = new BoardQnaDTO();

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
				System.out.println(realPath);
				JSONObject json = new JSONObject();
				json.put("url", realPath);
				System.out.println(json.toJSONString());
				response.setCharacterEncoding("utf8");
				response.setContentType("application/json");
				response.getWriter().println(json.toJSONString());
				response.getWriter().flush();
				response.getWriter().close();
				return;
			}else if(command.equals("/BoardQnaController.qna")) {
				String no = request.getParameter("no");
				int seq = Integer.parseInt(no);

				BoardQnaDAO dao = new BoardQnaDAO();

				List<BoardQnaDTO> result = dao.readData(seq);

				request.setAttribute("result", result);
				isRedirect = false;
				dst = "community/articleView.jsp";
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
