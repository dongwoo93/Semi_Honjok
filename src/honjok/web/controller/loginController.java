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

import testDAO.testDAO;




@WebServlet("*.do")
public class loginController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isRedirect = true;
		String dst = null;

		request.setCharacterEncoding("utf8");

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


					System.out.println(id);
					System.out.println(email);
					System.out.println(name);

					testDAO dao = new testDAO();

					boolean result = dao.idCheck(id);

					if(result) {
						System.out.println("���ԵȰ�� �׳� ������");
					}else {
						dao.kakaoInsertData(id, name, email);
						System.out.println("���ԾȵȰ�� ���� ȸ�������ʿ�");
					}         

					dst = "hollo.com";

				}catch(Exception e) {
					e.printStackTrace();
				}

			}else if(command.equals("/naver.do")) {
				System.out.println("naver.do ����");
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

				PrintWriter out = response.getWriter();
				response.setContentType("text/html; charset=utf-8");

				String access = request.getParameter("access");
				String token1 = access;

				System.out.println(token1+"");

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
						System.out.println("����ȣ��");
					} else {  // ���� �߻�
						br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
						System.out.println("�����߻�");
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
					System.out.println(response1.toString());

					String member = jsOBj.get("response").toString();
					System.out.println(member);

					JSONObject jsOBj2 = (JSONObject)jsPars.parse(member);
					String id = jsOBj2.get("id").toString();
					String name = jsOBj2.get("name").toString();
					String gender = jsOBj2.get("gender").toString();
					String email = jsOBj2.get("email").toString();

					System.out.println(id);
					System.out.println(name);
					System.out.println(gender);
					System.out.println(email);	

					testDAO dao = new testDAO();

					boolean result = dao.idCheck(id);

					if(result) {
						System.out.println("���ԵȰ�� �׳� ������");
					}else {
						dao.naverInserData(id, name, email, gender);
						System.out.println("���ԾȵȰ�� ���� ȸ�������ʿ�");
					}         

					dst = "naverclose.jsp";

				} catch (Exception e) {
					System.out.println(e);
				}
			}else if(command.equals("/google.do")) {

				try {

					System.out.println("��������");

					String id = request.getParameter("id");
					String email = request.getParameter("email");
					String name = request.getParameter("name");

					System.out.println(id);
					System.out.println(email);
					System.out.println(name);

					testDAO dao = new testDAO();

					boolean result = dao.idCheck(id);

					if(result) {
						System.out.println("���ԵȰ�� �׳� ������");
					}else {
						dao.googleInsertData(id, name, email);
						System.out.println("���ԾȵȰ�� ���� ȸ�������ʿ�");
					}         

					dst = "hollo.com";

				}catch(Exception e) {
					e.printStackTrace();
				}


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
