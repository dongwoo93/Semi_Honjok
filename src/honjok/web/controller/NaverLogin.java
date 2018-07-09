package honjok.web.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


@WebServlet("/NaverLogin")
public class NaverLogin extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

String requestURI = request.getRequestURI();
		
		    String clientId = "0QWAu0ecnrYTQlD9z0JZ";//���ø����̼� Ŭ���̾�Ʈ ���̵�";
		    String clientSecret = "cAOyrtdthX";//���ø����̼� Ŭ���̾�Ʈ ��ũ����";
		    String code = request.getParameter("code");
		    String state = request.getParameter("state");
		    String redirectURI = URLEncoder.encode("http://192.168.20.36:8080/SemiProject/NaverLogin", "UTF-8");
		    String apiURL;
		    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		    apiURL += "client_id=" + clientId;
		    apiURL += "&client_secret=" + clientSecret;
		    apiURL += "&redirect_uri=" + redirectURI;
		    apiURL += "&code=" + code;
		    apiURL += "&state=" + state;
		    String access_token = "";
		    String refresh_token = "";
		    try {
		      URL url = new URL(apiURL);
		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
		      con.setRequestMethod("GET");
		      int responseCode = con.getResponseCode();
		      BufferedReader br;
		      
		      if(responseCode==200) { // ���� ȣ��
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		      } else {  // ���� �߻�
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      String inputLine;
		      StringBuffer res = new StringBuffer();
		      while ((inputLine = br.readLine()) != null) {
		        res.append(inputLine);
		      }
		      br.close();
		      if(responseCode==200) {
		        /*out.println(res.toString());*/
		        
		        JSONParser jsPars = new JSONParser();
	            String Alldata = res.toString();
	            JSONObject jsOBj = (JSONObject)jsPars.parse(Alldata);  
	            
	            String access = (String) jsOBj.get("access_token");
	            
	            /*request.setAttribute("access", access);*/
	            
	            RequestDispatcher rd = request.getRequestDispatcher("abc.do?access="+URLEncoder.encode(access, "utf8"));
	            
	            
				rd.forward(request, response);
	            
		      }
		    } catch (Exception e) {
		      e.printStackTrace();
		    }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
