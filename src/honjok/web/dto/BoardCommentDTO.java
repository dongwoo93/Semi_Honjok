package honjok.web.dto;

public class BoardCommentDTO {

	String board_no;
	String comment_seq;
	String comment_writer;
	String comment_content;
	String comment_wridate;
	String comment_ip;
	
	public BoardCommentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BoardCommentDTO(String board_no, String comment_seq, String comment_writer, String comment_content,
			String comment_wridate, String comment_ip) {
		super();
		this.board_no = board_no;
		this.comment_seq = comment_seq;
		this.comment_writer = comment_writer;
		this.comment_content = comment_content;
		this.comment_wridate = comment_wridate;
		this.comment_ip = comment_ip;
	}
	
	
	
	
	

	public BoardCommentDTO(String board_no, String comment_writer, String comment_content, String comment_ip) {
		super();
		this.board_no = board_no;
		this.comment_writer = comment_writer;
		this.comment_content = comment_content;
		this.comment_ip = comment_ip;
	}

	public String getBoard_no() {
		return board_no;
	}
	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}
	public String getComment_seq() {
		return comment_seq;
	}
	public void setComment_seq(String comment_seq) {
		this.comment_seq = comment_seq;
	}
	public String getComment_writer() {
		return comment_writer;
	}
	public void setComment_writer(String comment_writer) {
		this.comment_writer = comment_writer;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getComment_wridate() {
		return comment_wridate;
	}
	public void setComment_wridate(String comment_wridate) {
		this.comment_wridate = comment_wridate;
	}
	public String getComment_ip() {
		return comment_ip;
	}
	public void setComment_ip(String comment_ip) {
		this.comment_ip = comment_ip;
	}
	
	
}
