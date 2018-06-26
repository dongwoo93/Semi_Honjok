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
		String sql = "select board_tip_seq.nextval from dual";
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
		String sql = "insert into board_tip values(?, ?, ?, ?, ?, 0, 0, sysdate, ?, ?)";
		PreparedStatement pstat = con.prepareStatement(sql);
		StringReader sr = new StringReader(dto.getContents());
		//con.setAutoCommit(false);

		pstat.setInt(1, Integer.parseInt(dto.getSeq()));
		pstat.setString(2, dto.getCategory());
		pstat.setString(3, dto.getSubject());
		pstat.setString(4, dto.getTitle());
		pstat.setCharacterStream(5, sr, dto.getContents().length());
		pstat.setString(6, dto.getSystemFileName());
		pstat.setString(7, dto.getOriginalFileName());

		int result = pstat.executeUpdate();
		con.commit();
		pstat.close();
		//con.setAutoCommit(true);
		con.close();
		return result;
	}
	
	public String getPageNavi(int currentPage) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select count(*) totalCount from board_tip";
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
		rs.next();
		int recordTotalCount = rs.getInt(1);
		// rs.getInt("totalCount");  전체 글(레코드) 의 개수를 저장하는 변수
		int recordCountPerPage = 10; // 한 페이지에서 게시글이 몇개 보일건지
		int naviCountPerPage = 10; // 한 페이지에서 네비게이터가 몇개씩 보일건지
		int pageTotalCount = 0; // 전체가 몇페이지로 구성 될것인지

		if(recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		}else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}


		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		} // 현재 페이지가 비정상인지 검증하는 코드

		//-----------------------------------------------------


		int startNavi = (currentPage-1) / naviCountPerPage * naviCountPerPage + 1; //네비게이터가 시작 하는 값
		int endNavi = startNavi + (naviCountPerPage - 1); // 네비게이터 끝 값
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		//		System.out.println("현재 페이지 : " + currentPage);
		//		System.out.println("네비게이터 시작 : " + startNavi);
		//		System.out.println("네비게이터 끝 : " + endNavi);

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
			sb.append("<a href='select.tip?currentPage="+(startNavi-1)+"' class='navi'>" + "< " + " </a>");
		}


		for(int i = startNavi; i <= endNavi; i++) {
			if(currentPage == i) {
				sb.append("<a href='select.tip?currentPage="+i+"' class='navi' id="+i+"> <b>" + i + "</b> </a>");
			}else {
				sb.append("<a href='select.tip?currentPage="+i+"' class='navi' id="+i+">" + i + " </a>");
			}


		}

		if(needNext) {
			sb.append("<a href='select.tip?currentPage="+(endNavi+1)+"' class='navi'>" + ">" + " </a>");
		}

		//		System.out.println(sb.toString());
		
		pstat.close();
		con.close();
		return sb.toString();
	}
	
	public List<BoardDTO> selectData(int startNum, int endNum) throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "select * from (select board_tip.*, row_number() over(order by tip_writedate desc) as num from board_tip)\r\n" + 
				"where num between ? and ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, startNum);
		pstat.setInt(2, endNum);
		ResultSet rs = pstat.executeQuery();
		List<BoardDTO> list = new ArrayList<>();
		
		Reader instream = null;
		while(rs.next()) {
			StringBuffer sb = new StringBuffer();
			BoardDTO dto = new BoardDTO();
			dto.setSeq(rs.getString(1));
			dto.setCategory(rs.getString(2));
			dto.setSubject(rs.getString(3));
			dto.setTitle(rs.getString(4));
			dto.setViewcount(rs.getInt(6));
			dto.setLike(rs.getInt(7));
			dto.setWritedate(rs.getString(8));
			dto.setSystemFileName(rs.getString(9));
			dto.setOriginalFileName(rs.getString(10));
			instream = rs.getCharacterStream("tip_contents");
			char[] buffer = new char[1024];  // create temporary buffer for read
			int length = 0;   // length of characters read
			// fetch data  
			while ((length = instream.read(buffer)) != -1)  {
				for (int i=0; i<length; i++){
					sb.append(buffer[i]);
				} 
			}
			
			dto.setContents(sb.toString());
			System.out.println(dto.getContents());
			list.add(dto);
			
			
		}
		
		System.out.println("실행된다");
		instream.close();// Close input stream
		pstat.close();
		con.close();
		return list;
	}
	
}
