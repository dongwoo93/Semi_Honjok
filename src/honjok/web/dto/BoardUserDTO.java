package honjok.web.dto;

public class BoardUserDTO {
	private int seq;
	private int cat_seq;
	private String category;
	private String title;
	private String writer;
	private String contents;
	private String header;
	private int viewcount;
	private int like;
	private String writedate;
	private String ip;
	private int commentcount;
	
	
	public BoardUserDTO() {
		
	}
	
	
	
	public BoardUserDTO(int seq, String title, String contents, String header) {
		super();
		this.seq = seq;
		this.title = title;
		this.contents = contents;
		this.header = header;
	}


	public BoardUserDTO(int seq, int cat_seq, String category, String header, String title, String contents,
			String writer, String writedate, int viewcount, int like, String ip) {
		super();
		this.seq = seq;
		this.cat_seq = cat_seq;
		this.category = category;
		this.header = header;
		this.title = title;
		this.contents = contents;
		this.writer = writer;
		this.writedate = writedate;
		this.viewcount = viewcount;
		this.like = like;
		this.ip = ip;
	}
	
	


	public BoardUserDTO(int seq, String category, String title, String writer, String contents, String header,
			String ip) {
		super();
		this.seq = seq;
		this.category = category;
		this.title = title;
		this.writer = writer;
		this.contents = contents;
		this.header = header;
		this.ip = ip;
	}
	
	public BoardUserDTO(int seq, int cat_seq, String category, String title, String writer, String contents, String header,
			String ip) {
		super();
		this.seq = seq;
		this.cat_seq = cat_seq;
		this.category = category;
		this.title = title;
		this.writer = writer;
		this.contents = contents;
		this.header = header;
		this.ip = ip;
	}


	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public int getCat_seq() {
		return cat_seq;
	}


	public void setCat_seq(int cat_seq) {
		this.cat_seq = cat_seq;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
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



	public int getCommentcount() {
		return commentcount;
	}



	public void setCommentcount(int commentcount) {
		this.commentcount = commentcount;
	}
	
	


	
	
}