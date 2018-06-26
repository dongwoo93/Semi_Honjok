package honjok.web.dto;

public class BoardFreeDTO {
	private String free_seq;
	private String free_title;
	private String free_writer;
	private String free_contents;
	private String free_header;
	private String free_viewcount;
	private String free_like;
	private String free_writedate;
	private String free_ip;
	
	public BoardFreeDTO() {
		
	}
	
	public BoardFreeDTO(String free_seq, String free_title, String free_writer, String free_contents,
			String free_header, String free_viewcount, String free_like, String free_writedate, String free_ip) {
		super();
		this.free_seq = free_seq;
		this.free_title = free_title;
		this.free_writer = free_writer;
		this.free_contents = free_contents;
		this.free_header = free_header;
		this.free_viewcount = free_viewcount;
		this.free_like = free_like;
		this.free_writedate = free_writedate;
		this.free_ip = free_ip;
	}

	public String getFree_seq() {
		return free_seq;
	}

	public void setFree_seq(String free_seq) {
		this.free_seq = free_seq;
	}

	public String getFree_title() {
		return free_title;
	}

	public void setFree_title(String free_title) {
		this.free_title = free_title;
	}

	public String getFree_writer() {
		return free_writer;
	}

	public void setFree_writer(String free_writer) {
		this.free_writer = free_writer;
	}

	public String getFree_contents() {
		return free_contents;
	}

	public void setFree_contents(String free_contents) {
		this.free_contents = free_contents;
	}

	public String getFree_header() {
		return free_header;
	}

	public void setFree_header(String free_header) {
		this.free_header = free_header;
	}

	public String getFree_viewcount() {
		return free_viewcount;
	}

	public void setFree_viewcount(String free_viewcount) {
		this.free_viewcount = free_viewcount;
	}

	public String getFree_like() {
		return free_like;
	}

	public void setFree_like(String free_like) {
		this.free_like = free_like;
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
