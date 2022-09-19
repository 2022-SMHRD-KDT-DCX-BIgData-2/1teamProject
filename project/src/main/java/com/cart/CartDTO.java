package com.cart;

public class CartDTO {

	private String userid;
	private String martName;
	private String prodImage;
	private String prodName;
	private int prodPrice;
	private String link;
	private int prodCode;
	public String getUserid() {
		return userid;
	}
	public String getMartName() {
		return martName;
	}
	public String getProdImage() {
		return prodImage;
	}
	public String getProdName() {
		return prodName;
	}
	public int getProdPrice() {
		return prodPrice;
	}
	public String getLink() {
		return link;
	}
	public int getProdCode() {
		return prodCode;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public void setMartName(String martName) {
		this.martName = martName;
	}
	public void setProdImage(String prodImage) {
		this.prodImage = prodImage;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public void setProdCode(int prodCode) {
		this.prodCode = prodCode;
	}
	
	
	
}
