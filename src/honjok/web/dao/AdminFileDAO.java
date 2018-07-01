package honjok.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import honjok.web.dbutils.DBUtils;
import honjok.web.dto.AdminFilesDTO;

public class AdminFileDAO {
	
	public List<AdminFilesDTO> getAllThum_sysFileName(String category) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select article_no, files_seq, thum_sysFileName from admin_files where category=? order by article_no desc";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, category);
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
	
	public List<AdminFilesDTO> getSubThum_sysFileName(String category, String subject) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select article_no, files_seq, thum_sysFileName from admin_files where category=? and subject=? order by article_no desc";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, category);
		pstat.setString(2, subject);
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
	
	public List<AdminFilesDTO> getThum_sysFileName() throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select article_no, files_seq, thum_sysFileName from admin_files order by article_no desc";
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
	
	
	public AdminFilesDTO isExsitThum_sysFile(String seq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select thum_sysFileName, thum_orgFileName from admin_files where files_seq = ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, Integer.parseInt(seq));
		ResultSet rs = pstat.executeQuery();
		AdminFilesDTO fileDTO = new AdminFilesDTO();
		while(rs.next()) {
		fileDTO.setThum_sysFileName(rs.getString("thum_sysFileName"));
	    fileDTO.setThum_orgFileName(rs.getString("thum_orgFileName")); ;
		}
		rs.close();
		pstat.close();
		con.close();
		return fileDTO;
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
			//dto.setNote_sysFileName(rs.getString("note_sysFileName"));
			list.add(dto);
		}
		rs.close();
		pstat.close();
		con.close();
		return list;
	}
	
	public int insertThumb_FileName(AdminFilesDTO fileDTO) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "insert into admin_files values(?, admin_files_seq.nextval, ?, ?, ?, ?)";
		PreparedStatement pstat = con.prepareStatement(sql);
		System.out.println(fileDTO.getArticle_no());
		System.out.println(fileDTO.getThum_sysFileName());
		pstat.setInt(1, Integer.parseInt(fileDTO.getArticle_no()));
		pstat.setString(2, fileDTO.getCategory());
		pstat.setString(3, fileDTO.getSubject());
		pstat.setString(4, fileDTO.getThum_sysFileName());
		pstat.setString(5, fileDTO.getThum_orgFileName());
		int result = pstat.executeUpdate();
		con.commit();
		pstat.close();
		con.close();
		return result;
	}
	
}
