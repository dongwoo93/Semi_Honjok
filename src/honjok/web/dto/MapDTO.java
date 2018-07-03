package honjok.web.dto;

public class MapDTO {
	private String place_seq;
	private String board_seq;
	private String place_name;
	private String category_name;
	private String phone;
	private String road_address_name;
	private String address_name;
	private String place_url;
	
	public MapDTO() {
		
	}
	
	
	public MapDTO(String board_seq, String place_name, String category_name, String phone,
			String road_address_name, String address_name, String place_url) {
		super();
		this.board_seq = board_seq;
		this.place_name = place_name;
		this.category_name = category_name;
		this.phone = phone;
		this.road_address_name = road_address_name;
		this.address_name = address_name;
		this.place_url = place_url;
	}
	
	
	public MapDTO(String place_seq, String board_seq, String place_name, String category_name, String phone,
			String road_address_name, String address_name, String place_url) {
		super();
		this.place_seq = place_seq;
		this.board_seq = board_seq;
		this.place_name = place_name;
		this.category_name = category_name;
		this.phone = phone;
		this.road_address_name = road_address_name;
		this.address_name = address_name;
		this.place_url = place_url;
	}

	public String getPlace_seq() {
		return place_seq;
	}

	public void setPlace_seq(String place_seq) {
		this.place_seq = place_seq;
	}

	public String getBoard_seq() {
		return board_seq;
	}

	public void setBoard_seq(String board_seq) {
		this.board_seq = board_seq;
	}

	public String getPlace_name() {
		return place_name;
	}

	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRoad_address_name() {
		return road_address_name;
	}

	public void setRoad_address_name(String road_address_name) {
		this.road_address_name = road_address_name;
	}

	public String getAddress_name() {
		return address_name;
	}

	public void setAddress_name(String address_name) {
		this.address_name = address_name;
	}

	public String getPlace_url() {
		return place_url;
	}

	public void setPlace_url(String place_url) {
		this.place_url = place_url;
	}
	
	
}
