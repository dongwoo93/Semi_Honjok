package honjok.web.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;

import honjok.web.dto.BoardDTO;

public class BoardWriteDAO {
	private Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "kh";
		String dbPw = "kh";

		return DriverManager.getConnection(url, dbId, dbPw);
	}
	
	public int insertInfo(String title, String contents) throws Exception{
		Connection con = this.getConnection();
		String sql = "insert into testtip values(?, ?)";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, title);
		pstat.setString(2, contents);
		int result = pstat.executeUpdate();
		return result;
		
	}
	public List<BoardDTO> boardSelect(){
		
	}
}
