package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("user")
public class SiteUser {
	
	private String email;
	private String username;
	private String password;
	public SiteUser(String email, String username, String password) {
		super();
		this.email = email;
		this.username = username;
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "SiteUser [email=" + email + ", username=" + username + ", password=" + password + "]";
	}

}
