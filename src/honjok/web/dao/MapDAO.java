package honjok.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import honjok.web.dbutils.DBUtils;
import honjok.web.dto.MapDTO;

public class MapDAO {
	
	public int insertData(MapDTO dto) throws Exception {
		Connection con = DBUtils.getConnection();
		
		String sql = "insert into map values(place_seq.nextval,?,?,?,?,?,?,?)";
		PreparedStatement pstat = con.prepareStatement(sql);
		
		pstat.setString(1, dto.getBoard_seq());
		pstat.setString(2, dto.getPlace_name());
		pstat.setString(3, dto.getCategory_name());
		pstat.setString(4, dto.getPhone());
		pstat.setString(5, dto.getRoad_address_name());
		pstat.setString(6, dto.getAddress_name());
		pstat.setString(7, dto.getPlace_url());
		
		int result = pstat.executeUpdate();
		
		con.commit();
		
		pstat.close();
		con.close();
		
		return result;
		
	}
}
