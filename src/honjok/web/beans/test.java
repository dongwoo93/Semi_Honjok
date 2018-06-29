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


	String query = URLEncoder.encode("洹몃옩","UTF-8");
	String clientID="M9FvHhH5VgxJcEDBzzJv"; //�꽕�씠踰� 媛쒕컻�옄 �꽱�꽣�뿉�꽌 諛쒓툒諛쏆� clientID�엯�젰
	String clientSecret = "qYLgCR8ihe";        //�꽕�씠踰� 媛쒕컻�옄 �꽱�꽣�뿉�꽌 諛쒓툒諛쏆� clientSecret�엯�젰

	URL url = new URL("https://openapi.naver.com/v1/search/shop.json?query="+query+"&display=100"); //API 湲곕낯�젙蹂댁쓽 �슂泥� url�쓣 蹂듭궗�빐�삤怨� �븘�닔�씤 query瑜� �쟻�뼱以띾땲�떦! 



	URLConnection urlConn=url.openConnection(); //openConnection �빐�떦 �슂泥��뿉 ���빐�꽌 �벝 �닔 �엳�뒗 connection 媛앹껜 



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


}
}
