package com.kh.makeit.contest.vo;

import java.sql.Date;

public class Contest 
{
	private int contestNo;
	private String categoryCode;
	private String contestTitle;
	private String contestContent;
	private Date contestDate;
	private Date contestDeadLine;
	private String contestPrice;
	private String contestYn;
	private int detailInterestNo;
	private int interestNo;
	private String memberId;
	
	public Contest() {
		super();
	}
	
	public Contest(int contestNo, String categoryCode, String contestTitle, String contestContent, Date contestDate,
			Date contestDeadLine, String contestPrice, String contestYn, int detailInterestNo, int interestNo,
			String memberId) 
	{
		super();
		this.contestNo = contestNo;
		this.categoryCode = categoryCode;
		this.contestTitle = contestTitle;
		this.contestContent = contestContent;
		this.contestDate = contestDate;
		this.contestDeadLine = contestDeadLine;
		this.contestPrice = contestPrice;
		this.contestYn = contestYn;
		this.detailInterestNo = detailInterestNo;
		this.interestNo = interestNo;
		this.memberId = memberId;
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

	public String getContestTitle() {
		return contestTitle;
	}

	public void setContestTitle(String contestTitle) {
		this.contestTitle = contestTitle;
	}

	public String getContestContent() {
		return contestContent;
	}

	public void setContestContent(String contestContent) {
		this.contestContent = contestContent;
	}

	public Date getContestDate() {
		return contestDate;
	}

	public void setContestDate(Date contestDate) {
		this.contestDate = contestDate;
	}

	public Date getContestDeadLine() {
		return contestDeadLine;
	}

	public void setContestDeadLine(Date contestDeadLine) {
		this.contestDeadLine = contestDeadLine;
	}

	public String getContestPrice() {
		return contestPrice;
	}

	public void setContestPrice(String contestPrice) {
		this.contestPrice = contestPrice;
	}

	public String getContestYn() {
		return contestYn;
	}

	public void setContestYn(String contestYn) {
		this.contestYn = contestYn;
	}

	public int getDetailInterestNo() {
		return detailInterestNo;
	}

	public void setDetailInterestNo(int detailInterestNo) {
		this.detailInterestNo = detailInterestNo;
	}

	public int getInterestNo() {
		return interestNo;
	}

	public void setInterestNo(int interestNo) {
		this.interestNo = interestNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "Contest [contestNo=" + contestNo + ", categoryCode=" + categoryCode + ", contestTitle=" + contestTitle
				+ ", contestContent=" + contestContent + ", contestDate=" + contestDate + ", contestDeadLine="
				+ contestDeadLine + ", contestPrice=" + contestPrice + ", contestYn=" + contestYn
				+ ", detailInterestNo=" + detailInterestNo + ", interestNo=" + interestNo + ", memberId=" + memberId
				+ "]";
	}	
}
