package com.client;

public class MemberDTO {
	
	private String name;
	private String userid;
	private String pwd;
	private String email_id;
	private String email_domain;
	private String phone;
	
	
	
	public String getName() {
		return name;
	}
	public String getUserid() {
		return userid;
	}
	public String getPwd() {
		return pwd;
	}
	public String getEmail_id() {
		return email_id;
	}
	public String getEmail_domain() {
		return email_domain;
	}
	public String getPhone() {
		return phone;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public void setEmail_domain(String email_domain) {
		this.email_domain = email_domain;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
}
