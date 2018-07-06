package honjok.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import honjok.web.dbutils.DBUtils;
import honjok.web.dto.MapDTO;

public class MapDAO {
	
	public int insertData(MapDTO dto) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "insert into map values(place_seq.nextval,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, dto.getBoard_seq());
		pstat.setString(2, dto.getPlace_name());
		pstat.setString(3, dto.getCategory_name());
		pstat.setString(4, dto.getPhone());
		pstat.setString(5, dto.getRoad_address_name());
		pstat.setString(6, dto.getAddress_name());
		pstat.setString(7, dto.getPlace_url());
		pstat.setString(8, dto.getX());
		pstat.setString(9, dto.getY());
		int result = pstat.executeUpdate();
		con.commit();
		pstat.close();
		con.close();
		return result;
	}
	public int modifyMap(MapDTO dto) throws Exception{
	Connection con = DBUtils.getConnection();
	String sql = "update map set place_name=?, category_name=?, phone=?, road_address_name=?, place_url=?, x=?, y? where board_seq=?";
	PreparedStatement pstat = con.prepareStatement(sql);
	pstat.setString(1, dto.getPlace_name());
	pstat.setString(2, dto.getCategory_name());
	pstat.setString(3, dto.getPhone());
	pstat.setString(4, dto.getRoad_address_name());
	pstat.setString(5, dto.getAddress_name());
	pstat.setString(6, dto.getPlace_url());
	pstat.setString(7, dto.getX());
	pstat.setString(8, dto.getY());
	pstat.setString(9, dto.getBoard_seq());
	int result = pstat.executeUpdate();
	con.commit();
	pstat.close();
	con.close();
	return result;
	}

	
	public ArrayList<MapDTO> selectData(String seq) throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "select * from map where board_seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, seq);
		ArrayList<MapDTO> list = new ArrayList<>();
		ResultSet rs = pstat.executeQuery();
		if(rs.next()) {
			MapDTO dto = new MapDTO();
			dto.setPlace_name(rs.getString("place_name"));
			dto.setCategory_name(rs.getString("category_name"));
			dto.setPhone(rs.getString("phone"));
			dto.setRoad_address_name(rs.getString("road_address_name"));
			dto.setAddress_name(rs.getString("address_name"));
			dto.setPlace_url(rs.getString("place_url"));
			dto.setX(rs.getString("x"));
			dto.setY(rs.getString("y"));
			list.add(dto);
		}
		rs.close();
		pstat.close();
		con.close();
		return list;
	}
}
