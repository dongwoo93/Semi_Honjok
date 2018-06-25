package honjok.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import honjok.web.dto.BoardFreeDTO;
import kh.web.dbutils.DBUtils;

public class BoardFreeDAO {
	public List<BoardFreeDTO> selectData() throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "select board_free.*, row_number() over(order by free_writedate desc) as num from board_free";
		
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
