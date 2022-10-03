package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("sizes")
public class SizesDTO {
	private String sizekind;
	private String sizeno;
	private String productno;
	
	public SizesDTO() {
		super();
	}

	public SizesDTO(String sizekind, String sizeno, String productno) {
		super();
		this.sizekind = sizekind;
		this.sizeno = sizeno;
		this.productno = productno;
	}

	public String getSizekind() {
		return sizekind;
	}

	public void setSizekind(String sizekind) {
		this.sizekind = sizekind;
	}

	public String getSizeno() {
		return sizeno;
	}

	public void setSizeno(String sizeno) {
		this.sizeno = sizeno;
	}

	public String getProductno() {
		return productno;
	}

	public void setProductno(String productno) {
		this.productno = productno;
	}

	@Override
	public String toString() {
		return "SizesDTO [sizekind=" + sizekind + ", sizeno=" + sizeno + ", productno=" + productno + "]";
	}
	
	
	
	
	
}
