package honjok.web.dto;

public class AdminFilesDTO {
	private String article_no;
	private String file_seq;
	private String note_sysFileName;
	private String thum_sysFileName;
	private String thum_orgFileName;
	
	public AdminFilesDTO() {}

	public String getArticle_no() {
		return article_no;
	}

	public void setArticle_no(String article_no) {
		this.article_no = article_no;
	}

	public String getFile_seq() {
		return file_seq;
	}

	public void setFile_seq(String file_seq) {
		this.file_seq = file_seq;
	}

	public String getNote_sysFileName() {
		return note_sysFileName;
	}

	public void setNote_sysFileName(String note_sysFileName) {
		this.note_sysFileName = note_sysFileName;
	}

	public String getThum_sysFileName() {
		return thum_sysFileName;
	}

	public void setThum_sysFileName(String thum_sysFileName) {
		this.thum_sysFileName = thum_sysFileName;
	}

	public String getThum_orgFileName() {
		return thum_orgFileName;
	}

	public void setThum_orgFileName(String thum_orgFileName) {
		this.thum_orgFileName = thum_orgFileName;
	}

	public AdminFilesDTO(String article_no, String file_seq, String thum_sysFileName) {
		super();
		this.article_no = article_no;
		this.file_seq = file_seq;
		this.thum_sysFileName = thum_sysFileName;
	}

	public AdminFilesDTO(String article_no, String file_seq, String note_sysFileName, String thum_sysFileName,
			String thum_orgFileName) {
		super();
		this.article_no = article_no;
		this.file_seq = file_seq;
		this.note_sysFileName = note_sysFileName;
		this.thum_sysFileName = thum_sysFileName;
		this.thum_orgFileName = thum_orgFileName;
	}
	
	
}
