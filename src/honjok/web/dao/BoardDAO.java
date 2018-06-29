package honjok.web.dao;

import java.io.Reader;
import java.io.StringReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import honjok.web.dto.BoardFreeDTO;
import honjok.web.dto.BoardUserDTO;
import honjok.web.dto.CommentFreeDTO;
import kh.web.dbutils.DBUtils;

public class BoardDAO {	
	public List<BoardUserDTO> selectFree() throws Exception {

		Connection con = DBUtils.getConnection();
		String sql = "select board_user.*, row_number() over(order by user_writedate desc) as num from board_user where user_category='free'";
		
		PreparedStatement pstat = con.prepareStatement(sql);
		
		ResultSet rs = pstat.executeQuery();
		List<BoardUserDTO> list = new ArrayList<>(); 
		
		
		while(rs.next()) {
			BoardUserDTO dto = new BoardUserDTO();
			dto.setSeq(rs.getInt(1));
			dto.setTitle(rs.getString(4));
			dto.setWriter(rs.getString(5));
			dto.setContents(rs.getString(6));
			list.add(dto);
		}
		
			pstat.close();
			con.close();
			
			return list;
	
	}
	public List<BoardUserDTO> selectData(int startNum, int endNum) throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "select * from (select board_user.*, row_number() over(order by user_writedate desc) as num from board_user where user_category='free') where num between ? and ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, startNum);
		pstat.setInt(2, endNum);
		ResultSet rs = pstat.executeQuery();
		List<BoardUserDTO> list = new ArrayList<>();
		StringBuffer sb = new StringBuffer();
		while(rs.next()) {
			BoardUserDTO dto = new BoardUserDTO();
			dto.setSeq(rs.getInt(1));
			dto.setCat_seq(rs.getInt(2));
			dto.setCategory(rs.getString(3));
			dto.setTitle(rs.getString(4));
			dto.setWriter(rs.getString(5));
			Reader instream = rs.getCharacterStream("user_contents");
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
			dto.setHeader(rs.getString(7));
			dto.setViewcount(rs.getInt(8));
			dto.setLike(rs.getInt(9));
			dto.setWritedate(rs.getString(10));
			dto.setIp(rs.getString(11));
			list.add(dto);
		}
		pstat.close();
		con.close();
		return list;
	}
	public List<BoardUserDTO> selectHeader1Data(int startNum, int endNum) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from (select board_user.*, row_number() over(order by user_writedate desc) as num from board_user where user_category='free' and user_header='잡담') where num between ? and ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, startNum);
		pstat.setInt(2, endNum);
		ResultSet rs = pstat.executeQuery();
		List<BoardUserDTO> list = new ArrayList<>();
		StringBuffer sb = new StringBuffer();
		while(rs.next()) {
			BoardUserDTO dto = new BoardUserDTO();
			dto.setSeq(rs.getInt(1));
			dto.setCat_seq(rs.getInt(2));
			dto.setCategory(rs.getString(3));
			dto.setTitle(rs.getString(4));
			dto.setWriter(rs.getString(5));
			Reader instream = rs.getCharacterStream("user_contents");
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
			dto.setHeader(rs.getString(7));
			dto.setViewcount(rs.getInt(8));
			dto.setLike(rs.getInt(9));
			dto.setWritedate(rs.getString(10));
			dto.setIp(rs.getString(11));
			list.add(dto);
		}
		pstat.close();
		con.close();
		return list;
	}
	public List<BoardUserDTO> selectHeader2Data(int startNum, int endNum) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from (select board_user.*, row_number() over(order by user_writedate desc) as num from board_user where user_category='free' and user_header='유머') where num between ? and ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, startNum);
		pstat.setInt(2, endNum);
		ResultSet rs = pstat.executeQuery();
		List<BoardUserDTO> list = new ArrayList<>();
		StringBuffer sb = new StringBuffer();
		while(rs.next()) {
			BoardUserDTO dto = new BoardUserDTO();
			dto.setSeq(rs.getInt(1));
			dto.setCat_seq(rs.getInt(2));
			dto.setCategory(rs.getString(3));
			dto.setTitle(rs.getString(4));
			dto.setWriter(rs.getString(5));
			Reader instream = rs.getCharacterStream("user_contents");
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
			dto.setHeader(rs.getString(7));
			dto.setViewcount(rs.getInt(8));
			dto.setLike(rs.getInt(9));
			dto.setWritedate(rs.getString(10));
			dto.setIp(rs.getString(11));
			list.add(dto);
		}
		pstat.close();
		con.close();
		return list;
	}
	public List<BoardUserDTO> selectHeader3Data(int startNum, int endNum) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from (select board_user.*, row_number() over(order by user_writedate desc) as num from board_user where user_category='free' and user_header='동물') where num between ? and ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, startNum);
		pstat.setInt(2, endNum);
		ResultSet rs = pstat.executeQuery();
		List<BoardUserDTO> list = new ArrayList<>();
		StringBuffer sb = new StringBuffer();
		while(rs.next()) {
			BoardUserDTO dto = new BoardUserDTO();
			dto.setSeq(rs.getInt(1));
			dto.setCat_seq(rs.getInt(2));
			dto.setCategory(rs.getString(3));
			dto.setTitle(rs.getString(4));
			dto.setWriter(rs.getString(5));
			Reader instream = rs.getCharacterStream("user_contents");
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
			dto.setHeader(rs.getString(7));
			dto.setViewcount(rs.getInt(8));
			dto.setLike(rs.getInt(9));
			dto.setWritedate(rs.getString(10));
			dto.setIp(rs.getString(11));
			list.add(dto);
		}
		pstat.close();
		con.close();
		return list;
	}
	public int insertData(BoardUserDTO dto) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "insert into board_user values(user_seq.nextval,user_free_seq.nextval,?,?,?,?,?,sysdate,?,?)";
		PreparedStatement pstat = con.prepareStatement(sql);
		StringReader sr = new StringReader(dto.getContents());		

		pstat.setString(1, dto.getCategory());
		pstat.setString(2, dto.getTitle());
		pstat.setString(3, dto.getWriter());
		pstat.setCharacterStream(4, sr, dto.getContents().length());
		pstat.setString(5, dto.getHeader());
		pstat.setString(6, dto.getWritedate());
		pstat.setString(7, dto.getIp());

		int result = pstat.executeUpdate();
		con.commit();
		pstat.close();
		con.close();
		return result;		
	}
	public List<BoardUserDTO> readData(int seq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from board_user where user_seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, seq);
		ResultSet rs = pstat.executeQuery();
		List<BoardUserDTO> list = new ArrayList<>();
		StringBuffer sb = new StringBuffer();
		while(rs.next()) {
			BoardUserDTO dto = new BoardUserDTO();
			dto.setSeq(rs.getInt(1));
			dto.setCat_seq(rs.getInt(2));
			dto.setCategory(rs.getString(3));
			dto.setTitle(rs.getString(4));
			dto.setWriter(rs.getString(5));
			Reader instream = rs.getCharacterStream("user_contents");
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
			dto.setHeader(rs.getString(7));
			dto.setViewcount(rs.getInt(8));
			dto.setLike(rs.getInt(9));
			dto.setWritedate(rs.getString(10));
			dto.setIp(rs.getString(11));
			list.add(dto);
		}
		pstat.close();
		con.close();
		return list;
	}
	public String getPageNavi(int currentPage) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select count(*) totalCount from board_user where user_category='free'";
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
			sb.append("<a href='test.freeb?currentPage="+(startNavi-1)+"'< </a>");
		}
		for(int i = startNavi;i <= endNavi;i++) {
			if(currentPage == i) {
				sb.append("<a href='test.freeb?currentPage=" + i + "'> <b>" + i + "</b></a>");
			}else {
				sb.append("<a href='test.freeb?currentPage=" + i + "'> " + i + "</a>");
			}
		}
		if(needNext) {
			sb.append("<a href='test.freeb?currentPage="+(endNavi+1)+"'>></a>");
		}

		System.out.println(sb.toString());

		String result = sb.toString();
		con.close();
		pstat.close();

		return result;
	}
	public String getPageNavi2(int currentPage) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select count(*) totalCount from board_user where user_category='free'";
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
			sb.append("<a href='freeboardView.freeb?currentPage="+(startNavi-1)+"'< </a>");
		}
		for(int i = startNavi;i <= endNavi;i++) {
			if(currentPage == i) {
				sb.append("<a href='freeboardView.freeb?currentPage=" + i + "'> <b>" + i + "</b></a>");
			}else {
				sb.append("<a href='freeboardView.freeb?currentPage=" + i + "'> " + i + "</a>");
			}
		}
		if(needNext) {
			sb.append("<a href='freeboardView.freeb?currentPage="+(endNavi+1)+"'>></a>");
		}

		System.out.println(sb.toString());

		String result = sb.toString();
		con.close();
		pstat.close();

		return result;
	}
	public String getPageNavi3(int currentPage) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select count(*) totalCount from board_user where user_header = '잡담'";
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
			sb.append("<a href='ajax01.freeb?currentPage="+(startNavi-1)+"'< </a>");
		}
		for(int i = startNavi;i <= endNavi;i++) {
			if(currentPage == i) {
				sb.append("<a href='ajax01.freeb?currentPage=" + i + "'> <b>" + i + "</b></a>");
			}else {
				sb.append("<a href='ajax01.freeb?currentPage=" + i + "'> " + i + "</a>");
			}
		}
		if(needNext) {
			sb.append("<a href='ajax01.freeb?currentPage="+(endNavi+1)+"'>></a>");
		}

		System.out.println(sb.toString());

		String result = sb.toString();
		con.close();
		pstat.close();

		return result;
	}
	public String getPageNavi4(int currentPage) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select count(*) totalCount from board_user where user_header = '유머'";
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
			sb.append("<a href='ajax02.freeb?currentPage="+(startNavi-1)+"'< </a>");
		}
		for(int i = startNavi;i <= endNavi;i++) {
			if(currentPage == i) {
				sb.append("<a href='ajax02.freeb?currentPage=" + i + "'> <b>" + i + "</b></a>");
			}else {
				sb.append("<a href='ajax02.freeb?currentPage=" + i + "'> " + i + "</a>");
			}
		}
		if(needNext) {
			sb.append("<a href='ajax02.freeb?currentPage="+(endNavi+1)+"'>></a>");
		}

		System.out.println(sb.toString());

		String result = sb.toString();
		con.close();
		pstat.close();

		return result;
	}
	public String getPageNavi5(int currentPage) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select count(*) totalCount from board_user where user_header = '동물'";
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
			sb.append("<a href='ajax03.freeb?currentPage="+(startNavi-1)+"'< </a>");
		}
		for(int i = startNavi;i <= endNavi;i++) {
			if(currentPage == i) {
				sb.append("<a href='ajax03.freeb?currentPage=" + i + "'> <b>" + i + "</b></a>");
			}else {
				sb.append("<a href='ajax03.freeb?currentPage=" + i + "'> " + i + "</a>");
			}
		}
		if(needNext) {
			sb.append("<a href='ajax03.freeb?currentPage="+(endNavi+1)+"'>></a>");
		}

		System.out.println(sb.toString());

		String result = sb.toString();
		con.close();
		pstat.close();

		return result;
	}
	public int UpdateViewCount(int seq, int viewCount) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "update board_user set user_viewcount=? where user_seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, viewCount);
		pstat.setInt(2, seq);
		int result = pstat.executeUpdate();
		con.commit();
		pstat.close();
		con.close();
		return result;
	}
	public int insertComment(CommentFreeDTO dto) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "insert into comment_free values(comment_user_seq.nextval,?,?,sysdate,?)";
		PreparedStatement pstat = con.prepareStatement(sql);

		pstat.setInt(1, dto.getBoard_free_seq());
		pstat.setString(2, dto.getCommu_free_text());
		pstat.setString(3, dto.getFree_ip());

		int result = pstat.executeUpdate();
		con.commit();
		pstat.close();
		con.close();
		return result;		
	}
	public List<CommentFreeDTO> selectComment(int seq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from comment_free where comment_free_seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, seq);
		ResultSet rs = pstat.executeQuery();
		List<CommentFreeDTO> list = new ArrayList<>();
		while(rs.next()) {
			CommentFreeDTO dto = new CommentFreeDTO();
			dto.setComment_free_seq(rs.getInt(1));
			dto.setBoard_free_seq(rs.getInt(2));
			dto.setCommu_free_text(rs.getString(3));
			dto.setFree_writedate(rs.getString(4));
			dto.setFree_ip(rs.getString(5));
			list.add(dto);
		}
		con.commit();
		pstat.close();
		con.close();
		return list;
	}
	public int deleteData(int seq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "delete from board_user where user_seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, seq);
		int result = pstat.executeUpdate();
		con.commit();
		pstat.close();
		con.close();
		return result;
	}
	public int modifyData(BoardUserDTO dto) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "update board_user set user_title=?, user_contents=?, user_writedate=sysdate where user_seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, dto.getTitle());
		pstat.setString(2, dto.getContents());
		pstat.setInt(3, dto.getSeq());

		int result = pstat.executeUpdate();

		pstat.close();
		con.commit();
		con.close();
		return result;
	}
	public BoardUserDTO modifyRead(int seq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select user_title, user_contents from board_user where user_seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, seq);
		ResultSet rs = pstat.executeQuery();

		BoardUserDTO dto = new BoardUserDTO();
		if(rs.next()) {
			dto.setTitle(rs.getString("user_title"));
			dto.setContents(rs.getString("user_contents"));
		}
		rs.close();
		pstat.close();
		con.close();
		return dto;
	}
}
