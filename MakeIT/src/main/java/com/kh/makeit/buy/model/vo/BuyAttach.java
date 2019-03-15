package com.kh.makeit.buy.model.vo;

public class BuyAttach {
	private int buyImgNo;
	private int buyNo;
	private String categoryCode;
	private String buyImgOri;
	private String buyImgRe;
	
	public BuyAttach() {
		super();
	}
	public BuyAttach(int buyImgNo, int buyNo, String categoryCode, String buyImgOri, String buyImgRe) {
		super();
		this.buyImgNo = buyImgNo;
		this.buyNo = buyNo;
		this.categoryCode = categoryCode;
		this.buyImgOri = buyImgOri;
		this.buyImgRe = buyImgRe;
	}
	public int getBuyImgNo() {
		return buyImgNo;
	}
	public void setBuyImgNo(int buyImgNo) {
		this.buyImgNo = buyImgNo;
	}
	public int getBuyNo() {
		return buyNo;
	}
	public void setBuyNo(int buyNo) {
		this.buyNo = buyNo;
	}
	public String getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}
	public String getBuyImgOri() {
		return buyImgOri;
	}
	public void setBuyImgOri(String buyImgOri) {
		this.buyImgOri = buyImgOri;
	}
	public String getBuyImgRe() {
		return buyImgRe;
	}
	public void setBuyImgRe(String buyImgRe) {
		this.buyImgRe = buyImgRe;
	}
	@Override
	public String toString() {
		return "BuyAttach [buyImgNo=" + buyImgNo + ", buyNo=" + buyNo + ", categoryCode=" + categoryCode
				+ ", buyImgOri=" + buyImgOri + ", buyImgRe=" + buyImgRe + "]";
	}
	
	
}
