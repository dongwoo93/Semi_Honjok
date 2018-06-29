package honjok.web.dto;

public class CommentFreeDTO {
	int comment_free_seq;
	int board_free_seq;
	String commu_free_text;
	String free_writedate;
	String free_ip;
	
	public CommentFreeDTO() {
		
	}
	
	public CommentFreeDTO(int comment_free_seq, int board_free_seq, String commu_free_text, String free_writedate,
			String free_ip) {
		super();
		this.comment_free_seq = comment_free_seq;
		this.board_free_seq = board_free_seq;
		this.commu_free_text = commu_free_text;
		this.free_writedate = free_writedate;
		this.free_ip = free_ip;
	}

	public int getComment_free_seq() {
		return comment_free_seq;
	}
	public void setComment_free_seq(int comment_free_seq) {
		this.comment_free_seq = comment_free_seq;
	}
	public int getBoard_free_seq() {
		return board_free_seq;
	}
	public void setBoard_free_seq(int board_free_seq) {
		this.board_free_seq = board_free_seq;
	}
	public String getCommu_free_text() {
		return commu_free_text;
	}
	public void setCommu_free_text(String commu_free_text) {
		this.commu_free_text = commu_free_text;
	}
	public String getFree_writedate() {
		return free_writedate;
	}
	public void setFree_writedate(String free_writedate) {
		this.free_writedate = free_writedate;
	}
	public String getFree_ip() {
		return free_ip;
	}
	public void setFree_ip(String free_ip) {
		this.free_ip = free_ip;
	}
}
