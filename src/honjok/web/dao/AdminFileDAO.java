package honjok.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import honjok.web.dbutils.DBUtils;
import honjok.web.dto.AdminFilesDTO;

public class AdminFileDAO {
	
	public List<AdminFilesDTO> getAllThum_sysFileName(int startNum, int endNum, String category) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from (select admin_files.*, row_number() over(order by article_no desc) as num from admin_files where category=?)\r\n" + 
				"where num between ? and ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, category);
		pstat.setInt(2, startNum);
		pstat.setInt(3, endNum);
		ResultSet rs = pstat.executeQuery();
		List<AdminFilesDTO> list = new ArrayList<>();
		while(rs.next()) {
			AdminFilesDTO tmp = new AdminFilesDTO();
			tmp.setArticle_no(rs.getString(1));
			tmp.setFile_seq(rs.getString(2));
			tmp.setThum_sysFileName(rs.getString(5));
			list.add(tmp);
		}
		
		rs.close();
		pstat.close();
		con.close();
		return list;
	}
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
	
	public List<AdminFilesDTO> getSubThum_sysFileName(String category, String subject) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select article_no, file_seq, thum_sysFileName from admin_files where category=? and subject=? order by article_no desc";
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
	
	public AdminFilesDTO isExsitThum_sysFile(String seq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select thum_sysFileName, thum_orgFileName from admin_files where article_no = ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, Integer.parseInt(seq));
		ResultSet rs = pstat.executeQuery();
		AdminFilesDTO fileDTO = new AdminFilesDTO();
		while(rs.next()) {
		fileDTO.setThum_sysFileName(rs.getString("thum_sysFileName"));
	    fileDTO.setThum_orgFileName(rs.getString("thum_orgFileName"));
		}
		rs.close();
		pstat.close();
		con.close();
		return fileDTO;
	}
	
	public List<String> getNote_sysFileName(String seq) throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "select content_img from admin_conImg where article_no = ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, Integer.parseInt(seq));
		ResultSet rs = pstat.executeQuery();
		List<String> list = new ArrayList<>();
		while(rs.next()) {
			list.add(rs.getString("content_img"));
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
	
	public int updateThumb_FileName(AdminFilesDTO fileDTO) throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "update admin_files set category=?, subject=?, thum_sysFileName=?, thum_orgFileName=? where article_no=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, fileDTO.getCategory());
		pstat.setString(2, fileDTO.getSubject());
		pstat.setString(3, fileDTO.getThum_sysFileName());
		pstat.setString(4, fileDTO.getThum_orgFileName());
		pstat.setInt(5, Integer.parseInt(fileDTO.getArticle_no()));
		int result = pstat.executeUpdate();
		con.commit();
		pstat.close();
		con.close();
		return result;
	}
	public int[] insertContentsImg(String seq, String[] fileList) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "insert into admin_conImg values(?, admin_conImg_seq.nextval, ?)";
		PreparedStatement pstat = con.prepareStatement(sql);
		int batchSize = fileList.length;
		int count = 0;
		for (int i=0;i < batchSize;i++) {
			pstat.setInt(1, Integer.parseInt(seq));
			pstat.setString(2, fileList[i]);
			pstat.addBatch();
			if(++count % batchSize == 0) {
				pstat.executeBatch();
			}
		}
		
		int[] result = pstat.executeBatch();
		con.commit();
		pstat.close();
		con.close();
		return result;
	}
	
}
