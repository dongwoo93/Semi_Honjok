package honjok.web.dao;

import java.io.StringReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import honjok.web.dbutils.DBUtils;
import honjok.web.dto.ShoppingDTO;

public class ShoppingDAO {
	
	public String getBoardSeq() throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select product_seq.nextval from dual";
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
		rs.next();
		String result = rs.getString(1);
		rs.close();
		pstat.close();
		con.close();
		return result;
	}
	
	
	public int insertData(ShoppingDTO dto)throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "insert into product values(?,?,?,?,0,?,?,?)";
		PreparedStatement pstat = con.prepareStatement(sql);
		
		StringReader sr = new StringReader(dto.getProduct_contents());
		
		con.setAutoCommit(false);
		
		pstat.setString(1, dto.getProduct_id());
		pstat.setString(2, dto.getProduct_name());
		pstat.setString(3, dto.getProduct_price());
		pstat.setString(4, dto.getProduct_quantity());
		pstat.setString(5, dto.getProduct_summary());
		pstat.setCharacterStream(6, sr, dto.getProduct_contents().length());
		pstat.setString(7, dto.getProduct_delivery());
		
		int result = pstat.executeUpdate();
		
		con.commit();
		pstat.close();
		con.setAutoCommit(true);
		con.close();

		return result;
	}
	
	public ArrayList<ShoppingDTO> selectData() throws Exception{
		
		Connection con = DBUtils.getConnection();
		String sql = "select * from product";
		PreparedStatement pstat = con.prepareStatement(sql);
		
		ResultSet rs = pstat.executeQuery();
		ArrayList<ShoppingDTO> list = new ArrayList<>();
		while(rs.next()) {
			ShoppingDTO dto = new ShoppingDTO();
			dto.setProduct_id(rs.getString(1));
			dto.setProduct_name(rs.getString(2));
			dto.setProduct_price(rs.getString(3));
			dto.setProduct_quantity(rs.getString(4));
			dto.setProduct_count(rs.getString(5));
			dto.setProduct_summary(rs.getString(6));
			dto.setProduct_contents(rs.getString(7));
			dto.setProduct_delivery(rs.getString(8));
			
			list.add(dto);
		}
		
		rs.close();
		pstat.close();
		con.close();
		
		return list;
	}
	
public ArrayList<ShoppingDTO> clickData(String seq) throws Exception{
		
		Connection con = DBUtils.getConnection();
		String sql = "select * from product where product_id=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		
		pstat.setString(1, seq);
		
		ResultSet rs = pstat.executeQuery();
		ArrayList<ShoppingDTO> list = new ArrayList<>();
		if(rs.next()) {
			ShoppingDTO dto = new ShoppingDTO();
			dto.setProduct_id(rs.getString(1));
			dto.setProduct_name(rs.getString(2));
			dto.setProduct_price(rs.getString(3));
			dto.setProduct_quantity(rs.getString(4));
			dto.setProduct_count(rs.getString(5));
			dto.setProduct_summary(rs.getString(6));
			dto.setProduct_contents(rs.getString(7));
			dto.setProduct_delivery(rs.getString(8));
			
			list.add(dto);
		}
		
		rs.close();
		pstat.close();
		con.close();
		
		return list;
	}
	
	
	
	
}
