package honjok.web.beans;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class test {
public static void main(String[] args) throws Exception {


	String query = URLEncoder.encode("그램","UTF-8");
	String clientID="M9FvHhH5VgxJcEDBzzJv"; //네이버 개발자 센터에서 발급받은 clientID입력
	String clientSecret = "qYLgCR8ihe";        //네이버 개발자 센터에서 발급받은 clientSecret입력

	URL url = new URL("https://openapi.naver.com/v1/search/shop.json?query="+query+"&display=100"); //API 기본정보의 요청 url을 복사해오고 필수인 query를 적어줍니당! 



	URLConnection urlConn=url.openConnection(); //openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체 



	urlConn.setRequestProperty("X-Naver-Client-ID", clientID);

	urlConn.setRequestProperty("X-Naver-Client-Secret", clientSecret);



	BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));



	String msg = null;
	StringBuffer response = new StringBuffer();
	while((msg = br.readLine())!=null)

	{
		response.append(msg);
	}
	br.close();

	JsonParser parser = new JsonParser();
	JsonObject json = parser.parse(response.toString()).getAsJsonObject();
	JsonArray arr = json.get("items").getAsJsonArray();
	System.out.println(arr);


}
}
