package com.product;

public class ProductDTO {
	private int prodCode;
	private String categoryName;
	private String prodName;
	private int prodPrice;
	private String prodImage;
	private String link;
	private int prodStar;
	private int prodReview;
	public int getProdCode() {
		return prodCode;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public String getProdName() {
		return prodName;
	}
	public int getProdPrice() {
		return prodPrice;
	}
	public String getProdImage() {
		return prodImage;
	}
	public String getLink() {
		return link;
	}
	public int getProdStar() {
		return prodStar;
	}
	public int getProdReview() {
		return prodReview;
	}
	public void setProdCode(int prodCode) {
		this.prodCode = prodCode;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}
	public void setProdImage(String prodImage) {
		this.prodImage = prodImage;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public void setProdStar(int prodStar) {
		this.prodStar = prodStar;
	}
	public void setProdReview(int prodReview) {
		this.prodReview = prodReview;
	}
	
	
	
}
