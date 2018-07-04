package honjok.web.dto;

public class AdminLikeDTO {
	String article_no;
	String like_seq;
	String member_id;
	String like_check;
	
	public AdminLikeDTO() {
		super();
	}

	public AdminLikeDTO(String article_no, String like_seq, String member_id, String like_check) {
		super();
		this.article_no = article_no;
		this.like_seq = like_seq;
		this.member_id = member_id;
		this.like_check = like_check;
	}

	public String getArticle_no() {
		return article_no;
	}

	public void setArticle_no(String article_no) {
		this.article_no = article_no;
	}

	public String getLike_seq() {
		return like_seq;
	}

	public void setLike_seq(String like_seq) {
		this.like_seq = like_seq;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getLike_check() {
		return like_check;
	}

	public void setLike_check(String like_check) {
		this.like_check = like_check;
	}
	
}
