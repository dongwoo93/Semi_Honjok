package honjok.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import honjok.web.dto.MemberDTO;
import honjok.web.dbutils.DBUtils;



public class MemberDAO {
	
	public int deleteData(String id, String pw)throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "delete * from member where id=?, pw =?";	
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, id);
		pstat.setString(2, pw);

		int result = pstat.executeUpdate();
		
		con.commit();
		pstat.close();
		con.close();	
		return result;
	}
	
	
	
	
	public boolean isIdExist(String id)throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from member where id =?";
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
	
	public MemberDTO outputData(String id) throws Exception{
		MemberDTO dto = new MemberDTO();
		Connection con = DBUtils.getConnection();
		String sql = "select * from member";		
		PreparedStatement pstat = con.prepareStatement(sql);

		
		ResultSet rs = pstat.executeQuery();	

		while(rs.next()) {
			dto.setId(rs.getString("id"));
			dto.setPw(rs.getString("pw"));
			dto.setName(rs.getString("name"));
			dto.setPhone(rs.getString("phone"));
			dto.setEmail(rs.getString("email"));
			dto.setZipcode(rs.getString("zipcode"));
			dto.setAddress(rs.getString("address"));
			dto.setGender(rs.getString("gender"));

		}	

		con.commit();
		pstat.close();	
		con.close();

		return dto;
	}
	


	
//	public int updateData(MemberDTO dto, String user) throws Exception{
//		Connection con = DBUtils.getConnection();
//		String sql = "update member set id = ?, name = ?, phone = ?,  email = ?, zipcode = ?, address = ?, address2 = ? where id = ?";		
//		PreparedStatement pstat = con.prepareStatement(sql);
//
//		pstat.setString(1, dto.getId());
//		pstat.setString(2, dto.getName());
//		pstat.setString(3, dto.getPhone());
//		pstat.setString(4, dto.getPw());
//		pstat.setString(5, dto.getPhone3());
//		pstat.setString(6, dto.getEmail());
//		pstat.setString(7, dto.getZipcode());
//		pstat.setString(8, dto.getAddress());
//		pstat.setString(9, dto.getAddress2());
//		pstat.setString(10, user);
//
//		int result =  pstat.executeUpdate();
//
//
//		con.commit();
//		pstat.close();	
//		con.close();
//
//		return result;
//	}
//
//	



}
