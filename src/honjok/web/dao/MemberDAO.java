package honjok.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kh.web.dbutils.DBUtils;



public class MemberDAO {
	
	public int deleteData(String id)throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "delete from member where id = ?";	
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, id);

		int result = pstat.executeUpdate();
		con.commit();
		pstat.close();
		con.close();	
		return result;
	}
	
	
	
	
	public boolean isIdExist(String id)throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from member where id = ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, id);
		ResultSet rs = pstat.executeQuery();

		boolean result = rs.next();

		rs.close();
		pstat.close();
		con.close();
		return result;

	}
	
	
	
	
	
	
	

	public int insertData(String id, String pw, String name, String phone, String email,String zipcode,String address,String gender) throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "insert into member values(?,?,?,?,?,?,?,?)";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, id);
		pstat.setString(2, pw);
		pstat.setString(3, name);
		pstat.setString(4, phone);
		pstat.setString(5, email);
		pstat.setString(6, zipcode);
		pstat.setString(7, address);
		pstat.setString(8, gender);

		int result = pstat.executeUpdate();
		
		con.commit();
		pstat.close();

		con.close();	
		return result;

	}



}
