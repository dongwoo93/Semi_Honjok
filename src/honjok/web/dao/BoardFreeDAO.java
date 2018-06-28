package honjok.web.dao;

import java.io.Reader;
import java.io.StringReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import honjok.web.dto.BoardFreeDTO;
import honjok.web.dto.CommentFreeDTO;
import kh.web.dbutils.DBUtils;

public class BoardFreeDAO {	

	/*	public static void main(String[] args) throws Exception {
		new BoardFreeDAO().selectData();
	}*/

	public List<BoardFreeDTO> selectData(int startNum, int endNum) throws Exception{
		Connection con = DBUtils.getConnection();
		String sql = "select * from (select board_free.*, row_number() over(order by free_writedate desc) as num from board_free) where num between ? and ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, startNum);
		pstat.setInt(2, endNum);
		ResultSet rs = pstat.executeQuery();
		List<BoardFreeDTO> list = new ArrayList<>();
		StringBuffer sb = new StringBuffer();
		while(rs.next()) {
			BoardFreeDTO dto = new BoardFreeDTO();
			dto.setSeq(rs.getInt(1));
			dto.setTitle(rs.getString(2));
			dto.setWriter(rs.getString(3));
			Reader instream = rs.getCharacterStream("free_contents");
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
	public List<BoardFreeDTO> selectChatData(int startNum, int endNum) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from (select board_free.*, row_number() over(order by free_writedate desc) as num from board_free where free_header='���') where num between ? and ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, startNum);
		pstat.setInt(2, endNum);
		ResultSet rs = pstat.executeQuery();
		List<BoardFreeDTO> list = new ArrayList<>();
		StringBuffer sb = new StringBuffer();
		while(rs.next()) {
			BoardFreeDTO dto = new BoardFreeDTO();
			dto.setSeq(rs.getInt(1));
			dto.setTitle(rs.getString(2));
			dto.setWriter(rs.getString(3));
			Reader instream = rs.getCharacterStream("free_contents");
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
	public List<BoardFreeDTO> selectHumorData(int startNum, int endNum) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from (select board_free.*, row_number() over(order by free_writedate desc) as num from board_free where free_header='����') where num between ? and ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, startNum);
		pstat.setInt(2, endNum);
		ResultSet rs = pstat.executeQuery();
		List<BoardFreeDTO> list = new ArrayList<>();
		StringBuffer sb = new StringBuffer();
		while(rs.next()) {
			BoardFreeDTO dto = new BoardFreeDTO();
			dto.setSeq(rs.getInt(1));
			dto.setTitle(rs.getString(2));
			dto.setWriter(rs.getString(3));
			Reader instream = rs.getCharacterStream("free_contents");
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
	public List<BoardFreeDTO> selectBeastData(int startNum, int endNum) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from (select board_free.*, row_number() over(order by free_writedate desc) as num from board_free where free_header='����') where num between ? and ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, startNum);
		pstat.setInt(2, endNum);
		ResultSet rs = pstat.executeQuery();
		List<BoardFreeDTO> list = new ArrayList<>();
		StringBuffer sb = new StringBuffer();
		while(rs.next()) {
			BoardFreeDTO dto = new BoardFreeDTO();
			dto.setSeq(rs.getInt(1));
			dto.setTitle(rs.getString(2));
			dto.setWriter(rs.getString(3));
			Reader instream = rs.getCharacterStream("free_contents");
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
	public int insertData(BoardFreeDTO dto) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "insert into board_free values(board_free_seq.nextval,?,?,?,?,sysdate,?,?)";
		PreparedStatement pstat = con.prepareStatement(sql);
		StringReader sr = new StringReader(dto.getContents());		

		pstat.setString(1, dto.getTitle());
		pstat.setString(2, dto.getWriter());
		pstat.setCharacterStream(3, sr, dto.getContents().length());
		pstat.setString(4, dto.getHeader());
		pstat.setString(5, dto.getWritedate());
		pstat.setString(6, dto.getIp());

		int result = pstat.executeUpdate();
		con.commit();
		pstat.close();
		con.close();
		return result;		
	}
	public List<BoardFreeDTO> readData(int seq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from board_free where free_seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, seq);
		ResultSet rs = pstat.executeQuery();
		List<BoardFreeDTO> list = new ArrayList<>();
		StringBuffer sb = new StringBuffer();
		while(rs.next()) {
			BoardFreeDTO dto = new BoardFreeDTO();
			dto.setSeq(rs.getInt(1));
			dto.setTitle(rs.getString(2));
			dto.setWriter(rs.getString(3));
			Reader instream = rs.getCharacterStream("free_contents");
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
		String sql = "select count(*) totalCount from board_free";
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
		rs.next();

		int recordTotalCount = rs.getInt("totalCount");//��ü ��(���ڵ�)�� ������ �����ϴ� ����
		int recordCountPerPage = 10; // �� �������� �Խñ��� ǥ�õǴ� ����
		int naviCountPerPage = 10; // �� �������� ǥ�õǴ� ���̰������� ����
		int pageTotalCount = 0; // ��ü�� �� �������� ������ ������

		if(recordTotalCount % recordCountPerPage > 0) { //10���� ������ �������� ����
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
		String sql = "select count(*) totalCount from board_free";
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
		rs.next();

		int recordTotalCount = rs.getInt("totalCount");//��ü ��(���ڵ�)�� ������ �����ϴ� ����
		int recordCountPerPage = 10; // �� �������� �Խñ��� ǥ�õǴ� ����
		int naviCountPerPage = 10; // �� �������� ǥ�õǴ� ���̰������� ����
		int pageTotalCount = 0; // ��ü�� �� �������� ������ ������

		if(recordTotalCount % recordCountPerPage > 0) { //10���� ������ �������� ����
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
		String sql = "select count(*) totalCount from board_free where free_header = '���'";
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
		rs.next();

		int recordTotalCount = rs.getInt("totalCount");//��ü ��(���ڵ�)�� ������ �����ϴ� ����
		int recordCountPerPage = 10; // �� �������� �Խñ��� ǥ�õǴ� ����
		int naviCountPerPage = 10; // �� �������� ǥ�õǴ� ���̰������� ����
		int pageTotalCount = 0; // ��ü�� �� �������� ������ ������

		if(recordTotalCount % recordCountPerPage > 0) { //10���� ������ �������� ����
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
		String sql = "select count(*) totalCount from board_free where free_header = '����'";
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
		rs.next();

		int recordTotalCount = rs.getInt("totalCount");//��ü ��(���ڵ�)�� ������ �����ϴ� ����
		int recordCountPerPage = 10; // �� �������� �Խñ��� ǥ�õǴ� ����
		int naviCountPerPage = 10; // �� �������� ǥ�õǴ� ���̰������� ����
		int pageTotalCount = 0; // ��ü�� �� �������� ������ ������

		if(recordTotalCount % recordCountPerPage > 0) { //10���� ������ �������� ����
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
		String sql = "select count(*) totalCount from board_free where free_header = '����'";
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
		rs.next();

		int recordTotalCount = rs.getInt("totalCount");//��ü ��(���ڵ�)�� ������ �����ϴ� ����
		int recordCountPerPage = 10; // �� �������� �Խñ��� ǥ�õǴ� ����
		int naviCountPerPage = 10; // �� �������� ǥ�õǴ� ���̰������� ����
		int pageTotalCount = 0; // ��ü�� �� �������� ������ ������

		if(recordTotalCount % recordCountPerPage > 0) { //10���� ������ �������� ����
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
		String sql = "update board_free set free_viewcount=? where free_seq=?";
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
		String sql = "insert into comment_free values(comment_free_seq.nextval,?,?,sysdate,?)";
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
		String sql = "delete from board_free where free_seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, seq);
		int result = pstat.executeUpdate();
		con.commit();
		pstat.close();
		con.close();
		return result;
	}
	public int modifyData(BoardFreeDTO dto) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "update board_free set free_title=?, free_contents=?, free_writedate=sysdate where seq=?";
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
	public BoardFreeDTO modifyRead(int seq) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select title, contents from board_free where seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, seq);
		ResultSet rs = pstat.executeQuery();

		BoardFreeDTO dto = new BoardFreeDTO();
		if(rs.next()) {
			dto.setTitle(rs.getString("title"));
			dto.setContents(rs.getString("contents"));
		}
		rs.close();
		pstat.close();
		con.close();
		return dto;
	}
}
