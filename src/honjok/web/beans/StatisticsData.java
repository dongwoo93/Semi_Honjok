package honjok.web.beans;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;



public class StatisticsData {
	private BufferedInputStream reader;
	private JSONArray array;
	String readUrl;
	
	
	
	public StatisticsData() {
		JSONParser jsonparser = new JSONParser();
		try {
			URL url = new URL("http://kosis.kr/openapi/statisticsData.do?method=getList&apiKey=YTMxZTA3Mjc4YTRiMzNlMGU3MTg4NzQxZmJkNTI0Y2Q=&format=json&jsonVD=Y&userStatsId=dddl10/101/DT_1ES4I002S/2/1/20180626144616&prdSe=Y&newEstPrdCnt=1");
			reader = new BufferedInputStream(url.openStream());
			StringBuffer buffer = new StringBuffer();
			int i;
			byte[] b = new byte[4096];
			while( (i = reader.read(b)) != -1){
				buffer.append(new String(b, 0, i));
			}
			readUrl = buffer.toString();
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (reader != null)
				try {
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
		try {
			array = (JSONArray) jsonparser.parse(readUrl);
			System.out.println(readUrl);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}



	public JSONArray getOneTotal() {
		return array;
	}

}
