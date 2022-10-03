package com.project.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("product")
public class ProductDTO {
	private String productno;
	private String productname;
	private String receivngdate;
	private int productstock;
	private int inquantity;
	private int cost;
	private int price;
	private String categoryno;
	private String sizename;
	private String color;
	private String productphotono;
	private String photopath;
	private String colorno;
	private String sizeno;

	public ProductDTO() {
		super();
	}

	public ProductDTO(String productno, String productname, String receivngdate, int productstock, int inquantity,
			int cost, int price, String categoryno, String sizename, String color, String productphotono,
			String photopath, String colorno, String sizeno) {
		super();
		this.productno = productno;
		this.productname = productname;
		this.receivngdate = receivngdate;
		this.productstock = productstock;
		this.inquantity = inquantity;
		this.cost = cost;
		this.price = price;
		this.categoryno = categoryno;
		this.sizename = sizename;
		this.color = color;
		this.productphotono = productphotono;
		this.photopath = photopath;
		this.colorno = colorno;
		this.sizeno = sizeno;
	}

	public String getProductno() {
		return productno;
	}

	public void setProductno(String productno) {
		this.productno = productno;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getReceivngdate() {
		return receivngdate;
	}

	public void setReceivngdate(String receivngdate) {
		this.receivngdate = receivngdate;
	}

	public int getProductstock() {
		return productstock;
	}

	public void setProductstock(int productstock) {
		this.productstock = productstock;
	}

	public int getInquantity() {
		return inquantity;
	}

	public void setInquantity(int inquantity) {
		this.inquantity = inquantity;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCategoryno() {
		return categoryno;
	}

	public void setCategoryno(String categoryno) {
		this.categoryno = categoryno;
	}

	public String getSizename() {
		return sizename;
	}

	public void setSizename(String sizename) {
		this.sizename = sizename;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getProductphotono() {
		return productphotono;
	}

	public void setProductphotono(String productphotono) {
		this.productphotono = productphotono;
	}

	public String getPhotopath() {
		return photopath;
	}

	public void setPhotopath(String photopath) {
		this.photopath = photopath;
	}

	public String getColorno() {
		return colorno;
	}

	public void setColorno(String colorno) {
		this.colorno = colorno;
	}

	public String getSizeno() {
		return sizeno;
	}

	public void setSizeno(String sizeno) {
		this.sizeno = sizeno;
	}

	@Override
	public String toString() {
		return "ProductDTO [productno=" + productno + ", productname=" + productname + ", receivngdate=" + receivngdate
				+ ", productstock=" + productstock + ", inquantity=" + inquantity + ", cost=" + cost + ", price="
				+ price + ", categoryno=" + categoryno + ", sizename=" + sizename + ", color=" + color
				+ ", productphotono=" + productphotono + ", photopath=" + photopath + ", colorno=" + colorno
				+ ", sizeno=" + sizeno + "]";
	}

}