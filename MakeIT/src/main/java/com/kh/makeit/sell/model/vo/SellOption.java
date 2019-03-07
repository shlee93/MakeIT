package com.kh.makeit.sell.model.vo;

import java.util.Arrays;

public class SellOption {
	private String[] selloptionNo;
	private int sellNo;
	private String categoryCode;
	private String[] sellPrice;
	private String[] sellOptionContent;
	private String[] selldeadline;
	
	

	public SellOption() {
		super();
		// TODO Auto-generated constructor stub
	}



	public SellOption(String[] selloptionNo, int sellNo, String categoryCode, String[] sellPrice,
			String[] sellOptionContent, String[] selldeadline) {
		super();
		this.selloptionNo = selloptionNo;
		this.sellNo = sellNo;
		this.categoryCode = categoryCode;
		this.sellPrice = sellPrice;
		this.sellOptionContent = sellOptionContent;
		this.selldeadline = selldeadline;
	}



	public String[] getSelloptionNo() {
		return selloptionNo;
	}



	public void setSelloptionNo(String[] selloptionNo) {
		this.selloptionNo = selloptionNo;
	}



	public int getSellNo() {
		return sellNo;
	}



	public void setSellNo(int sellNo) {
		this.sellNo = sellNo;
	}



	public String getCategoryCode() {
		return categoryCode;
	}



	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}



	public String[] getSellPrice() {
		return sellPrice;
	}



	public void setSellPrice(String[] sellPrice) {
		this.sellPrice = sellPrice;
	}



	public String[] getSellOptionContent() {
		return sellOptionContent;
	}



	public void setSellOptionContent(String[] sellOptionContent) {
		this.sellOptionContent = sellOptionContent;
	}



	public String[] getSelldeadline() {
		return selldeadline;
	}



	public void setSelldeadline(String[] selldeadline) {
		this.selldeadline = selldeadline;
	}



	@Override
	public String toString() {
		return "SellOption [selloptionNo=" + Arrays.toString(selloptionNo) + ", sellNo=" + sellNo + ", categoryCode="
				+ categoryCode + ", sellPrice=" + Arrays.toString(sellPrice) + ", sellOptionContent="
				+ Arrays.toString(sellOptionContent) + ", selldeadline=" + Arrays.toString(selldeadline) + "]";
	}
	

}
