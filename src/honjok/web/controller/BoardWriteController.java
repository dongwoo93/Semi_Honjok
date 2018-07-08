package honjok.web.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import honjok.web.dao.AdminFileDAO;
import honjok.web.dao.BoardTipDAO;
import honjok.web.dao.MapDAO;
import honjok.web.dto.AdminFilesDTO;
import honjok.web.dto.BoardDTO;
import honjok.web.dto.MapDTO;


@WebServlet("*.tw")
public class BoardWriteController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		//String line = null;
		String realPath = request.getServletContext().getRealPath("/files/");
		// getServletContext()
		File f = new File(realPath);
		if(!f.exists()){
			f.mkdir();
		}
		int maxSize = 1024 * 1024 * 100;
		String enc = "utf8";
		MultipartRequest mr = new MultipartRequest(request, realPath, maxSize, enc,
				new DefaultFileRenamePolicy());
		Enumeration<String> names = mr.getFileNames();
		boolean isRedirect = true;
		String dst = null;
		String title = mr.getParameter("title");
		String category = mr.getParameter("category");
		String subject = mr.getParameter("subject");
		String contents = mr.getParameter("summernote");
		String stJson = mr.getParameter("contentsImg");
		JSONParser paser = new JSONParser();
		JSONObject jObj = new JSONObject();
		String[] fileList = null;
		Object obj;

		String paramName = names.nextElement();
		String originalFileName = mr.getOriginalFileName(paramName);
		String systemFileName = mr.getFilesystemName(paramName);

		BoardTipDAO tipDAO = new BoardTipDAO();
		if(command.equals("/editor.tw")) {
			String seq = null;
			try {
				if(systemFileName != null && !(title.equals(""))) {
					seq = tipDAO.getBoardSeq();
					BoardDTO dto = new BoardDTO(seq, category, subject, title, contents);
					int result = tipDAO.insertData(dto);
					AdminFileDAO fileDAO = new AdminFileDAO();

					if(result > 0) {
						AdminFilesDTO fileDTO = new AdminFilesDTO(seq, category, subject, systemFileName, originalFileName);
						int fileResult = fileDAO.insertThumb_FileName(fileDTO);
						if(fileResult > 0) {
							if(stJson != null){
								obj = paser.parse(stJson);
								JSONArray jsonArray = (JSONArray)obj;
								fileList = new String[jsonArray.size()];
								for(int j=0;j<fileList.length;j++){
									fileList[j] = jsonArray.get(j).toString();
								}
								int imgUpResult[] = fileDAO.insertContentsImg(seq, fileList);
								for(int i=0;i<imgUpResult.length;i++) {
									if(imgUpResult[i] > 0) {
									}
								}
							}
						}else {
						}
					}
				}else {
				}

				String place_name = mr.getParameter("places.place_name");
				String category_name = mr.getParameter("places.category_name");
				String phone = mr.getParameter("places.phone");
				String road_address_name = mr.getParameter("places.road_address_name");
				String address_name = mr.getParameter("places.address_name");
				String place_url = mr.getParameter("places.place_url");
				String x = mr.getParameter("places.x");
				String y = mr.getParameter("places.y");

				if(!place_name.equals("")) {
					MapDTO dto = new MapDTO(seq, place_name,category_name,phone,road_address_name,address_name,place_url,x,y);
					MapDAO dao = new MapDAO();
					int result = dao.insertData(dto);
					if(result <= 0) {
						response.sendRedirect("error.html");
					}
				}



			} catch (Exception e) {
				e.printStackTrace();
			}
			String encodeCat = URLEncoder.encode(category, "UTF-8");
			dst = "selectNaviCat.tip?category="+encodeCat;
		}else if(command.equals("/notemodify.tw")) {
			try {
				if(systemFileName != null) {
					String seq = mr.getParameter("seq");
					BoardDTO dto = new BoardDTO(seq, category, subject, title, contents);
					int result = tipDAO.updateData(dto);
					AdminFileDAO fileDAO = new AdminFileDAO();

					if(result > 0) {
						AdminFilesDTO fileDTO = new AdminFilesDTO(seq, category, subject, systemFileName, originalFileName);
						int fileResult = fileDAO.updateThumb_FileName(fileDTO);
						if(fileResult > 0) {
							if(stJson != null){

								obj = paser.parse(stJson);
								JSONArray jsonArray = (JSONArray)obj;
								fileList = new String[jsonArray.size()];
								for(int j=0;j<fileList.length;j++){
									fileList[j] = jsonArray.get(j).toString();
								}
								int imgUpResult[] = fileDAO.insertContentsImg(seq, fileList);
								for(int i=0;i<imgUpResult.length;i++) {
									if(imgUpResult[i] > 0) {
									}
								}
							}
						}else {}
						String place_name = mr.getParameter("places.place_name");
						String category_name = mr.getParameter("places.category_name");
						String phone = mr.getParameter("places.phone");
						String road_address_name = mr.getParameter("places.road_address_name");
						String address_name = mr.getParameter("places.address_name");
						String place_url = mr.getParameter("places.place_url");
						String x = mr.getParameter("places.x");
						String y = mr.getParameter("places.y");

						if(!place_name.equals("")) {
							MapDTO mapDTO = new MapDTO(seq, place_name,category_name,phone,road_address_name,address_name,place_url,x,y);
							MapDAO dao = new MapDAO();
							int resultMap = dao.modifyData(mapDTO);
							if(resultMap <= 0) {
								response.sendRedirect("error.jsp");
							}
						}
					}else {}
				}else {}

			}catch(Exception e){
				e.printStackTrace();
			}
			String encodeCat = URLEncoder.encode(category, "UTF-8");
			dst = "selectNaviCat.tip?category="+encodeCat;
		}

		if(isRedirect) {
			response.sendRedirect(dst);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher(dst);
			rd.forward(request, response);
		}

	}

}
