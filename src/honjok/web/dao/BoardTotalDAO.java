package honjok.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import honjok.web.dbutils.DBUtils;

public class BoardTotalDAO {
	public void selectData() throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from (select board_tip.tip_title, row_number() over(order by tip_writedate desc) as num from board_tip) "
				+ "where num between 1 and 5";
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
//		List<BoardDTO> list = new ArrayList<>();
	}
}
