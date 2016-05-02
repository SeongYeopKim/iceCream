/*
* 작성일 : 2015. 7. 10.
* 작성자 : Administrator
*
* 설명
*/
package kr.ice.cream.dto;

public class OrdersDTO {

	private int srl;			// 고유번호
	private int customersrl;	// 고객 번호 외래키
	private int phase;			// 주문 단계 0 : 주문대기, 1 : 주문승인
	private String title;		// 제목
	private String content;		// 내용설명
	private String sort;		// 고유값
	private String starttime;	// 시작시간
	private String endtime;		// 끝시간
	private int price;			// 가격
	public int getSrl() {
		return srl;
	}
	public void setSrl(int srl) {
		this.srl = srl;
	}
	public int getCustomersrl() {
		return customersrl;
	}
	public void setCustomersrl(int customersrl) {
		this.customersrl = customersrl;
	}
	public int getPhase() {
		return phase;
	}
	public void setPhase(int phase) {
		this.phase = phase;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "OrdersDTO [srl=" + srl + ", customersrl=" + customersrl
				+ ", phase=" + phase + ", title=" + title + ", content="
				+ content + ", sort=" + sort + ", starttime=" + starttime
				+ ", endtime=" + endtime + ", price=" + price + "]";
	}
}
