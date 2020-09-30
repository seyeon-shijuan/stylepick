package logic;

public class ItemSet {
	private Item item;
	private Integer quantity;
	private String item_option;
	private String size;

	public ItemSet(Item item, Integer quantity, String item_option, String size) {
		this.item = item;
		this.quantity = quantity;
		this.item_option = item_option;
		this.size = size;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getItem_option() {
		return item_option;
	}

	public void setItem_option(String item_option) {
		this.item_option = item_option;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	@Override
	public String toString() {
		return "ItemSet [item=" + item + ", quantity=" + quantity + ", item_option=" + item_option + ", size=" + size
				+ "]";
	}

}
