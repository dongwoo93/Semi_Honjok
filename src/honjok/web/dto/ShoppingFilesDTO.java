package honjok.web.dto;

public class ShoppingFilesDTO {
	private String product_id;
	private String files_seq;
	private String shop_original_file_name;
	private String shop_system_file_name;
	
	public ShoppingFilesDTO() {
		
	}
	
	public ShoppingFilesDTO(String product_id, String files_seq, String shop_original_file_name,
			String shop_system_file_name) {
		super();
		this.product_id = product_id;
		this.files_seq = files_seq;
		this.shop_original_file_name = shop_original_file_name;
		this.shop_system_file_name = shop_system_file_name;
	}
	
	public ShoppingFilesDTO(String product_id,String shop_original_file_name,
			String shop_system_file_name) {
		super();
		this.product_id = product_id;
		this.shop_original_file_name = shop_original_file_name;
		this.shop_system_file_name = shop_system_file_name;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getFiles_seq() {
		return files_seq;
	}

	public void setFiles_seq(String files_seq) {
		this.files_seq = files_seq;
	}

	public String getShop_original_file_name() {
		return shop_original_file_name;
	}

	public void setShop_original_file_name(String shop_original_file_name) {
		this.shop_original_file_name = shop_original_file_name;
	}

	public String getShop_system_file_name() {
		return shop_system_file_name;
	}

	public void setShop_system_file_name(String shop_system_file_name) {
		this.shop_system_file_name = shop_system_file_name;
	}
	
	
}
