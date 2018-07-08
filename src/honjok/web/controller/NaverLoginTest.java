package honjok.web.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class NaverLoginTest {

    public static void main(String[] args) {
        
    	
    	
    	String token = "AAAANhYGzXK46utLrbNIT/8ji9AYK6dIVNLIM+PJpLJGfT0vF9/wOHXJA2fxjEnlSi9nDMx8WfJYjG9oiwLXvhnYn4o"
        		+ "="
        		+ "";// ���̹� �α��� ���� ��ū;
        String header = "Bearer " + token; // Bearer ������ ���� �߰�
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
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            
            JSONParser jsPars = new JSONParser();
            String Alldata = response.toString();
            JSONObject jsOBj = (JSONObject)jsPars.parse(Alldata);           
            /*System.out.println(response.toString());*/
            
            String member = jsOBj.get("response").toString();
            
            JSONObject jsOBj2 = (JSONObject)jsPars.parse(member);
            String id = jsOBj2.get("id").toString();
            String name = jsOBj2.get("name").toString();
            String gender = jsOBj2.get("gender").toString();
            String email = jsOBj2.get("email").toString();
            
             
            
           
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
