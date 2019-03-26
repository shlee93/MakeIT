package com.kh.makeit.sell.model.vo;

public class SellAttach {
	private int sellImgNo;
	private int sellNo;
	private String categoryCode;
	private String sellImgOri;
	private String sellImgRe;
	
	public SellAttach() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SellAttach(int sellImgNo, int sellNo, String categoryCode, String sellImgOri, String sellImgRe) {
		super();
		this.sellImgNo = sellImgNo;
		this.sellNo = sellNo;
		this.categoryCode = categoryCode;
		this.sellImgOri = sellImgOri;
		this.sellImgRe = sellImgRe;
	}

	public int getSellImgNo() {
		return sellImgNo;
	}

	public void setSellImgNo(int sellImgNo) {
		this.sellImgNo = sellImgNo;
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

	public String getSellImgOri() {
		return sellImgOri;
	}

	public void setSellImgOri(String sellImgOri) {
		this.sellImgOri = sellImgOri;
	}

	public String getSellImgRe() {
		return sellImgRe;
	}

	public void setSellImgRe(String sellImgRe) {
		this.sellImgRe = sellImgRe;
	}

	@Override
	public String toString() {
		return "SellAttach [sellImgNo=" + sellImgNo + ", sellNo=" + sellNo + ", categoryCode=" + categoryCode
				+ ", sellImgOri=" + sellImgOri + ", sellImgRe=" + sellImgRe + "]";
	}
	
	
}
