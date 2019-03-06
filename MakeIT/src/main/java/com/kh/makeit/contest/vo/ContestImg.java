package com.kh.makeit.contest.vo;

public class ContestImg extends Contest 
{
	private int contestImgNo;
	private String[] contestImgOri;
	private String[] contestImgRe;
	
	public ContestImg() {
		super();
	}

	public ContestImg(int contestImgNo, String[] contestImgOri, String[] contestImgRe) {
		super();
		this.contestImgNo = contestImgNo;
		this.contestImgOri = contestImgOri;
		this.contestImgRe = contestImgRe;
	}

	public int getContestImgNo() {
		return contestImgNo;
	}

	public void setContestImgNo(int contestImgNo) {
		this.contestImgNo = contestImgNo;
	}

	public String[] getContestImgOri() {
		return contestImgOri;
	}

	public void setContestImgOri(String[] contestImgOri) {
		this.contestImgOri = contestImgOri;
	}

	public String[] getContestImgRe() {
		return contestImgRe;
	}

	public void setContestImgRe(String[] contestImgRe) {
		this.contestImgRe = contestImgRe;
	}
	
	
	
}
