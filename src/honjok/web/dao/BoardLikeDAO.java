package honjok.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import honjok.web.dbutils.DBUtils;
import honjok.web.dto.LikeDTO;

public class BoardLikeDAO {
	public boolean LikeExist(String boardSeq, String id) throws Exception {
		boolean isExist = false;
		Connection con = DBUtils.getConnection();
		String sql = "select * from likeit where board_seq=? and member_id=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, boardSeq);
		pstat.setString(2, id);
		ResultSet rs = pstat.executeQuery();
		if(rs.next()) {
			isExist = true;
		}
		rs.close();
		pstat.close();
		con.close();
		return isExist;
	}
	
	public LikeDTO SelectLike(String boardSeq, String id) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from likeit where board_seq=? and member_id=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, boardSeq);
		pstat.setString(2, id);
		ResultSet rs = pstat.executeQuery();
		rs.next();
			LikeDTO tmp = new LikeDTO();
			tmp.setLikeSeq(rs.getString(1));
			tmp.setBoardFreeSeq(rs.getString(2));
			tmp.setMemberId(rs.getString(3));
			tmp.setLikeCheck(rs.getString(4));
		
		rs.close();
		pstat.close();
		con.close();
		return tmp;
	}
	
	public int insertData(String boardSeq, String id) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "insert into likeit values(LIKEIT_SEQ.NEXTVAL, ?, ?, default)";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, boardSeq);
		pstat.setString(2, id);
		int result = pstat.executeUpdate();
		con.commit();
		pstat.close();
		con.close();
		return result;
	}
	
	public int UpdateLike(String boardSeq, String id, String like) {
		int result = 0;
		
		try {
			Connection con = DBUtils.getConnection();
			String sql = "update likeit set like_check=? where board_seq=? and member_id=?";
			PreparedStatement pstat = con.prepareStatement(sql);
			pstat.setString(1, like);
			pstat.setString(2, boardSeq);
			pstat.setString(3, id);

			result = pstat.executeUpdate();
			con.commit();
			pstat.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
}
