package honjok.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import honjok.web.dbutils.DBUtils;
import honjok.web.dto.AdminLikeDTO;
import honjok.web.dto.LikeDTO;

public class AdminLikeDAO {
	public boolean LikeExist(String seq, String id) throws Exception {
		boolean isExist = false;
		Connection con = DBUtils.getConnection();
		String sql = "select * from admin_like where article_no=? and member_id=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, Integer.parseInt(seq));
		pstat.setString(2, id);
		ResultSet rs = pstat.executeQuery();
		if(rs.next()) {
			isExist = true;
		}
		pstat.close();
		con.close();
		return isExist;
	}

	public AdminLikeDTO selectArticleLike(String seq, String id) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from admin_like where article_no=? and member_id=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, Integer.parseInt(seq));
		pstat.setString(2, id);
		ResultSet rs = pstat.executeQuery();
		AdminLikeDTO tmp = null;
		if(rs.next()) {
		tmp = new AdminLikeDTO();
		tmp.setArticle_no(rs.getString(1));
		tmp.setLike_seq(rs.getString(2));
		tmp.setMember_id(rs.getString(3));
		tmp.setLike_check(rs.getString(4));
		}
		pstat.close();
		con.close();
		return tmp;
	}

	public int insertData(String seq, String id) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "insert into admin_like values(?, admin_like_seq.nextval, ?, 0)";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, Integer.parseInt(seq));
		pstat.setString(2, id);
		int result = pstat.executeUpdate();
		con.commit();
		pstat.close();
		con.close();
		return result;
	}

	public int UpdateLike(String seq, String id, String like) {
		int result = 0;

		try {
			Connection con = DBUtils.getConnection();
			String sql = "update admin_like set like_check=? where article_no=? and member_id=?";
			PreparedStatement pstat = con.prepareStatement(sql);
			pstat.setString(1, like);
			pstat.setInt(2, Integer.parseInt(seq));
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
	
	public int selectLike(String seq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select likeit from admin_board where seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, Integer.parseInt(seq));
		ResultSet rs = pstat.executeQuery();
		rs.next();
		
		int result = rs.getInt(1);
		pstat.close();
		con.close();
		return result;
	}
	
	public int updateLikeCount(String seq, int likeCount) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "update admin_board set likeit=? where seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, likeCount);
		pstat.setInt(2, Integer.parseInt(seq));
		int result = pstat.executeUpdate();
		con.commit();
		pstat.close();
		con.close();
		return result;
	}
}
