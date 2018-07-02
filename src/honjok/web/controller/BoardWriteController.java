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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import honjok.web.dao.AdminFileDAO;
import honjok.web.dao.BoardTipDAO;
import honjok.web.dto.AdminFilesDTO;
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
		System.out.println(command);
		//StringBuffer sb = new StringBuffer();
		//String line = null;
		String realPath = request.getServletContext().getRealPath("/files/");
		// getServletContext()
		File f = new File(realPath);
		if(!f.exists()){
			f.mkdir();
		}
		int maxSize = 1024 * 1024 * 100; // �ִ� ������
		String enc = "utf8"; // �ѱ�
		MultipartRequest mr = new MultipartRequest(request, realPath, maxSize, enc,
				new DefaultFileRenamePolicy());
		Enumeration<String> names = mr.getFileNames();
		boolean isRedirect = true;
		String dst = null;
		
		String title = mr.getParameter("title");
		String category = mr.getParameter("category");
		String subject = mr.getParameter("subject");
		String contents = mr.getParameter("summernote");
		//String contentsImg = mr.getParameter("contentsImg");
		/*List<>
		String[] splitImgName = contentsImg.split(".");

		while() {

		}
		 */
		String paramName = names.nextElement();
		String originalFileName = mr.getOriginalFileName(paramName);
		String systemFileName = mr.getFilesystemName(paramName);

		BoardTipDAO tipDAO = new BoardTipDAO();
		if(command.equals("/editor.tw")) {
			try {
				if(systemFileName != null && !(title.equals(""))) {
					String seq = tipDAO.getBoardSeq();
					System.out.println(seq);
					BoardDTO dto = new BoardDTO(seq, category, subject, title, contents);
					int result = tipDAO.insertData(dto);
					AdminFileDAO fileDAO = new AdminFileDAO();

					if(result > 0) {
						AdminFilesDTO fileDTO = new AdminFilesDTO(seq, category, subject, systemFileName, originalFileName);
						int fileResult = fileDAO.insertThumb_FileName(fileDTO);
						if(fileResult > 0) {
						}else {
						}
					}else {
					}
				}else {
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			dst = "hollo.com";
		}else if(command.equals("/notemodify.tw")) {
			try {
				if(systemFileName != null) {
					System.out.println("���� 2 ����");
					String seq = mr.getParameter("seq");
					System.out.println(seq);
					BoardDTO dto = new BoardDTO(seq, category, subject, title, contents);
					int result = tipDAO.updateData(dto);
					AdminFileDAO fileDAO = new AdminFileDAO();

					if(result > 0) {
						System.out.println("2��" + seq);
						AdminFilesDTO fileDTO = new AdminFilesDTO(seq, category, subject, systemFileName, originalFileName);
						int fileResult = fileDAO.updateThumb_FileName(fileDTO);
						if(fileResult > 0) {
						}else {}
					}else {}
				}else {}
			}catch(Exception e){
				e.printStackTrace();
			}
			
			dst = "hollo.com";
			isRedirect = false;
		}
		


		/*if(command.equals("/upload.tw")) {
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
		}*/
		//if(command.equals("/editor.tw")) {
		/*String title = mr.getParameter("title");
			System.out.println(title);
			String category = mr.getParameter("category");
			System.out.println(category);
			String subject = mr.getParameter("subject");
			System.out.println(subject);
			String contents = mr.getParameter("summernote");

			System.out.println(contents);*/
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

		/*if(category.equals("����")) {
				BoardTipDAO tipDAO = new BoardTipDAO();
				try {

						System.out.println("���� ����");
						String seq = tipDAO.getBoardSeq();
						System.out.println(seq);
						BoardDTO dto = new BoardDTO(seq, category, subject, title, contents, systemFileName, originalFileName);
						tipDAO.insertData(dto);


				} catch (Exception e) {
					e.printStackTrace();
				}
				dst = "hollo.com";
			}else if(category.equals("�丮")) {

			}
		 */
		//}

		if(isRedirect) {
			response.sendRedirect(dst);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher(dst);
			rd.forward(request, response);
		}

	}

}
