package honjok.web.dao;

import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import honjok.web.dbutils.DBUtils;
import honjok.web.dto.BoardUserDTO;
import honjok.web.dto.MemberDTO;

public class MypageDAO {
	public ArrayList<BoardUserDTO> selectData(int startNum, int endNum, String id) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select * from (select board_user.*, row_number() over(order by user_seq desc) as num from board_user where user_writer = ?) where num between ? and ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, id);
		pstat.setInt(2, startNum);
		pstat.setInt(3, endNum);
		ResultSet rs = pstat.executeQuery();	
		ArrayList<BoardUserDTO> al = new ArrayList<>();
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
			String dt = rs.getString(10);
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String Resultstr = "";
			Date date = format.parse(dt);
			SimpleDateFormat resultFormat = new SimpleDateFormat("YY-MM-dd");
			Resultstr = resultFormat.format(date);
			dto.setWritedate(Resultstr);
			dto.setIp(rs.getString(11));
			al.add(dto);
			}
		
		con.commit();
		pstat.close();	
		con.close();
		return al;
	}
	public String getPageNavi(int currentPage, String id) throws Exception {
		Connection con = DBUtils.getConnection();
		String sql = "select count(*) totalCount from board_user where user_writer = ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, id);
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
			sb.append("<a href='selectdata.mp?id="+id+"&currentPage="+(startNavi-1)+"'< </a>");
		}
		for(int i = startNavi;i <= endNavi;i++) {
			if(currentPage == i) {
				sb.append("<a href='selectdata.mp?id="+id+"&currentPage=" + i + "'> <b>" + i + "</b></a>");
			}else {
				sb.append("<a href='selectdata.mp?id="+id+"&currentPage=" + i + "'> " + i + "</a>");
			}
		}
		if(needNext) {
			sb.append("<a href='selectdata.mp?id="+id+"&currentPage="+(endNavi+1)+"'>></a>");
		}



		String result = sb.toString();
		rs.close();
		pstat.close();
		con.close();

		return result;
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
}
