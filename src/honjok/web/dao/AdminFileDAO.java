package honjok.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import honjok.web.dbutils.DBUtils;
import honjok.web.dto.AdminFilesDTO;

public class AdminFileDAO {
	
	public List<AdminFilesDTO> getThum_sysFileName() throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select article_no, file_seq, thum_sysFileName from admin_files order by article_no desc";
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
		List<AdminFilesDTO> list = new ArrayList<>();
		while(rs.next()) {
			AdminFilesDTO tmp = new AdminFilesDTO();
			tmp.setArticle_no(rs.getString(1));
			tmp.setFile_seq(rs.getString(2));
			tmp.setThum_sysFileName(rs.getString(3));
			list.add(tmp);
		}
		
		rs.close();
		pstat.close();
		con.close();
		return list;
	}
	
	
	public String isExsitThum_sysFile(String seq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select thum_sysFileName from admin_files where file_seq = ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, Integer.parseInt(seq));
		ResultSet rs = pstat.executeQuery();
		rs.next();
		String thum_sysFileName = rs.getString("thum_sysFileName");
		rs.close();
		pstat.close();
		con.close();
		return thum_sysFileName;
	}
	
	public List<AdminFilesDTO> getNote_sysFileName(String seq) throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "select note_sysFileName from admin_files where files_seq = ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, Integer.parseInt(seq));
		ResultSet rs = pstat.executeQuery();
		List<AdminFilesDTO> list = new ArrayList<>();
		while(rs.next()) {
			AdminFilesDTO dto = new AdminFilesDTO();
			dto.setNote_sysFileName(rs.getString("note_sysFileName"));
			list.add(dto);
		}
		rs.close();
		pstat.close();
		con.close();
		return list;
	}
	
	public int insertThum_FileName(String seq, String systemFileName, String originalFileName) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "insert into admin_files values(?, admin_files_seq.nextval, null, ?, ?)";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, Integer.parseInt(seq));
		pstat.setString(2, systemFileName);
		pstat.setString(3, originalFileName);
		int result = pstat.executeUpdate();
		con.commit();
		pstat.close();
		con.close();
		return result;
	}
	
}
