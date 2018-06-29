package honjok.web.dao;

import java.io.Reader;
import java.io.StringReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import honjok.web.dbutils.DBUtils;
import honjok.web.dto.BoardDTO;

public class BoardTipDAO {
	public String getBoardSeq() throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select admin_board_seq.nextval from dual";
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
		rs.next();
		String result = rs.getString(1);
		pstat.close();
		con.close();
		return result;
	}
	
	public int insertData(BoardDTO dto) throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "insert into admin_board values(?, ?, ?, ?, ?, 0, 0, sysdate)";
		PreparedStatement pstat = con.prepareStatement(sql);
		StringReader sr = new StringReader(dto.getContents());
		con.setAutoCommit(false);
		pstat.setInt(1, Integer.parseInt(dto.getSeq()));
		pstat.setString(2, dto.getCategory());
		pstat.setString(3, dto.getSubject());
		pstat.setString(4, dto.getTitle());
		pstat.setCharacterStream(5, sr, dto.getContents().length());

		int result = pstat.executeUpdate();
		con.commit();
		pstat.close();
		con.setAutoCommit(true);
		con.close();
		
		return result;
	}
	
	public String getPageNavi(int currentPage) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select count(*) totalCount from admin_board";
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
		rs.next();
		int recordTotalCount = rs.getInt(1);
		// rs.getInt("totalCount");  占쏙옙체 占쏙옙(占쏙옙占쌘듸옙) 占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싹댐옙 占쏙옙占쏙옙
		int recordCountPerPage = 8; // 占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쌉시깍옙占쏙옙 占쏘개 占쏙옙占싹곤옙占쏙옙
		int naviCountPerPage = 10; // 占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쌓븝옙占쏙옙占쏙옙叩占� 占쏘개占쏙옙 占쏙옙占싹곤옙占쏙옙
		int pageTotalCount = 0; // 占쏙옙체占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占심곤옙占쏙옙占쏙옙

		if(recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		}else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}


		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		} // 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싹댐옙 占쌘듸옙

		//-----------------------------------------------------


		int startNavi = (currentPage-1) / naviCountPerPage * naviCountPerPage + 1; //占쌓븝옙占쏙옙占쏙옙叩占� 占쏙옙占쏙옙 占싹댐옙 占쏙옙
		int endNavi = startNavi + (naviCountPerPage - 1); // 占쌓븝옙占쏙옙占쏙옙占� 占쏙옙 占쏙옙
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
			//sb.append("<li class='page-item'><a class='page-link' href='select.tip?currentPage="+(startNavi-1)+"' class='navi'>"+"Previous"+"</a></li>");
			sb.append("<li class='page-item'><a class='page-link' href='select.tip?currentPage="+(startNavi-1)+"' aria-label='Previous'> <span aria-hidden='true'>&laquo;</span>" + "<span class='sr-only'>"+"Previous"+"</span></a></li>");

			//sb.append("<a href='select.tip?currentPage="+(startNavi-1)+"' class='navi'>" + "< " + " </a>");
		}


		for(int i = startNavi; i <= endNavi; i++) {
			if(currentPage == i) {
				sb.append("<li class='page-item active'><a class='page-link' href='selectNavi.tip?currentPage="+i+"' id="+i+">" + i + "</a></li>");
				//sb.append("<a href='select.tip?currentPage="+i+"' class='navi' id="+i+"> <b>" + i + "</b> </a>");
			}else {
				sb.append("<li class='page-item'><a class='page-link' href='selectNavi.tip?currentPage="+i+"' id="+i+">" + i + "</a></li>");
				//sb.append("<a href='select.tip?currentPage="+i+"' class='navi' id="+i+">" + i + " </a>");
			}
		}

		if(needNext) {
			//sb.append("<li class='page-item'><a class='page-link' href='select.tip?currentPage="+(endNavi+1)+"' class='navi'>" + "Next" + "</a></li>");
			sb.append("<li class='page-item'><a class='page-link' href='select.tip?currentPage="+(endNavi+1)+"' aria-label='Next'> <span aria-hidden='true'>&raquo;</span>" + "<span class='sr-only'>" + "Next" + "</a></li>");
			//sb.append("<a href='select.tip?currentPage="+(endNavi+1)+"' class='navi'>" + ">" + " </a>");
		}
		
		
		pstat.close();
		con.close();
		return sb.toString();
	}
	
	public List<BoardDTO> selectAllData(String seq) throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "select * from admin_board where seq = ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, Integer.parseInt(seq));
		ResultSet rs = pstat.executeQuery();
		List<BoardDTO> list = new ArrayList<>();
		
		
		while(rs.next()) {
			StringBuffer sb = new StringBuffer();
			BoardDTO dto = new BoardDTO();
			dto.setSeq(String.valueOf(rs.getInt(1)));
			dto.setCategory(rs.getString(2));
			dto.setSubject(rs.getString(3));
			dto.setTitle(rs.getString(4));
			dto.setViewcount(rs.getInt(6));
			dto.setLike(rs.getInt(7));
			dto.setWritedate(rs.getString(8));
			Reader instream = rs.getCharacterStream("contents");
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
			list.add(dto);
		}
		pstat.close();
		con.close();
		return list;
	}
	
	public List<BoardDTO> selectNaviData(int startNum, int endNum) throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "select * from (select admin_board.*, row_number() over(order by writedate desc) as num from admin_board)\r\n" + 
				"where num between ? and ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, startNum);
		pstat.setInt(2, endNum);
		ResultSet rs = pstat.executeQuery();
		List<BoardDTO> list = new ArrayList<>();
		
		while(rs.next()) {
			BoardDTO dto = new BoardDTO();
			dto.setSeq(String.valueOf(rs.getInt(1)));
			dto.setCategory(rs.getString(2));
			dto.setSubject(rs.getString(3));
			dto.setTitle(rs.getString(4));
			dto.setContents("");
			dto.setViewcount(rs.getInt(6));
			dto.setLike(rs.getInt(7));
			dto.setWritedate(rs.getString(8));
			list.add(dto);
		}
		pstat.close();
		con.close();
		return list;
	}
	
	public int deleteData(String seq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "delete from admin_board where seq = ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, Integer.parseInt(seq));
		int result = pstat.executeUpdate();
		con.commit();
		pstat.close();
		con.close();
		return result;
	}
}
