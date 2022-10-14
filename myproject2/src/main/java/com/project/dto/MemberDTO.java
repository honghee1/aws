package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("member")
public class MemberDTO {
	private String userEmail;
	private String userPasswd;
	private String userName;
	private String userNick;
	private String userTel;
	private String address;
	private int point;
	private String userBirth;
	
	
	public MemberDTO() {
	}
	
	public String getUserBirth() {
		return userBirth;
	}
	
	
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}


	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPasswd() {
		return userPasswd;
	}

	public void setUserPasswd(String userPasswd) {
		this.userPasswd = userPasswd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "MemberDTO [userEmail=" + userEmail + ", userPasswd=" + userPasswd + ", userName=" + userName
				+ ", userNick=" + userNick + ", userTel=" + userTel + ", address=" + address + ", point=" + point
				+ ", userBirth=" + userBirth + "]";
	}

	
	
	
}
