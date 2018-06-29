package honjok.web.dto;

public class BoardDTO {
	private String seq;
	private String category;
	private String subject;
	private String title;
	private String contents;
	private int viewcount;
	private int like;
	private String writedate;
	private String systemFileName;
	private String originalFileName;
	
	public BoardDTO() {}
	
	public BoardDTO(String seq, String category, String subject, String title, 
			String contents, String systemFileName, String originalFileName) {
		this.seq = seq;
		this.category = category;
		this.subject = subject;
		this.title = title;
		this.contents = contents;
		this.systemFileName = systemFileName;
		this.originalFileName = originalFileName;
	}
	public BoardDTO(String seq, String category, String subject, String title, String contents, int viewcount, int like,
			String writedate, String systemFileName, String originalFileName) {
		this.seq = seq;
		this.category = category;
		this.subject = subject;
		this.title = title;
		this.contents = contents;
		this.viewcount = viewcount;
		this.like = like;
		this.writedate = writedate;
		this.systemFileName = systemFileName;
		this.originalFileName = originalFileName;
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
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getSystemFileName() {
		return systemFileName;
	}
	public void setSystemFileName(String systemFileName) {
		this.systemFileName = systemFileName;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	
}
