package honjok.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kh.web.dbutils.DBUtils;

public class BoardFreeDAO {	
	public List<BoardFreeDTO> selectData() throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "select boardtest.*, row_number() over(order by writedate desc) as num from boardtest";
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
		List<BoardFreeDTO> result = new ArrayList<>();
		while(rs.next()) {
			BoardFreeDTO tmp = new BoardFreeDTO();
			tmp.setSeq(rs.getInt(1));
			tmp.setNo(rs.getInt(2));
			tmp.setHead(rs.getString(3));
			tmp.setTitle(rs.getString(4));
			tmp.setContents(rs.getString(5));
			tmp.setWriter(rs.getString(6));
			tmp.setWritedate(rs.getString(7));
			tmp.setViewcount(rs.getInt(8));
			tmp.setSuggest(rs.getInt(9));
			result.add(tmp);
		}		
		pstat.close();
		con.close();
		return result;
	}	
	
	public int insertData(BoardFreeDTO dto) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "insert into board values(boardtest_seq.nextval,boardno_seq.nextval,?,?,?,?,sysdate,?,?)";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, dto.getHead());
		pstat.setString(2, dto.getTitle());
		pstat.setString(3, dto.getContents());
		pstat.setString(4, dto.getWriter());
		pstat.setInt(5, dto.getViewcount());
		pstat.setInt(6, dto.getSuggest());
		int result = pstat.executeUpdate();

		pstat.close();
		con.commit();
		con.close();
		return result;
	}
}
