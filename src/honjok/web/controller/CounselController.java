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
import honjok.web.dao.CounselDAO;
import honjok.web.dto.BoardFreeDTO;
import honjok.web.dto.CounselDTO;

/**
 * Servlet implementation class CounselController
 */
@WebServlet("*.coun")
public class CounselController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isRedirect = true;
		String dst = null;

		request.setCharacterEncoding("utf8");

		try {
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();

			String command = requestURI.substring(contextPath.length());

			if(command.equals("/test.coun")) {
				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");

				if(currentPageString == null){
					currentPage = 1;
				}else {
					currentPage = Integer.parseInt(currentPageString);
				}
				CounselDAO dao = new CounselDAO();
				List<CounselDTO> result = dao.selectData(currentPage*10-9,currentPage*10);
				String navi = dao.getPageNavi(currentPage);

				request.setAttribute("navi", navi);
				request.setAttribute("result", result);

				isRedirect = false;
				dst = "community/counselView.jsp";

			}else if(command.equals("/counselView.coun")) {
				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");

				if(currentPageString == null){
					currentPage = 1;
				}else {
					currentPage = Integer.parseInt(currentPageString);
				}
				CounselDAO dao = new CounselDAO();
				List<CounselDTO> result = dao.selectData(currentPage*10-9,currentPage*10);
				String navi = dao.getPageNavi(currentPage);

				request.setAttribute("navi", navi);
				request.setAttribute("result", result);

				isRedirect = false;
				dst = "community/counselView.jsp";
			}else if(command.equals("/counselWrite.coun")) {
				CounselDAO dao = new CounselDAO();
				CounselDTO dto = new CounselDTO();

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

				isRedirect = false; 
				dst = "counselResult.jsp";
			}else if(command.equals("/ajax01.coun")) {
				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");

				if(currentPageString == null){
					currentPage = 1;
				}else {
					currentPage = Integer.parseInt(currentPageString);
				}
				CounselDAO dao = new CounselDAO();
				List<CounselDTO> result = dao.selectHeader1Data(currentPage*10-9,currentPage*10);
				String navi = dao.getPageNavi(currentPage);

				request.setAttribute("navi", navi);
				request.setAttribute("result", result);

				isRedirect = false;
				dst = "community/counselView.jsp";

			}else if(command.equals("/ajax02.coun")) {
				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");

				if(currentPageString == null){
					currentPage = 1;
				}else {
					currentPage = Integer.parseInt(currentPageString);
				}
				CounselDAO dao = new CounselDAO();
				List<CounselDTO> result = dao.selectHeader2Data(currentPage*10-9,currentPage*10);

				request.setAttribute("result", result);
				String navi = dao.getPageNavi(currentPage);

				request.setAttribute("navi", navi);
				isRedirect = false;
				dst = "community/counselView.jsp";
			}else if(command.equals("/ajax03.coun")) {
				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");

				if(currentPageString == null){
					currentPage = 1;
				}else {
					currentPage = Integer.parseInt(currentPageString);
				}
				CounselDAO dao = new CounselDAO();
				List<CounselDTO> result = dao.selectHeader3Data(currentPage*10-9,currentPage*10);

				request.setAttribute("result", result);
				String navi = dao.getPageNavi(currentPage);

				request.setAttribute("navi", navi);
				isRedirect = false;
				dst = "community/counselView.jsp";
			}else if(command.equals("/upload.coun")) {
				CounselDAO dao = new CounselDAO();
				CounselDTO dto = new CounselDTO();

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
			}else if(command.equals("/CounselController.coun")) {
				String no = request.getParameter("no");
				int seq = Integer.parseInt(no);

				CounselDAO dao = new CounselDAO();
				List<CounselDTO> result = dao.readData(seq);

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
		doGet(request, response);
	}

}
