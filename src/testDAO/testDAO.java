package testDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class testDAO {

	private Connection getConnection() throws Exception {
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "kh";
		String dbPw = "kh";
		
		Connection con = DriverManager.getConnection(url, dbId, dbPw);
		
		return con;
		
	}
	
	public int insertData(String id, String name, String email) throws Exception {
		Connection con = this.getConnection();
		String sql = "insert into test values(?,null,?,null,?,null,null,null)";
		
		PreparedStatement pstat = con.prepareStatement(sql);
		
		pstat.setString(1, id);
		pstat.setString(2, name);
		pstat.setString(3, email);
		
		int result = pstat.executeUpdate();
		
		con.commit();
		pstat.close();
		con.close();
		
		System.out.println("dao 진입 완료");
		
		return result;
		
	}
	
	
}
