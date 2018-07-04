package honjok.web.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import honjok.web.dao.MemberDAO;
import testDAO.testDAO;




@WebServlet("*.do")
public class loginController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isRedirect = true;
		String dst = null;

		
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");
		
		MemberDAO dao = new MemberDAO();
		

		try {
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();


			String command = requestURI.substring(contextPath.length());
			if(command.equals("/kakaotest.do")) {

				try {

					String id = request.getParameter("id");
					String email = request.getParameter("email");
					String name = request.getParameter("name");

					email = email.replace("\"", "");
					name = name.replace("\"", "");

					boolean result = dao.idCheck(id);

					if(result) {

					}else {
						dao.kakaoInsertData(id, name, email);

					}         
					request.getSession().setAttribute("loginId", id);
					dst = "hollo.com";

				}catch(Exception e) {
					e.printStackTrace();
				}

			}else if(command.equals("/naver.do")) {

				String clientId = "0QWAu0ecnrYTQlD9z0JZ"; //���ø����̼� Ŭ���̾�Ʈ ���̵�";
				String redirectURI = URLEncoder.encode("http://192.168.20.9:8080/Semi_Honjok/navertest", "UTF-8");
				SecureRandom random = new SecureRandom();
				String state = new BigInteger(130, random).toString();
				String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
				apiURL += "&client_id=" + clientId;
				apiURL += "&redirect_uri=" + redirectURI;
				apiURL += "&state=" + state;

				response.sendRedirect(apiURL);
				return;
				/*session.setAttribute("state", state);*/
				//RequestDispatcher rd = request.getRequestDispatcher(apiURL);
				//rd.forward(request, response);
				/*isRedirect = false;
				dst = apiURL;*/

			}else if(command.equals("/abc.do")) {

				
				response.setContentType("text/html; charset=utf-8");

				String access = request.getParameter("access");
				String token1 = access;



				String header = "Bearer " + token1; // Bearer ������ ���� �߰�
				try {
					String apiURL = "https://openapi.naver.com/v1/nid/me";
					URL url = new URL(apiURL);
					HttpURLConnection con = (HttpURLConnection)url.openConnection();
					con.setRequestMethod("GET");
					con.setRequestProperty("Authorization", header);
					int responseCode = con.getResponseCode();
					BufferedReader br;
					if(responseCode==200) { // ���� ȣ��
						br = new BufferedReader(new InputStreamReader(con.getInputStream()));

					} else {  // ���� �߻�
						br = new BufferedReader(new InputStreamReader(con.getErrorStream()));

					}
					String inputLine;
					StringBuffer response1 = new StringBuffer();
					while ((inputLine = br.readLine()) != null) {
						response1.append(inputLine);
					}
					br.close();

					JSONParser jsPars = new JSONParser();
					String Alldata = response1.toString();
					JSONObject jsOBj = (JSONObject)jsPars.parse(Alldata);           


					String member = jsOBj.get("response").toString();


					JSONObject jsOBj2 = (JSONObject)jsPars.parse(member);
					String id = jsOBj2.get("id").toString();
					String name = jsOBj2.get("name").toString();
					String gender = jsOBj2.get("gender").toString();
					String email = jsOBj2.get("email").toString();



					boolean result = dao.idCheck(id);

					if(result) {

					}else {
						dao.naverInserData(id, name, email, gender);

					}         

					dst = "naverclose.jsp";

				} catch (Exception e) {

				}
			}else if(command.equals("/google.do")) {

				try {


					String id = request.getParameter("id");
					String email = request.getParameter("email");
					String name = request.getParameter("name");


					boolean result = dao.idCheck(id);

					if(result) {

					}else {
						dao.googleInsertData(id, name, email);

					}         
					
					dst = "hollo.com";

				}catch(Exception e) {
					e.printStackTrace();
				}


			}else if(command.equals("/login.do")) {
				
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");

				boolean result = dao.idpwCheck(id, pw);
				String resultStr = String.valueOf(result);
						
				dst = "hollo.com";

				
				JSONObject o1 = new JSONObject();
				o1.put("result", resultStr);
				
				response.setCharacterEncoding("utf8");
				response.setContentType("application/json");
				if(result) {
					request.getSession().setAttribute("loginId", id);
					response.getWriter().print(o1);
					response.getWriter().flush();
					response.getWriter().close();
					return;
				}else {
					response.getWriter().print(o1);
					response.getWriter().flush();
					response.getWriter().close();
					return;
				}
				
			}else if(command.equals("/logout.do")) {
				request.getSession().invalidate();
				dst = "hollo.com";
			}

		}catch(Exception e) {

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
