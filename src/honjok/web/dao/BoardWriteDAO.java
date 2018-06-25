package honjok.web.dao;

import java.io.Reader;
import java.io.StringReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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

	public int insertInfo(String category, String subject, String title, String contents, String systemFileName, String originalFileName) throws Exception{
		Connection con = this.getConnection();
		String sql = "insert into testtip values(testtip_seq.nextval, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstat = con.prepareStatement(sql);
		StringReader sr = new StringReader(contents);
		con.setAutoCommit(false);

		pstat.setString(1, category);
		pstat.setString(2, subject);
		pstat.setString(3, title);
		pstat.setCharacterStream(4, sr, contents.length());
		pstat.setString(5, systemFileName);
		pstat.setString(6, originalFileName);

		int result = pstat.executeUpdate();
		con.commit();
		con.setAutoCommit(true);
		pstat.close();
		con.close();
		return result;

	}
	public List<BoardDTO> boardSelect() throws Exception{
		Connection con = this.getConnection();
		String sql = "select * from testtip";
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
		List<BoardDTO> list = new ArrayList<>();
		StringBuffer sb = new StringBuffer();
		while(rs.next()) {
			BoardDTO dto = new BoardDTO();
			dto.setTitle(rs.getString(2));
			Reader instream = rs.getCharacterStream("contents");
			char[] buffer = new char[1024];  // create temporary buffer for read
			int length = 0;   // length of characters read
			// fetch data  
			while ((length = instream.read(buffer)) != -1)  {
				for (int i=0; i<length; i++){
					sb.append(buffer[i]);
				} 
			}
			instream.close();// Close input stream
			dto.setContents(sb.toString());
			list.add(dto);
		}
		pstat.close();
		con.close();
		return list;
	}

}

