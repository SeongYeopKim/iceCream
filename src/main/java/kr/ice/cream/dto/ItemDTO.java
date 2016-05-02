/*
* 작성일 : 2015. 7. 9.
* 작성자 : Administrator
*
* 설명
*/
package kr.ice.cream.dto;

public class ItemDTO {

	private int srl;			// 아이스크림 고유 번호
	private String title;		// 제목
	private int price;			// 가격
	private String content;		// 아이스크림 상세설명
	private String meterial;	// 아이스크림 원재료
	private String photo;		// 아이스크림 사진
	private int aomount;

	public int getAomount() {
		return aomount;
	}

	public void setAomount(int aomount) {
		this.aomount = aomount;
	}

	public int getSrl() {
		return srl;
	}

	public void setSrl(int srl) {
		this.srl = srl;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMeterial() {
		return meterial;
	}

	public void setMeterial(String meterial) {
		this.meterial = meterial;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	@Override
	public String toString() {
		return "ItemDTO{" +
				"srl=" + srl +
				", title='" + title + '\'' +
				", price=" + price +
				", content='" + content + '\'' +
				", meterial='" + meterial + '\'' +
				", photo='" + photo + '\'' +
				'}';
	}

}
