package honjok.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import honjok.web.dbutils.DBUtils;
import honjok.web.dto.BoardFreeDTO;
import honjok.web.dto.LikeDTO;

public class BoardFreeDAO {
	public boolean LikeExist(String boardSeq, String id) throws Exception {
		boolean isExist = false;
		Connection con = DBUtils.getConnection();
		String sql = "select * from likeit where board_free_seq=? and member_id=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, boardSeq);
		pstat.setString(2, id);
		ResultSet rs = pstat.executeQuery();
		if(rs.next()) {
			isExist = true;
		}
		pstat.close();
		con.close();
		return isExist;
	}
	
	public LikeDTO SelectLike(String boardSeq, String id) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from likeit where board_free_seq=? and member_id=?";
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
			String sql = "update likeit set like_check=? where board_free_seq=2 and member_id='ykng10'";
			PreparedStatement pstat = con.prepareStatement(sql);
			pstat.setString(1, like);

			result = pstat.executeUpdate();
			con.commit();
			pstat.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	public int UpdateViewCount(String seq, String viewCount) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "update board set viewcount=? where seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, viewCount);
		pstat.setString(2, seq);
		int result = pstat.executeUpdate();
		con.commit();
		pstat.close();
		con.close();
		return result;
	}
	public List<BoardFreeDTO> selectData() throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "select board_user.*, row_number() over(order by user_writedate desc) as num from board_user";
		
		PreparedStatement pstat = con.prepareStatement(sql);
		
		ResultSet rs = pstat.executeQuery();
		List<BoardFreeDTO> list = new ArrayList<>(); 
		
		
		while(rs.next()) {
			BoardFreeDTO dto = new BoardFreeDTO();
			dto.setFree_seq(rs.getString(1));
			dto.setFree_title(rs.getString(2));
			dto.setFree_writer(rs.getString(3));
			dto.setFree_contents(rs.getString(4));
			dto.setFree_header(rs.getString(5));
			dto.setFree_viewcount(rs.getString(6));
			dto.setFree_like(rs.getString(7));
			dto.setFree_writedate(rs.getString(8));
			dto.setFree_ip(rs.getString(9));
			list.add(dto);
		}
		
			pstat.close();
			con.close();
			
			return list;
	}
}
