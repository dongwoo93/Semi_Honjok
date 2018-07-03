package honjok.web.dto;

public class BoardDTO {
	private String seq;
	private String category;
	private String subject;
	private String title;
	private String contents;
	private int viewcount;
	private String writedate;
	private int likeit;
	
	public BoardDTO() {}
	
	public BoardDTO(String seq, String category, String subject, String title, String contents, int viewcount,
			String writedate, int likeit) {
		super();
		this.seq = seq;
		this.category = category;
		this.subject = subject;
		this.title = title;
		this.contents = contents;
		this.viewcount = viewcount;
		this.writedate = writedate;
		this.likeit = likeit;
	}

	public BoardDTO(String seq, String category, String subject, String title, String contents) {
		super();
		this.seq = seq;
		this.category = category;
		this.subject = subject;
		this.title = title;
		this.contents = contents;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
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

	public int getViewcount() {
		return viewcount;
	}

	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public int getLikeit() {
		return likeit;
	}

	public void setLikeit(int likeit) {
		this.likeit = likeit;
	}
	
	
	
}
