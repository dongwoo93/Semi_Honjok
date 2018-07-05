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

@WebServlet("*.img")
public class ContentImgController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());

		if(command.equals("/upload.img")) {
			//StringBuffer sb = new StringBuffer();
			//String line = null;
			String realPath = request.getServletContext().getRealPath("/files/");
			// getServletContext()
			//System.out.println("ó�� realPath: " + realPath);
			File f = new File(realPath);
			if(!f.exists()){
				f.mkdir();
			}
			int maxSize = 1024 * 1024 * 100; // �ִ� ������
			String enc = "utf8"; // �ѱ�

			MultipartRequest mr = new MultipartRequest(request, realPath, maxSize, enc, new DefaultFileRenamePolicy());
			Enumeration<String> files = mr.getFileNames();
			String file = files.nextElement();
			String originalFileName = mr.getOriginalFileName(file);
			String systemFileName =  mr.getFilesystemName(file);

			realPath = contextPath + "/files/" + systemFileName;
			//System.out.println("contextPath: " + contextPath);
			//System.out.println("�����н�2: " + realPath);
			JSONObject json = new JSONObject();
			System.out.println("file: " + systemFileName);
			json.put("url", realPath);
			json.put("systemFileName", systemFileName);
			response.setCharacterEncoding("utf8");
			response.setContentType("application/json");
			response.getWriter().println(json.toJSONString());
			response.getWriter().flush();
			response.getWriter().close();
			return;
		}else if(command.equals("/deleteImg.img")) {
			String src = request.getParameter("src");
			//System.out.println(src);
			// String fileName
			String realPath = request.getServletContext().getRealPath("/files/");
			// getServletContext()
			File f = new File(realPath);
			File file = new File(f + "/" + src);
			//System.out.println(file);

			if(file.exists() ){
				if(file.delete()){
					System.out.println("���ϻ��� ����");
					//int result = dao.deleteData(seq);
				}
			}else{
				System.out.println("������ �������� �ʽ��ϴ�.");
			}
			return;
		}
	}
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGet(request, response);
		}

	}
