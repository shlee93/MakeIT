package com.kh.makeit.board.model.vo;

public class BoardAttach {
	
	private int freeImgNo;
	private int freeNo;
	private String categoryCode;
	private String freeImgOri;
	private String freeImgRe;
	
	public  BoardAttach() {}
	
	public BoardAttach(int freeImgNo, int freeNo, String categoryCode, String freeImgOri, String freeImgRe) {
		super();
		this.freeImgNo = freeImgNo;
		this.freeNo = freeNo;
		this.categoryCode = categoryCode;
		this.freeImgOri = freeImgOri;
		this.freeImgRe = freeImgRe;
	}

	public int getFreeImgNo() {
		return freeImgNo;
	}


	public void setFreeImgNo(int freeImgNo) {
		this.freeImgNo = freeImgNo;
	}




	public int getFreeNo() {
		return freeNo;
	}




	public void setFreeNo(int freeNo) {
		this.freeNo = freeNo;
	}




	public String getCategoryCode() {
		return categoryCode;
	}




	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}




	public String getFreeImgOri() {
		return freeImgOri;
	}




	public void setFreeImgOri(String freeImgOri) {
		this.freeImgOri = freeImgOri;
	}




	public String getFreeImgRe() {
		return freeImgRe;
	}




	public void setFreeImgRe(String freeImgRe) {
		this.freeImgRe = freeImgRe;
	}


	@Override
	public String toString() {
		return "BoardAttach [freeImgNo=" + freeImgNo + ", freeNo=" + freeNo + ", categoryCode=" + categoryCode
				+ ", freeImgOri=" + freeImgOri + ", freeImgRe=" + freeImgRe + "]";
	};
	
}
