package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("member")
public class MemberDTO {
	private String memberId;
	private String pw;
	private String memberName;
	private String address;
	private String birthDate;
	private String memberTelNo;
	private String withdraw;
	private String gender;
	private String addressdetail;
	private String postno;
	
	
	public MemberDTO() {
	}
	
	public MemberDTO(String memberId, String pw, String memberName, String address, String birthDate,
			String memberTelNo, String withdraw, String gender) {
		super();
		this.memberId = memberId;
		this.pw = pw;
		this.memberName = memberName;
		this.address = address;
		this.birthDate = birthDate;
		this.memberTelNo = memberTelNo;
		this.withdraw = withdraw;
		this.gender = gender;
	}
	
	
	
	public String getAddressdetail() {
		return addressdetail;
	}

	public void setAddressdetail(String addressdetail) {
		this.addressdetail = addressdetail;
	}

	public String getPostno() {
		return postno;
	}

	public void setPostno(String postno) {
		this.postno = postno;
	}

	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public String getMemberTelNo() {
		return memberTelNo;
	}
	public void setMemberTelNo(String memberTelNo) {
		this.memberTelNo = memberTelNo;
	}
	public String getWithdraw() {
		return withdraw;
	}
	public void setWithdraw(String withdraw) {
		this.withdraw = withdraw;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "MemberDTO [memberId=" + memberId + ", pw=" + pw + ", memberName=" + memberName + ", address=" + address
				+ ", birthDate=" + birthDate + ", memberTelNo=" + memberTelNo + ", withdraw=" + withdraw + ", gender="
				+ gender + ", addressdetail=" + addressdetail + ", postno=" + postno + "]";
	}
	
	

}
