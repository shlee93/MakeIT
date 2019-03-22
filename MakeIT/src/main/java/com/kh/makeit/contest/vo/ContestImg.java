package com.kh.makeit.contest.vo;

public class ContestImg
{
	private int contestImgNo;
	private int contestNo;
	private String categoryCode;
	private String contestImgOri;
	private String contestImgRe;	
	
	public ContestImg() {
		super();
	}

	public ContestImg(int contestImgNo, int contestNo, String categoryCode, String contestImgOri, String contestImgRe) {
		super();
		this.contestImgNo = contestImgNo;
		this.contestNo = contestNo;
		this.categoryCode = categoryCode;
		this.contestImgOri = contestImgOri;
		this.contestImgRe = contestImgRe;
	}

	public int getContestImgNo() {
		return contestImgNo;
	}

	public void setContestImgNo(int contestImgNo) {
		this.contestImgNo = contestImgNo;
	}

	public int getContestNo() {
		return contestNo;
	}

	public void setContestNo(int contestNo) {
		this.contestNo = contestNo;
	}

	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getContestImgOri() {
		return contestImgOri;
	}

	public void setContestImgOri(String contestImgOri) {
		this.contestImgOri = contestImgOri;
	}

	public String getContestImgRe() {
		return contestImgRe;
	}

	public void setContestImgRe(String contestImgRe) {
		this.contestImgRe = contestImgRe;
	}

	@Override
	public String toString() {
		return "ContestImg [contestImgNo=" + contestImgNo + ", contestNo=" + contestNo + ", categoryCode="
				+ categoryCode + ", contestImgOri=" + contestImgOri + ", contestImgRe=" + contestImgRe + "]";
	}
	
	
}