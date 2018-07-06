package honjok.web.dto;

public class ShoppingDTO {
	private String product_id;
	private String product_name;
	private String product_price;
	private String product_quantity;
	private String product_count;
	private String product_summary;
	private String product_contents;
	private String product_delivery;
	
	


	public ShoppingDTO() {
		
	}
	
	
	
	



	public ShoppingDTO(String product_id, String product_name, String product_price, String product_quantity,
			String product_summary, String product_contents, String product_delivery) {
		super();
		this.product_id = product_id;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_quantity = product_quantity;
		this.product_summary = product_summary;
		this.product_contents = product_contents;
		this.product_delivery = product_delivery;
	}







	public ShoppingDTO(String product_id, String product_name, String product_price, String product_quantity,
			String product_count, String product_summary, String product_contents, String product_delivery) {
		super();
		this.product_id = product_id;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_quantity = product_quantity;
		this.product_count = product_count;
		this.product_summary = product_summary;
		this.product_contents = product_contents;
		this.product_delivery = product_delivery;
	}
	

	public String getProduct_summary() {
		return product_summary;
	}


	public void setProduct_summary(String product_summary) {
		this.product_summary = product_summary;
	}
	
	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_price() {
		return product_price;
	}

	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}

	public String getProduct_quantity() {
		return product_quantity;
	}

	public void setProduct_quantity(String product_quantity) {
		this.product_quantity = product_quantity;
	}

	public String getProduct_count() {
		return product_count;
	}

	public void setProduct_count(String product_count) {
		this.product_count = product_count;
	}

	public String getProduct_contents() {
		return product_contents;
	}

	public void setProduct_contents(String product_contents) {
		this.product_contents = product_contents;
	}

	public String getProduct_delivery() {
		return product_delivery;
	}

	public void setProduct_delivery(String product_delivery) {
		this.product_delivery = product_delivery;
	}
	
}
