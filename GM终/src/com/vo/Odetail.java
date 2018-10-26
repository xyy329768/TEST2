package com.vo;

public class Odetail {
	private String oid;
	private int pid;
	private int psum;
	private String pname;
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	@Override
	public String toString() {
		return "Odetail [oid=" + oid + ", pid=" + pid + ", psum=" + psum
				+ ", beizhu=" + beizhu + ", quality=" + quality + "]";
	}
	private String beizhu;
	private int quality;
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getPsum() {
		return psum;
	}
	public void setPsum(int psum) {
		this.psum = psum;
	}
	public String getBeizhu() {
		return beizhu;
	}
	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}
	public int getQuality() {
		return quality;
	}
	public void setQuality(int quality) {
		this.quality = quality;
	}
}
