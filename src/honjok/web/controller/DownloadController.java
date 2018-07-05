package honjok.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DownloadController
 */
@WebServlet("/DownloadController")
public class DownloadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public DownloadController() {
        super();

    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fileName = request.getParameter("fileName");
		String realPath = request.getServletContext().getRealPath("files");
		String fullPath = realPath + "/" + fileName;
		
		response.reset();
		response.setContentType("application/octet-stream");
		
		String encodedFileName = new String(fileName.getBytes("utf8"),"8859_1");
		response.setHeader("Content-Disposition", "attachment; filename="+encodedFileName);
		
		FileInputStream fis = new FileInputStream(fullPath);
		File targetFile = new File(fullPath);
		byte[] fileContents = new byte[(int)targetFile.length()];
		
		fis.read(fileContents);
		
		ServletOutputStream sos = response.getOutputStream();
		sos.write(fileContents);
		sos.flush();
		sos.close();
		fis.close();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
