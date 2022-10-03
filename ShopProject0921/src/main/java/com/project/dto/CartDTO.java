package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("cart")
public class CartDTO {
	private String productno;
	private String memberid;
	private String guesttelno;
	private int quantity;
	private String colorno;
	private String sizeno;
	private String productname;
	private int price;
	private String colorname;
	private String sizekind;
	private String photopath;
	private String cartdate;
	private String productphotono;


	public CartDTO() {
	}

	public CartDTO(String productno, String memberid, String guesttelno, int quantity, String colorno, String sizeno,
			String productname, int price, String colorname, String sizekind, String photopath, String cartdate) {
		super();
		this.productno = productno;
		this.memberid = memberid;
		this.guesttelno = guesttelno;
		this.quantity = quantity;
		this.colorno = colorno;
		this.sizeno = sizeno;
		this.productname = productname;
		this.price = price;
		this.colorname = colorname;
		this.sizekind = sizekind;
		this.photopath = photopath;
		this.cartdate = cartdate;
	}
	
	public String getProductphotono() {
		return productphotono;
	}

	public void setProductphotono(String productphotono) {
		this.productphotono = productphotono;
	}
	public String getProductno() {
		return productno;
	}

	public void setProductno(String productno) {
		this.productno = productno;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getGuesttelno() {
		return guesttelno;
	}

	public void setGuesttelno(String guesttelno) {
		this.guesttelno = guesttelno;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
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

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getColorname() {
		return colorname;
	}

	public void setColorname(String colorname) {
		this.colorname = colorname;
	}

	public String getSizekind() {
		return sizekind;
	}

	public void setSizekind(String sizekind) {
		this.sizekind = sizekind;
	}

	public String getPhotopath() {
		return photopath;
	}

	public void setPhotopath(String photopath) {
		this.photopath = photopath;
	}

	public String getCartdate() {
		return cartdate;
	}

	public void setCartdate(String cartdate) {
		this.cartdate = cartdate;
	}

	@Override
	public String toString() {
		return "CartDTO [productno=" + productno + ", memberid=" + memberid + ", guesttelno=" + guesttelno
				+ ", quantity=" + quantity + ", colorno=" + colorno + ", sizeno=" + sizeno + ", productname="
				+ productname + ", price=" + price + ", colorname=" + colorname + ", sizekind=" + sizekind
				+ ", photopath=" + photopath + ", cartdate=" + cartdate + "]";
	}

}
