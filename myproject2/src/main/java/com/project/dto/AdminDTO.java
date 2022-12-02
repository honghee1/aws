package com.project.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.apache.ibatis.type.Alias;

@Alias("admin")
public class AdminDTO {
	@NotBlank(message = "아이디를 입력해주세요.")
	private String adminId;
	
	@Pattern(regexp = "(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,16}", message = "비밀번호는 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.")
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
