package com.vo;

import com.page.OrderCondition;

public class Product {
	private Integer pid;
	private String pname;
	private double price;
	private int pingjiaSum;
	private String dianpuName;
	private String productListLargeImage1;
	private String productListLargeImage2;
	private String productListLargeImage3;
	private String productListSmallImage1;
	private String productListSmallImage2;
	private String productListSmallImage3;
	private String pdesc;
	private int productSum;
	private String detailLargeImg1;
	private String detailLargeImg2;
	private String detailLargeImg3;
	private String detailLargeImg4;
	private String detailLargeImg5;
	private String beizhu;
	private String detailSmallImg1;
	private String detailSmallImg2;
	private String detailSmallImg3;
	private String detailSmallImg4;
	private String detailSmallImg5;
	private String shoppingCarImg;
	
	public OrderCondition getOrderCondition() {
		return orderCondition;
	}
	public void setOrderCondition(OrderCondition orderCondition) {
		this.orderCondition = orderCondition;
	}
	private OrderCondition orderCondition;
	
	public String getBeizhu() {
		return beizhu;
	}
	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}
	//购物车中该商品的数量
	private int shoppingCarSum;
	public int getShoppingCarSum() {
			return shoppingCarSum;
		}
		public void setShoppingCarSum(int shoppingCarSum) {
			this.shoppingCarSum = shoppingCarSum;
		}
	public String getDetailLargeImg4() {
		return detailLargeImg4;
	}
	public void setDetailLargeImg4(String detailLargeImg4) {
		this.detailLargeImg4 = detailLargeImg4;
	}
	public String getDetailLargeImg5() {
		return detailLargeImg5;
	}
	public void setDetailLargeImg5(String detailLargeImg5) {
		this.detailLargeImg5 = detailLargeImg5;
	}
	
	public String getShoppingCarImg() {
		return shoppingCarImg;
	}
	public void setShoppingCarImg(String shoppingCarImg) {
		this.shoppingCarImg = shoppingCarImg;
	}
	private Integer onsale;
	private Integer cid;
	private Category2 category;
	public Category2 getCategory() {
		return category;
	}
	public void setCategory(Category2 category) {
		this.category = category;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getPingjiaSum() {
		return pingjiaSum;
	}
	public void setPingjiaSum(int pingjiaSum) {
		this.pingjiaSum = pingjiaSum;
	}
	public String getDianpuName() {
		return dianpuName;
	}
	public void setDianpuName(String dianpuName) {
		this.dianpuName = dianpuName;
	}
	public String getProductListLargeImage1() {
		return productListLargeImage1;
	}
	public void setProductListLargeImage1(String productListLargeImage1) {
		this.productListLargeImage1 = productListLargeImage1;
	}
	public String getProductListLargeImage2() {
		return productListLargeImage2;
	}
	public void setProductListLargeImage2(String productListLargeImage2) {
		this.productListLargeImage2 = productListLargeImage2;
	}
	public String getProductListLargeImage3() {
		return productListLargeImage3;
	}
	public void setProductListLargeImage3(String productListLargeImage3) {
		this.productListLargeImage3 = productListLargeImage3;
	}
	public String getProductListSmallImage1() {
		return productListSmallImage1;
	}
	public void setProductListSmallImage1(String productListSmallImage1) {
		this.productListSmallImage1 = productListSmallImage1;
	}
	public String getProductListSmallImage2() {
		return productListSmallImage2;
	}
	public void setProductListSmallImage2(String productListSmallImage2) {
		this.productListSmallImage2 = productListSmallImage2;
	}
	public String getProductListSmallImage3() {
		return productListSmallImage3;
	}
	public void setProductListSmallImage3(String productListSmallImage3) {
		this.productListSmallImage3 = productListSmallImage3;
	}
	public String getPdesc() {
		return pdesc;
	}
	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}
	public int getProductSum() {
		return productSum;
	}
	public void setProductSum(int productSum) {
		this.productSum = productSum;
	}
	public String getDetailLargeImg1() {
		return detailLargeImg1;
	}
	public void setDetailLargeImg1(String detailLargeImg1) {
		this.detailLargeImg1 = detailLargeImg1;
	}
	public String getDetailLargeImg2() {
		return detailLargeImg2;
	}
	public void setDetailLargeImg2(String detailLargeImg2) {
		this.detailLargeImg2 = detailLargeImg2;
	}
	public String getDetailLargeImg3() {
		return detailLargeImg3;
	}
	public void setDetailLargeImg3(String detailLargeImg3) {
		this.detailLargeImg3 = detailLargeImg3;
	}
	public String getDetailSmallImg1() {
		return detailSmallImg1;
	}
	public void setDetailSmallImg1(String detailSmallImg1) {
		this.detailSmallImg1 = detailSmallImg1;
	}
	public String getDetailSmallImg2() {
		return detailSmallImg2;
	}
	public void setDetailSmallImg2(String detailSmallImg2) {
		this.detailSmallImg2 = detailSmallImg2;
	}
	public String getDetailSmallImg3() {
		return detailSmallImg3;
	}
	public void setDetailSmallImg3(String detailSmallImg3) {
		this.detailSmallImg3 = detailSmallImg3;
	}
	public String getDetailSmallImg4() {
		return detailSmallImg4;
	}
	public void setDetailSmallImg4(String detailSmallImg4) {
		this.detailSmallImg4 = detailSmallImg4;
	}
	public String getDetailSmallImg5() {
		return detailSmallImg5;
	}
	public void setDetailSmallImg5(String detailSmallImg5) {
		this.detailSmallImg5 = detailSmallImg5;
	}
	public Integer getOnsale() {
		return onsale;
	}
	public void setOnsale(Integer onsale) {
		this.onsale = onsale;
	}
	@Override
	public String toString() {
		return "Product [pid=" + pid + ", pname=" + pname + ", price=" + price + ", pingjiaSum=" + pingjiaSum
				+ ", dianpuName=" + dianpuName + ", productListLargeImage1=" + productListLargeImage1
				+ ", productListLargeImage2=" + productListLargeImage2 + ", productListLargeImage3="
				+ productListLargeImage3 + ", productListSmallImage1=" + productListSmallImage1
				+ ", productListSmallImage2=" + productListSmallImage2 + ", productListSmallImage3="
				+ productListSmallImage3 + ", pdesc=" + pdesc + ", productSum=" + productSum + ", detailLargeImg1="
				+ detailLargeImg1 + ", detailLargeImg2=" + detailLargeImg2 + ", detailLargeImg3=" + detailLargeImg3
				+ ", detailLargeImg4=" + detailLargeImg4 + ", detailLargeImg5=" + detailLargeImg5 + ", beizhu=" + beizhu
				+ ", orderCondition=" + orderCondition + ", shoppingCarSum=" + shoppingCarSum + ", detailSmallImg1="
				+ detailSmallImg1 + ", detailSmallImg2=" + detailSmallImg2 + ", detailSmallImg3=" + detailSmallImg3
				+ ", detailSmallImg4=" + detailSmallImg4 + ", detailSmallImg5=" + detailSmallImg5 + ", shoppingCarImg="
				+ shoppingCarImg + ", onsale=" + onsale + ", cid=" + cid + ", category=" + category + "]";
	}
	
	
	
	
}
