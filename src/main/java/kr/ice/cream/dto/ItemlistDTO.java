/*
* 작성일 : 2015. 7. 9.
* 작성자 : Administrator
*
* 설명
*/
package kr.ice.cream.dto;

public class ItemlistDTO {
	
	private int srl;		// 아이템 리스트 고유값
	private int itemsrl;	// 아이템 고유값
	private int amount;		// 아이템 수량
	private String sort;	// 주문정보 고유값

	public int getSrl() {
		return srl;
	}

	public void setSrl(int srl) {
		this.srl = srl;
	}

	public int getItemsrl() {
		return itemsrl;
	}

	public void setItemsrl(int itemsrl) {
		this.itemsrl = itemsrl;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}


	@Override
	public String toString() {
		return "ItemlistDTO{" +
				"srl=" + srl +
				", itemsrl=" + itemsrl +
				", amount=" + amount +
				", sort='" + sort + '\'' +
				'}';
	}
}
