package honjok.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import honjok.web.dbutils.DBUtils;
import honjok.web.dto.AdminFilesDTO;
import honjok.web.dto.ShoppingFilesDTO;


public class ShoppingFileDAO {
	public int uploadFile(ShoppingFilesDTO dto) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "insert into shop_files values(?, shop_files_seq.nextval,?, ?)";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, dto.getProduct_id());
		pstat.setString(2, dto.getShop_original_file_name());
		pstat.setString(3, dto.getShop_system_file_name());
		int result = pstat.executeUpdate();
		con.commit();
		pstat.close();
		con.close();
		return result;
	}
	
	public List<ShoppingFilesDTO> getAllThum_sysFileName() throws Exception {
		
		Connection con = DBUtils.getConnection();
		String sql = "select * from shop_files";
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
		List<ShoppingFilesDTO> list = new ArrayList<>();
		
		while(rs.next()) {
			
			ShoppingFilesDTO tmp = new ShoppingFilesDTO();
			tmp.setProduct_id(rs.getString(1));
			tmp.setFiles_seq(rs.getString(2));
			tmp.setShop_original_file_name(rs.getString(3));
			tmp.setShop_system_file_name(rs.getString(4));
			list.add(tmp);
		}
		
		rs.close();
		pstat.close();
		con.close();
		
		return list;
	}
	
	public List<ShoppingFilesDTO> clickfile(String seq) throws Exception {
		
		Connection con = DBUtils.getConnection();
		String sql = "select * from shop_files where product_id=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		
		pstat.setString(1, seq);
		
		ResultSet rs = pstat.executeQuery();
		List<ShoppingFilesDTO> list = new ArrayList<>();
		
		if(rs.next()) {
			
			ShoppingFilesDTO tmp = new ShoppingFilesDTO();
			tmp.setProduct_id(rs.getString(1));
			tmp.setFiles_seq(rs.getString(2));
			tmp.setShop_original_file_name(rs.getString(3));
			tmp.setShop_system_file_name(rs.getString(4));
			list.add(tmp);
		}
		
		rs.close();
		pstat.close();
		con.close();
		
		return list;
	}
		
}
