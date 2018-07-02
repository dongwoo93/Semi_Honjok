package honjok.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import honjok.web.dbutils.DBUtils;
import honjok.web.dto.BoardCommentDTO;

public class BoardCommentDAO {
	public List<BoardCommentDTO> selectComment(int seq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from board_user_comment where board_no=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, seq);
		ResultSet rs = pstat.executeQuery();
		List<BoardCommentDTO> list = new ArrayList<>();
		while(rs.next()) {
			BoardCommentDTO dto = new BoardCommentDTO();
			dto.setBoard_no(rs.getString(1));
			dto.setComment_seq(rs.getString(2));
			dto.setComment_writer(rs.getString(3));
			dto.setComment_content(rs.getString(4));
			dto.setComment_wridate(rs.getString(5));
			dto.setComment_ip(rs.getString(6));
			list.add(dto);
		}
		con.commit();
		pstat.close();
		con.close();
		return list;
	}
	
	public int insertComment(BoardCommentDTO dto) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "insert into board_user_comment values(?, board_user_comment_seq.nextval,? , ?, sysdate, ?)";
		PreparedStatement pstat = con.prepareStatement(sql);

		pstat.setString(1, dto.getBoard_no());
		pstat.setString(2, dto.getComment_writer());
		pstat.setString(3, dto.getComment_content());
		pstat.setString(4, dto.getComment_ip());

		int result = pstat.executeUpdate();
		con.commit();
		pstat.close();
		con.close();
		return result;		
	}
	
}