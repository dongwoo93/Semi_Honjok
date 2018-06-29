package honjok.web.dto;

public class BoardDTO {
	private String title;
	private String contents;
	public BoardDTO() {}
	public BoardDTO(String title, String contents) {
		super();
		this.title = title;
		this.contents = contents;
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
	
}
