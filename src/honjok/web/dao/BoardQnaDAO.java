package honjok.web.dao;

import java.io.Reader;
import java.io.StringReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import honjok.web.dto.BoardQnaDTO;
import kh.web.dbutils.DBUtils;

public class BoardQnaDAO {	
	public List<BoardQnaDTO> selectData() throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "select board_qna.*, row_number() over(order by qna_writedate desc) as num from board_qna";
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
		List<BoardQnaDTO> list = new ArrayList<>();
		StringBuffer sb = new StringBuffer();
		while(rs.next()) {
			BoardQnaDTO dto = new BoardQnaDTO();
			dto.setSeq(rs.getInt(1));
			dto.setTitle(rs.getString(2));
			dto.setWriter(rs.getString(3));
			Reader instream = rs.getCharacterStream("qna_contents");
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
			dto.setLike(rs.getInt(5));
			dto.setViewcount(rs.getInt(6));
			dto.setWritedate(rs.getString(7));
			dto.setIp(rs.getString(8));
			list.add(dto);
		}
		pstat.close();
		con.close();
		return list;
	}	
	
	public int insertData(BoardQnaDTO dto) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "insert into board_qna values(board_qna_seq.nextval,?,?,?,?,sysdate,?,?)";
		PreparedStatement pstat = con.prepareStatement(sql);
		StringReader sr = new StringReader(dto.getContents());
		con.setAutoCommit(false);

		pstat.setString(1, dto.getTitle());
		pstat.setString(2, dto.getWriter());
		pstat.setCharacterStream(3, sr, dto.getContents().length());
		pstat.setString(5, dto.getWritedate());
		pstat.setString(6, dto.getIp());

		int result = pstat.executeUpdate();
		con.commit();
		con.setAutoCommit(true);
		pstat.close();
		con.close();
		return result;
	}
}
