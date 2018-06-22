package honjok.web.dao;

public class BoardFreeDTO {
	private int seq;
	private int no;
	private String head;
	private String title;
	private String contents;
	private String writer;
	private String writedate;
	private int viewcount;
	private int suggest;
	
	public BoardFreeDTO() {
	
	}
	
	public BoardFreeDTO(int seq, int no, String head, String title, String contents, String writer, String writedate,
			int viewcount, int suggest) {
		super();
		this.seq = seq;
		this.no = no;
		this.head = head;
		this.title = title;
		this.contents = contents;
		this.writer = writer;
		this.writedate = writedate;
		this.viewcount = viewcount;
		this.suggest = suggest;
	}

	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
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
	public int getSuggest() {
		return suggest;
	}
	public void setSuggest(int suggest) {
		this.suggest = suggest;
	}
}
