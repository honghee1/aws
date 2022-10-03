package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("category")
public class categoryDTO {
	private String categoryno;
	private String categoryname;
	private String productno;

	public categoryDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public categoryDTO(String categoryno, String categoryname, String productno) {
		super();
		this.categoryno = categoryno;
		this.categoryname = categoryname;
		this.productno = productno;
	}

	public String getCategoryno() {
		return categoryno;
	}

	public void setCategoryno(String categoryno) {
		this.categoryno = categoryno;
	}

	public String getCategoryname() {
		return categoryname;
	}

	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}

	public String getProductno() {
		return productno;
	}

	public void setProductno(String productno) {
		this.productno = productno;
	}

	@Override
	public String toString() {
		return "categoryDTO [categoryno=" + categoryno + ", categoryname=" + categoryname + ", productno=" + productno
				+ "]";
	}

}
