package honjok.web.dto;

public class UserFilesDTO {
	private String board_no;      
	private String file_seq;   
	private String file_original_name;
	private String file_system_name;
	
	
	
	
	public UserFilesDTO() {
		super();
	}




	public UserFilesDTO(String board_no, String file_original_name, String file_system_name) {
		super();
		this.board_no = board_no;
		this.file_original_name = file_original_name;
		this.file_system_name = file_system_name;
	}




	public UserFilesDTO(String board_no, String file_seq, String file_original_name, String file_system_name) {
		super();
		this.board_no = board_no;
		this.file_seq = file_seq;
		this.file_original_name = file_original_name;
		this.file_system_name = file_system_name;
	}




	public String getBoard_no() {
		return board_no;
	}




	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}




	public String getFile_seq() {
		return file_seq;
	}




	public void setFile_seq(String file_seq) {
		this.file_seq = file_seq;
	}




	public String getFile_original_name() {
		return file_original_name;
	}




	public void setFile_original_name(String file_original_name) {
		this.file_original_name = file_original_name;
	}




	public String getFile_system_name() {
		return file_system_name;
	}




	public void setFile_system_name(String file_system_name) {
		this.file_system_name = file_system_name;
	}
	
	
	
	
	
}
