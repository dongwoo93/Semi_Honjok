package honjok.web.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class navertest {

    public static void main(String[] args) {
        String token = "AAAANhYGzXK46utLrbNIT/8ji9AYK6dIVNLIM+PJpLJGfT0vF9/wOHXJA2fxjEnlSi9nDMx8WfJYjG9oiwLXvhnYn4o"
        		+ "="
        		+ "";// 네이버 로그인 접근 토큰;
        String header = "Bearer " + token; // Bearer 다음에 공백 추가
        try {
            String apiURL = "https://openapi.naver.com/v1/nid/me";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", header);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
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
            
            
           
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
