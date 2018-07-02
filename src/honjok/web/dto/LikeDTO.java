package honjok.web.dto;

public class LikeDTO {
	String likeSeq;
	String boardFreeSeq;
	String memberId;
	String likeCheck;
	
	public LikeDTO() {
		super();
	}

	public LikeDTO(String likeSeq, String boardFreeSeq, String memberId, String likeCheck) {
		super();
		this.likeSeq = likeSeq;
		this.boardFreeSeq = boardFreeSeq;
		this.memberId = memberId;
		this.likeCheck = likeCheck;
	}

	public String getLikeSeq() {
		return likeSeq;
	}

	public void setLikeSeq(String likeSeq) {
		this.likeSeq = likeSeq;
	}

	public String getBoardFreeSeq() {
		return boardFreeSeq;
	}

	public void setBoardFreeSeq(String boardFreeSeq) {
		this.boardFreeSeq = boardFreeSeq;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getLikeCheck() {
		return likeCheck;
	}

	public void setLikeCheck(String likeCheck) {
		this.likeCheck = likeCheck;
	}
	
	
	
}
