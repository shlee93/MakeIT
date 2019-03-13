package com.kh.makeit.contest.dao;

import java.util.List;
import java.util.Map;

import com.kh.makeit.contest.vo.ContestImg;

public interface ContestDao 
{
	int contestCountDao();
	List<Map<String,String>> getContestListDao(int cPage, int numPerPage);
	ContestImg getContestPerFirstImgDao(int contestNo);
	List<Map<String,String>> getContestDetailImg(int contestNo);
	Map<String,String> contestDetailDao(int contestNo);
	int contestFormEndDao(Map<String,String> contest);
	Map<String,String> contestApplicantCheckDao(Map<String,String> checkMap);
	int insertContestImg(ContestImg contestImg);
	List<Map> contestApplcantListDao(int contestNo);
	int contestApplicantDao(Map<String,String> applicant);
	Map contestApplicantOneDao(Map applicantInfo);
	int applicantConfirmDao(Map applicantConfirmInfo);
	int contestDelDao(int contestDelNo);
	Map contestModifyDao(int contestNo);
	List<Map<String,String>> contestModifyImg(int contestNo);
	int contestModifyEndDao(Map<String,String> contest);
	int contestModifyForeDelImg(int contestNo);
	int contestUpdateImg(ContestImg contestImg);
	
}
