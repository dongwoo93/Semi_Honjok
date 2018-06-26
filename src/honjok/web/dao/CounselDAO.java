package honjok.web.dao;

import java.io.Reader;
import java.io.StringReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import honjok.web.dto.CounselDTO;
import kh.web.dbutils.DBUtils;

public class CounselDAO {
	public List<CounselDTO> selectData() throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "select board_coun.*, row_number() over(order by coun_writedate desc) as num from board_coun";
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
		List<CounselDTO> list = new ArrayList<>();
		StringBuffer sb = new StringBuffer();
		while(rs.next()) {
			CounselDTO dto = new CounselDTO();
			dto.setSeq(rs.getInt(1));
			dto.setTitle(rs.getString(2));
			dto.setWriter(rs.getString(3));
			Reader instream = rs.getCharacterStream("coun_contents");
			char[] buffer = new char[1024];  // create temporary buffer for read
			int length = 0;   // length of characters read
			// fetch data  
			while ((length = instream.read(buffer)) != -1)  {
				for (int i=0; i<length; i++){
					sb.append(buffer[i]);
				} 
			}
			instream.close();// Close input stream
			dto.setContents(sb.toString());
			dto.setHeader(rs.getString(5));
			dto.setViewcount(rs.getInt(6));
			dto.setLike(rs.getInt(7));
			dto.setWritedate(rs.getString(8));
			dto.setIp(rs.getString(9));
			list.add(dto);
		}
		pstat.close();
		con.close();
		System.out.println(list.get(8).getSeq());
		return list;
	}
	public List<CounselDTO> selectHeader1Data() throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select board_coun.*, row_number() over(order by coun_writedate desc) as num from board_coun where coun_header='히오스'";
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
	List<CounselDTO> list = new ArrayList<>();
		StringBuffer sb = new StringBuffer();
		while(rs.next()) {
			CounselDTO dto = new CounselDTO();
			dto.setSeq(rs.getInt(1));
			dto.setTitle(rs.getString(2));
			dto.setWriter(rs.getString(3));
			Reader instream = rs.getCharacterStream("coun_contents");
			char[] buffer = new char[1024];  // create temporary buffer for read
			int length = 0;   // length of characters read
			// fetch data  
			while ((length = instream.read(buffer)) != -1)  {
				for (int i=0; i<length; i++){
					sb.append(buffer[i]);
				} 
			}
			instream.close();// Close input stream
			dto.setContents(sb.toString());
			dto.setHeader(rs.getString(5));
			dto.setViewcount(rs.getInt(6));
			dto.setLike(rs.getInt(7));
			dto.setWritedate(rs.getString(8));
			dto.setIp(rs.getString(9));
			list.add(dto);
		}
		pstat.close();
		con.close();
		return list;
	}
	public List<CounselDTO> selectHeader2Data() throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select board_coun.*, row_number() over(order by coun_writedate desc) as num from board_coun where coun_header='와우'";
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
		List<CounselDTO> list = new ArrayList<>();
		StringBuffer sb = new StringBuffer();
		while(rs.next()) {
			CounselDTO dto = new CounselDTO();
			dto.setSeq(rs.getInt(1));
			dto.setTitle(rs.getString(2));
			dto.setWriter(rs.getString(3));
			Reader instream = rs.getCharacterStream("coun_contents");
			char[] buffer = new char[1024];  // create temporary buffer for read
			int length = 0;   // length of characters read
			// fetch data  
			while ((length = instream.read(buffer)) != -1)  {
				for (int i=0; i<length; i++){
					sb.append(buffer[i]);
				} 
			}
			instream.close();// Close input stream
			dto.setContents(sb.toString());
			dto.setHeader(rs.getString(5));
			dto.setViewcount(rs.getInt(6));
			dto.setLike(rs.getInt(7));
			dto.setWritedate(rs.getString(8));
			dto.setIp(rs.getString(9));
			list.add(dto);
		}
		pstat.close();
		con.close();
		return list;
	}
	public List<CounselDTO> selectHeader3Data() throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select board_coun.*, row_number() over(order by coun_writedate desc) as num from board_coun where coun_header='배그'";
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
		List<CounselDTO> list = new ArrayList<>();
		StringBuffer sb = new StringBuffer();
		while(rs.next()) {
			CounselDTO dto = new CounselDTO();
			dto.setSeq(rs.getInt(1));
			dto.setTitle(rs.getString(2));
			dto.setWriter(rs.getString(3));
			Reader instream = rs.getCharacterStream("coun_contents");
			char[] buffer = new char[1024];  // create temporary buffer for read
			int length = 0;   // length of characters read
			// fetch data  
			while ((length = instream.read(buffer)) != -1)  {
				for (int i=0; i<length; i++){
					sb.append(buffer[i]);
				} 
			}
			instream.close();// Close input stream
			dto.setContents(sb.toString());
			dto.setHeader(rs.getString(5));
			dto.setViewcount(rs.getInt(6));
			dto.setLike(rs.getInt(7));
			dto.setWritedate(rs.getString(8));
			dto.setIp(rs.getString(9));
			list.add(dto);
		}
		pstat.close();
		con.close();
		return list;
	}
	
//	public int insertData(CounselDTO dto) throws Exception {
//		Connection con = DBUtils.getConnection();
//		String sql = "insert into board_coun values(board_coun_seq.nextval,?,?,?,?,sysdate,?,?)";
//		PreparedStatement pstat = con.prepareStatement(sql);
//		pstat.setString(1, dto.getHeader());
//		pstat.setString(2, dto.getTitle());
//		pstat.setString(3, dto.getContents());
//		pstat.setString(4, dto.getWriter());
//		pstat.setInt(5, dto.getViewcount());
//		pstat.setString(6, dto.getIp());
//		int result = pstat.executeUpdate();
//
//		pstat.close();
//		con.commit();
//		con.close();
//		return result;
//	}

	public int insertData1(CounselDTO dto) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "insert into board_coun values(board_coun_seq.nextval,?,?,?,?,sysdate,?,?)";
		PreparedStatement pstat = con.prepareStatement(sql);
		StringReader sr = new StringReader(dto.getContents());
		con.setAutoCommit(false);

		pstat.setString(1, dto.getTitle());
		pstat.setString(2, dto.getWriter());
		pstat.setCharacterStream(3, sr, dto.getContents().length());
		pstat.setString(4, dto.getHeader());
		pstat.setString(5, dto.getWritedate());
		pstat.setString(6, dto.getIp());

		int result = pstat.executeUpdate();
		con.commit();
		con.setAutoCommit(true);
		pstat.close();
		con.close();
		return result;

		
	}
}
