/*
* 작성일 : 2015. 7. 9.
* 작성자 : Administrator
*
* 설명
*/
package kr.ice.cream.dto;

public class StoreDTO {
	
	private int srl;				// 매장 고유번호
	private String id;				// id
	private String password;		// 비밀번호
	private String phone;			// 전화번호
	private String location;		// 위치
	private String info;			// 매장정보
	private String lastlogindate;	// 마지막 로그인 날짜
	private String joindate;		// 회원가입 날짜
	private String alterdate;		// 회원정보 변경 날짜
	public int getSrl() {
		return srl;
	}
	public void setSrl(int srl) {
		this.srl = srl;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getLastlogindate() {
		return lastlogindate;
	}
	public void setLastlogindate(String lastlogindate) {
		this.lastlogindate = lastlogindate;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public String getAlterdate() {
		return alterdate;
	}
	public void setAlterdate(String alterdate) {
		this.alterdate = alterdate;
	}
	@Override
	public String toString() {
		return "StoreDTO [srl=" + srl + ", id=" + id + ", password=" + password
				+ ", phone=" + phone + ", location=" + location + ", info="
				+ info + ", lastlogindate=" + lastlogindate + ", joindate="
				+ joindate + ", alterdate=" + alterdate + "]";
	}

}
