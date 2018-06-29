package honjok.web.dto;

public class BoardUserTipDTO {
	private int seq;
	private String header;
	private String title;
	private String contents;
	private String writer;
	private String writedate;
	private int viewcount;
	private int like;
	private String ip;

	public BoardUserTipDTO() {

	}

	public BoardUserTipDTO(int seq, String header, String title, String contents, String writer, String writedate,
			int viewcount, int like, String ip) {
		super();
		this.seq = seq;
		this.header = header;
		this.title = title;
		this.contents = contents;
		this.writer = writer;
		this.writedate = writedate;
		this.viewcount = viewcount;
		this.like = like;
		this.ip = ip;
	}

	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getHeader() {
		return header;
	}
	public void setHeader(String header) {
		this.header = header;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public int getViewcount() {
		return viewcount;
	}
	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
}
