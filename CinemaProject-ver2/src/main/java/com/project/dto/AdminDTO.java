package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("admin")
public class AdminDTO {
	private String adminId;
	private String adminPasswd;
	private String adminName;
	private int grade;
	private String gradeName;

	public AdminDTO() {
	}
	

	public String getGradeName() {
		return gradeName;
	}



	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}



	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminPasswd() {
		return adminPasswd;
	}

	public void setAdminPasswd(String adminPasswd) {
		this.adminPasswd = adminPasswd;
	}

	public String getadminName() {
		return adminName;
	}

	public void setadminName(String adminName) {
		this.adminName = adminName;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "AdminDTO [adminId=" + adminId + ", adminPasswd=" + adminPasswd + ", adminName=" + adminName
				+ ", grade=" + grade + "]";
	}
	
	
}
