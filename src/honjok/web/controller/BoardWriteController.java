package honjok.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import honjok.web.dao.BoardTipDAO;
import honjok.web.dto.BoardDTO;


@WebServlet("*.tw")
public class BoardWriteController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		//StringBuffer sb = new StringBuffer();
		//String line = null;
		String realPath = request.getServletContext().getRealPath("/files/");
		// getServletContext()
		File f = new File(realPath);
		System.out.println(command);
		if(!f.exists()){
			f.mkdir();
		}
		int maxSize = 1024 * 1024 * 100; // 최대 사이즈
		String enc = "utf8"; // 한글

		MultipartRequest mr = new MultipartRequest(request, realPath, maxSize, enc,
				new DefaultFileRenamePolicy());
		Enumeration<String> names = mr.getFileNames();
		String originalFileName = null;
		String systemFileName = null;
		while(names.hasMoreElements()) {
			String paramName = names.nextElement();
			originalFileName = mr.getOriginalFileName(paramName);
			systemFileName = mr.getFilesystemName(paramName);
		}

		System.out.println(systemFileName);
		System.out.println(originalFileName);
		boolean isRedirect = true;
		String dst = null;

		if(command.equals("/upload.tw")) {
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
		}
		else if(command.equals("/editor.tw")) {
			String title = mr.getParameter("title");
			//System.out.println(title);
			String category = mr.getParameter("category");
			//System.out.println(category);
			String subject = mr.getParameter("subject");
			//System.out.println(subject);
			String contents = mr.getParameter("summernote");

			//System.out.println(contents);
			//BoardWriteDAO dao = new BoardWriteDAO();

			/*try {
			BufferedReader reader = request.getReader();
			while ((line = reader.readLine()) != null)
				sb.append(line);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}*/

			//String contents = sb.toString();
			//System.out.println(contents);

			if(category.equals("꿀팁")) {
				BoardTipDAO tipDAO = new BoardTipDAO();
				try {
					if(originalFileName != null) {
						String seq = tipDAO.getBoardSeq();
						BoardDTO dto = new BoardDTO(seq, category, subject, title, contents, systemFileName, originalFileName);
						tipDAO.insertData(dto);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				dst = "hollo.com";
			}else if(category.equals("요리")) {

			}

		}

		if(isRedirect) {
			response.sendRedirect(dst);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher(dst);
			rd.forward(request, response);
		}

	}

}
