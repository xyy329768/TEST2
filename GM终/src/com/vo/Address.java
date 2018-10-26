package com.vo;

public class Address {

	private Integer aid;    
	private String  aname;
	private String  aprovince;	  
	private String	acity;
	private String  adetailed;
	private String aphone;
	private Integer userid;
	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getAprovince() {
		return aprovince;
	}
	public void setAprovince(String aprovince) {
		this.aprovince = aprovince;
	}
	public String getAcity() {
		return acity;
	}
	public void setAcity(String acity) {
		this.acity = acity;
	}
	public String getAdetailed() {
		return adetailed;
	}
	public void setAdetailed(String adetailed) {
		this.adetailed = adetailed;
	}
	public String getAphone() {
		return aphone;
	}
	public void setAphone(String aphone) {
		this.aphone = aphone;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "Address [aid=" + aid + ", aname=" + aname + ", aprovince="
				+ aprovince + ", acity=" + acity + ", adetailed=" + adetailed
				+ ", aphone=" + aphone + ", userid=" + userid + "]";
	}
	
	
	
	
}
