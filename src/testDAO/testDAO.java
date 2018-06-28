package testDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class testDAO {

	private Connection getConnection() throws Exception {
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "kh";
		String dbPw = "kh";
		
		Connection con = DriverManager.getConnection(url, dbId, dbPw);
		
		return con;
		
	}
	
	public int kakaoInsertData(String id, String name, String email) throws Exception {
		Connection con = this.getConnection();
		String sql = "insert into test values(?,null,?,null,?,null,null,null,'kakao')";
		
		PreparedStatement pstat = con.prepareStatement(sql);
		
		pstat.setString(1, id);
		pstat.setString(2, name);
		pstat.setString(3, email);
		
		int result = pstat.executeUpdate();
		
		con.commit();
		pstat.close();
		con.close();
		
		System.out.println("카카오 dao 진입 완료");
		
		return result;
		
	}
	
	public int naverInserData(String id, String name, String email, String gender) throws Exception{
		Connection con = this.getConnection();
		String sql = "insert into test values(?,null,?,null,?,null,null,?,'naver')";
		
		PreparedStatement pstat = con.prepareStatement(sql);
		
		pstat.setString(1, id);
		pstat.setString(2, name);
		pstat.setString(3, email);
		pstat.setString(4, gender);
		
		int result = pstat.executeUpdate();
		
		con.commit();
		pstat.close();
		con.close();
		
		System.out.println("네이버 dao 진입 완료");
		
		return result;
	}
	
	public int googleInsertData(String id, String name, String email) throws Exception {
		Connection con = this.getConnection();
		String sql = "insert into test values(?,null,?,null,?,null,null,null,'google')";
		
		PreparedStatement pstat = con.prepareStatement(sql);
		
		pstat.setString(1, id);
		pstat.setString(2, name);
		pstat.setString(3, email);
		
		int result = pstat.executeUpdate();
		
		con.commit();
		pstat.close();
		con.close();
		
		System.out.println("구글 dao 진입 완료");
		
		return result;
		
	}
	
	public boolean idCheck(String id) throws Exception {
		Connection con = this.getConnection();
		String sql = "select * from test where id = ?";
		
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, id);
		ResultSet rs = pstat.executeQuery();
		
		boolean result = false;
		
		if(rs.next()) {
			result = true;
		}
		
		pstat.close();
		con.close();
		rs.close();
		
		return result;
	}
	
}
