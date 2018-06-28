package honjok.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/upload.img")
public class ThumbnailController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		//StringBuffer sb = new StringBuffer();
		//String line = null;
		String realPath = request.getServletContext().getRealPath("/files/");
		// getServletContext()
		System.out.println("realPath: " + realPath);
		File f = new File(realPath);
		//System.out.println(command);
		if(!f.exists()){
			f.mkdir();
		}
		int maxSize = 1024 * 1024 * 100; // 최대 사이즈
		String enc = "utf8"; // 한글

		MultipartRequest mr = new MultipartRequest(request, realPath, maxSize, enc,
				new DefaultFileRenamePolicy());
		Enumeration<String> files = mr.getFileNames();
		String file = files.nextElement();
		String originalFileName = mr.getOriginalFileName(file);
		String systemFileName =  mr.getFilesystemName(file);
		
		System.out.println(systemFileName);
		System.out.println(originalFileName);

		realPath = contextPath + "/files/" + systemFileName;
		//System.out.println(realPath);
		JSONObject json = new JSONObject();
		json.put("url", realPath);
		//System.out.println(json.toJSONString());
		response.setCharacterEncoding("utf8");
		response.setContentType("application/json");
		response.getWriter().println(json.toJSONString());
		response.getWriter().flush();
		response.getWriter().close();
		return;

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
