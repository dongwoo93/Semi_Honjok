package honjok.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import honjok.web.dbutils.DBUtils;
import honjok.web.dto.MemberDTO;



public class MemberDAO {

	public boolean idpwCheck(String id, String pw)throws Exception{
		boolean b = false;
		Connection con = DBUtils.getConnection();

		String sql = "select * from member where member_id=? and member_pw=?";
		PreparedStatement pstat = con.prepareStatement(sql);

		pstat.setString(1, id);
		pstat.setString(2, pw);

		ResultSet rs = pstat.executeQuery();

		if(rs.next()) {
			b=true;
		}


		rs.close();
		con.close();
		pstat.close();

		return b;

	}

	public int deleteData(String id, String pw)throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "delete from member where member_id=? and member_pw =?";	
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, id);
		pstat.setString(2, pw);

		int result = pstat.executeUpdate();

		con.commit();
		pstat.close();
		con.close();	
		return result;
	}
	
	public int deleteData(String id)throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "delete from member where member_id=?";	
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
		String sql = "select * from member where member_id =?";
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
		String sql = "insert into member values(?,?,?,?,?,?,?,?,null)";
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

	public ArrayList<MemberDTO> outputData(String id) throws Exception{

		Connection con = DBUtils.getConnection();
		String sql = "select * from member where member_id=?";  

		PreparedStatement pstat = con.prepareStatement(sql);

		pstat.setString(1, id);

		ResultSet rs = pstat.executeQuery();
		
		ArrayList<MemberDTO> al = new ArrayList<>();

		while(rs.next()) {
			MemberDTO dto = new MemberDTO();
			dto.setId(rs.getString(1));
			dto.setPw(rs.getString(2));
			dto.setName(rs.getString(3));
			dto.setPhone(rs.getString(4));
			dto.setEmail(rs.getString(5));
            dto.setZipcode(rs.getString(6));
			dto.setAddress(rs.getString(7));
			dto.setGender(rs.getString(8));
			dto.setPortal(rs.getString(9));
			al.add(dto);
			
		}	
		con.commit();
		pstat.close();	
		con.close();

		return al;
	}


	public int kakaoInsertData(String id, String name, String email) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "insert into member values(?,null,?,null,?,null,null,null,'kakao')";

		PreparedStatement pstat = con.prepareStatement(sql);

		pstat.setString(1, id);
		pstat.setString(2, name);
		pstat.setString(3, email);

		int result = pstat.executeUpdate();

		con.commit();
		pstat.close();
		con.close();


		return result;

	}

	public int naverInserData(String id, String name, String email, String gender) throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "insert into member values(?,null,?,null,?,null,null,?,'naver')";

		PreparedStatement pstat = con.prepareStatement(sql);

		pstat.setString(1, id);
		pstat.setString(2, name);
		pstat.setString(3, email);
		pstat.setString(4, gender);

		int result = pstat.executeUpdate();

		con.commit();
		pstat.close();
		con.close();



		return result;
	}

	public int googleInsertData(String id, String name, String email) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "insert into member values(?,null,?,null,?,null,null,null,'google')";

		PreparedStatement pstat = con.prepareStatement(sql);

		pstat.setString(1, id);
		pstat.setString(2, name);
		pstat.setString(3, email);

		int result = pstat.executeUpdate();

		con.commit();
		pstat.close();
		con.close();



		return result;

	}

	public boolean idCheck(String id) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from member where member_id = ?";

		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, id);
		ResultSet rs = pstat.executeQuery();

		boolean result = false;

		if(rs.next()) {
			result = true;
		}

		pstat.close();
		con.close();
		rs.close();

		return result;
	}

	public int updateData(String id, String pw,String name,String phone,String email,String zipcode,String address) throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "update member set member_pw =?, member_name =?, member_phone =?, member_email =?, member_zipcode =?, member_address=? where member_id=?";		
		PreparedStatement pstat = con.prepareStatement(sql);
		
		pstat.setString(1, pw);
		pstat.setString(2, name);
		pstat.setString(3, phone);
		pstat.setString(4, email);
		pstat.setString(5, zipcode);
		pstat.setString(6, address);
		pstat.setString(7, id);
		
		int result = pstat.executeUpdate();
	
		con.commit();
		pstat.close();	
		con.close();

		return result;
	}

}
