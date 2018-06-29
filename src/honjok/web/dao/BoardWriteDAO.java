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
import kh.web.dbutils.DBUtils;

public class BoardWriteDAO {
	public int insertInfo(String title, String contents) throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "insert into testtip values(testtip_seq.nextval, ?, ?)";
		PreparedStatement pstat = con.prepareStatement(sql);
		StringReader sr = new StringReader(contents);
		con.setAutoCommit(false);

		pstat.setString(1, title);
		pstat.setCharacterStream(2, sr, contents.length());

		int result = pstat.executeUpdate();
		con.commit();
		con.setAutoCommit(true);
		pstat.close();
		con.close();
		return result;

	}
	public List<BoardDTO> boardSelect() throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "select * from testtip";
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
		List<BoardDTO> list = new ArrayList<>();
		StringBuffer sb = new StringBuffer();
		while(rs.next()) {
			BoardDTO dto = new BoardDTO();
			dto.setTitle(rs.getString(1));
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

