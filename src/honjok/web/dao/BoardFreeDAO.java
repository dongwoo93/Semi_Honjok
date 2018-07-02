package honjok.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import honjok.web.dbutils.DBUtils;

public class BoardFreeDAO {
	
	
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
}
