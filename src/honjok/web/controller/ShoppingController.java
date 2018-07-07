package honjok.web.controller;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import honjok.web.beans.ShoppingSearch;
import honjok.web.dao.ShoppingDAO;
import honjok.web.dao.ShoppingFileDAO;
import honjok.web.dto.ShoppingDTO;
import honjok.web.dto.ShoppingFilesDTO;

@WebServlet("*.shop")
public class ShoppingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		boolean isRedirect = true;
		String dst = null;
		
		
		
		
		
		ShoppingDAO dao = new ShoppingDAO();
		ShoppingFileDAO filedao = new ShoppingFileDAO();
		try {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		if(command.equals("")) {
			String keyword = request.getParameter("keyword");
			ShoppingSearch shop = new ShoppingSearch();
			
				JsonArray result = shop.getList(keyword);
				response.setCharacterEncoding("UTF-8");
				response.setContentType("application/json");
				new Gson().toJson(result, response.getWriter());
		}
		/**/
		else if(command.equals("/shopregister.shop")) {
			
			String realPath = request.getServletContext().getRealPath("/files/");
			File f = new File(realPath);
			
			if(!f.exists()) {
				f.mkdirs();
			}
			
			int maxSize = 1024 * 1024 * 100;
			String enc = "utf8";
			
			MultipartRequest mr = new MultipartRequest(request, realPath, maxSize, enc, new DefaultFileRenamePolicy());
			Enumeration<String> names = mr.getFileNames();
			
			String product_name = mr.getParameter("product_name");
			String product_price = mr.getParameter("product_price");
			String product_quantity = mr.getParameter("product_quantity");
			String product_summary = mr.getParameter("product_summary");
			String product_delivery = mr.getParameter("product_delivery");
			String product_contents = mr.getParameter("summernote");
			
			String paramName = names.nextElement();
			String originalFileName = mr.getOriginalFileName(paramName);
			String systemFileName = mr.getFilesystemName(paramName);
			

			
			if(systemFileName != null && !(product_name.equals(""))) {

				String seq = dao.getBoardSeq();
				ShoppingDTO dto = new ShoppingDTO(seq, product_name, product_price, product_quantity, product_summary, product_contents, product_delivery);
				int result = dao.insertData(dto);
				

				if(result>0) {

					ShoppingFilesDTO filedto = new ShoppingFilesDTO(seq,originalFileName,systemFileName);
					int fileresult = filedao.uploadFile(filedto);
					
					request.setAttribute("result", fileresult);
					
					isRedirect = false;
					dst = "shopping/shopproc.jsp";
				}
			}
			
			
		}
		/*쇼핑메인페이지에서 글쓰기 버튼 눌렀을 때 옴*/
		else if(command.equals("/shopwrite.shop")) {
			isRedirect=false;
			dst="shopping/shopWrite.jsp";
		}
		/*작성페이지에서 작성버튼 눌렀을 때 , 메인에서 네비바 쇼핑 눌렀을 때*/
		else if(command.equals("/shopmain.shop")) {
			ArrayList<ShoppingDTO> result = dao.selectData();
			List<ShoppingFilesDTO> list= filedao.getAllThum_sysFileName();
			request.setAttribute("result", result);
			request.setAttribute("list", list);
			
			isRedirect=false;
			dst="shopping/shopmain.jsp";
			
			
		}else if(command.equals("/itemview.shop")) {
			String seq = request.getParameter("seq");
			ArrayList<ShoppingDTO> result = dao.clickData(seq);
			List<ShoppingFilesDTO> list= filedao.clickfile(seq);
			
			request.setAttribute("result", result);
			request.setAttribute("list", list);
			
			
			isRedirect=false;
			dst = "shopping/itemview.jsp";
		}else if(command.equals("/purchase.shop")) {
			String seq = request.getParameter("seq");
			ArrayList<ShoppingDTO> result = dao.clickData(seq);
			List<ShoppingFilesDTO> list = filedao.clickfile(seq);
			DecimalFormat dt = new DecimalFormat("#,##0");
			
			request.setAttribute("result", result);
			String a = result.get(0).getProduct_price().replaceAll("\\,","");
			int price2 = Integer.parseInt(a) + 2500;
			String price = dt.format(price2);
			
			request.setAttribute("list", list);
			request.setAttribute("price", price);
			
			isRedirect=false;
			dst = "shopping/order.jsp";
		}
		
		
		
	
		} catch (Exception e) {
			e.printStackTrace();
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
