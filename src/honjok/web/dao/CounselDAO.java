package honjok.web.dao;

import java.io.Reader;
import java.io.StringReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import honjok.web.dto.BoardQnaDTO;
import honjok.web.dto.CounselDTO;
import kh.web.dbutils.DBUtils;

public class CounselDAO {
	public List<CounselDTO> selectData(int startNum, int endNum) throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "select * from (select board_coun.*, row_number() over(order by coun_writedate desc) as num from board_coun) board_coun";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, startNum);
		pstat.setInt(2, endNum);
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
	public List<CounselDTO> selectHeader1Data(int startNum, int endNum) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from (select board_coun.*, row_number() over(order by coun_writedate desc) as num from board_coun where coun_header='히오스') where num between ? and ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, startNum);
		pstat.setInt(2, endNum);
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
	public List<CounselDTO> selectHeader2Data(int startNum, int endNum) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from (select board_coun.*, row_number() over(order by coun_writedate desc) as num from board_coun where coun_header='와우') where num between ? and ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, startNum);
		pstat.setInt(2, endNum);
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
	public List<CounselDTO> selectHeader3Data(int startNum, int endNum) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from (select board_coun.*, row_number() over(order by coun_writedate desc) as num from board_coun where coun_header='배그') where num between ? and ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, startNum);
		pstat.setInt(2, endNum);
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
	public int insertData(CounselDTO dto) throws Exception {
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
	public List<CounselDTO> readData(int seq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from board_coun where qna_coun=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, seq);
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
	public String getPageNavi(int currentPage) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select count(*) totalCount from board_coun";
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
		rs.next();

		int recordTotalCount = rs.getInt("totalCount");//전체 글(레코드)의 갯수를 저장하는 변수
		int recordCountPerPage = 10; // 한 페이지에 게시글이 표시되는 갯수
		int naviCountPerPage = 10; // 한 페이지에 표시되는 네이게이터의 갯수
		int pageTotalCount = 0; // 전체가 몇 페이지로 구성될 것인지

		if(recordTotalCount % recordCountPerPage > 0) { //10으로 나누어 떨어지지 않음
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		}else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}



		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (currentPage - 1)/ naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi + (naviCountPerPage - 1);

		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}


		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi == 1) {
			needPrev = false;
		}

		if(endNavi == pageTotalCount) {
			needNext = false;
		}

		StringBuilder sb = new StringBuilder();

		if(needPrev) {
			sb.append("<a href='counselView.coun?currentPage="+(startNavi-1)+"'< </a>");
		}
		for(int i = startNavi;i <= endNavi;i++) {
			if(currentPage == i) {
				sb.append("<a href='counselView.coun?currentPage=" + i + "'> <b>" + i + "</b></a>");
			}else {
				sb.append("<a href='counselView.coun?currentPage=" + i + "'> " + i + "</a>");
			}
		}
		if(needNext) {
			sb.append("<a href='counselView.coun?currentPage="+(endNavi+1)+"'>></a>");
		}

		System.out.println(sb.toString());

		String result = sb.toString();
		con.close();
		pstat.close();

		return result;
	}
}
