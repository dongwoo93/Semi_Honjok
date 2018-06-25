package honjok.web.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import honjok.web.dao.BoardWriteDAO;


@WebServlet("/boardWrite")
public class BoardWriteController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		//StringBuffer sb = new StringBuffer();
		//String line = null;
		String realPath = request.getServletContext().getRealPath("/files/");
		// getServletContext() 
		File f = new File(realPath);

		if(!f.exists()){
			f.mkdir();
		}
		int maxSize = 1024 * 1024 * 100; // 최대 사이즈
		String enc = "utf8"; // 한글

		MultipartRequest mr = new MultipartRequest(request, realPath, maxSize, enc,
				new DefaultFileRenamePolicy());

		String systemFileName = mr.getFilesystemName("file");
		String originalFileName = mr.getOriginalFileName("file");

		System.out.println(systemFileName);
		System.out.println(originalFileName);
		boolean isRedirect = true;
		String dst = null;
		String title = mr.getParameter("title");
		System.out.println(title);
		String category = mr.getParameter("category");
		System.out.println(category);
		String subject = mr.getParameter("subject");
		System.out.println(subject);
		String contents = mr.getParameter("summernote");

		System.out.println(contents);
		BoardWriteDAO dao = new BoardWriteDAO();
		/*try {
			BufferedReader reader = request.getReader();
			while ((line = reader.readLine()) != null)
				sb.append(line);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}*/

		//String contents = sb.toString();
		//System.out.println(contents);
		try {
			dao.insertInfo(category, subject, title, contents, systemFileName, originalFileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		isRedirect = false; 
		dst = "index.jsp";

		if(isRedirect) {
			response.sendRedirect(dst);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher(dst);
			rd.forward(request, response);
		}

	}

}
