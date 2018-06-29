package honjok.web.dao;

import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import honjok.web.dto.BoardDTO;
import honjok.web.dbutils.DBUtils;

public class testDAO {
	public List<BoardDTO> boardSelect() throws Exception{
	      Connection con = DBUtils.getConnection();
	      String sql = "select testtip.*, row_number() over(order by seq desc) as num from testtip";
	      PreparedStatement pstat = con.prepareStatement(sql);
	      ResultSet rs = pstat.executeQuery();
	      List<BoardDTO> list = new ArrayList<>();
	      StringBuffer sb = new StringBuffer();
	      while(rs.next()) {
	         BoardDTO dto = new BoardDTO();
	         dto.setTitle(rs.getString(2));
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
}
