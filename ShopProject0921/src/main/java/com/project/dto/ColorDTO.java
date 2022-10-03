package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("color")
public class ColorDTO {
	private String colorno;
	private String productno;
	private String colorname;
	
	public ColorDTO() {
		super();
	}

	public ColorDTO(String colorno, String productno, String colorname) {
		super();
		this.colorno = colorno;
		this.productno = productno;
		this.colorname = colorname;
	}

	public String getColorno() {
		return colorno;
	}

	public void setColorno(String colorno) {
		this.colorno = colorno;
	}

	public String getProductno() {
		return productno;
	}

	public void setProductno(String productno) {
		this.productno = productno;
	}

	public String getColorname() {
		return colorname;
	}

	public void setColorname(String colorname) {
		this.colorname = colorname;
	}

	@Override
	public String toString() {
		return "ColorDTO [colorno=" + colorno + ", productno=" + productno + ", colorname=" + colorname + "]";
	}

	
	
	
	
}
