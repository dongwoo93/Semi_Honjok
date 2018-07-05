package honjok.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import honjok.web.dbutils.DBUtils;
import honjok.web.dto.BoardUserDTO;
import honjok.web.dto.MemberDTO;

public class MypageDAO {

	public ArrayList<BoardUserDTO> selectData(String writer) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from board_user where user_writer=?";
		PreparedStatement pstat = con.prepareStatement(sql);

		pstat.setString(1, writer);

		ResultSet rs = pstat.executeQuery();	
		ArrayList<BoardUserDTO> al = new ArrayList<>();
		
		while(rs.next()) {
			BoardUserDTO dto = new BoardUserDTO();
			dto.setCat_seq(rs.getInt(1));
			dto.setSeq(rs.getInt(2));
			dto.setCategory(rs.getString(3));
			dto.setTitle(rs.getString(4));
			dto.setWriter(rs.getString(5));
			dto.setContents(rs.getString(6));
			dto.setHeader(rs.getString(7));
			dto.setViewcount(rs.getInt(8));
			dto.setLike(rs.getInt(9));
			dto.setWritedate(rs.getString(10));
			dto.setIp(rs.getString(11));
			
			al.add(dto);
			}
		
		con.commit();
		pstat.close();	
		con.close();

		return al;

	}
}
