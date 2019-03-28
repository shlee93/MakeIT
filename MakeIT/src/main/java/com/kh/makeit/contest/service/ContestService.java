package com.kh.makeit.contest.service;

import java.util.List;
import java.util.Map;

import com.kh.makeit.common.exception.BoardException;
import com.kh.makeit.contest.vo.ContestImg;

public interface ContestService 
{
	int contestCountService();
	int sortCountService(Map<String,String> searchFlag);
	List<Map<String,String>> getContestListService(int cPage, int numPerPage);
	List<Map<String,String>> contestSortService(int cPage, int numPerPage, Map<String,String>searchFlag);
	ContestImg getContestPerFirstImgService(int contestNo);
	List<Map<String,String>> contestDetailService(int contestNo);
	int contestFormEndService(Map<String,String> contest, List<ContestImg> files) throws BoardException;
	Map<String,String> contestApplicantCheckService(Map<String,String> checkMap);
	int contestApplicantService(Map<String,String> applicant); 
	List<Map> contestApplicantListService(int contestNo);
	Map contestApplicantOneService(Map applicantInfo); 
	int applicantConfirmService(Map applicantConfirmInfo);
	int contestDelService(int contestDelNo);
	Map contestModifyService(int contestNo);
	List<Map<String,String>> contestModifyImgService(int contestNo);
	List<ContestImg> contestPreModifyImgService(int contestNo);
	int contestModifyEndService(Map<String,String> contest, List<ContestImg> files) throws BoardException;
	int contestModifyEndService(Map contest);
	Map contestOutBoxYnService(Map outBoxc);
	int contestOutBoxInsertService(Map outBoxInsert);
	int contestOutBoxDeleteService(Map outBoxDelete);
	int insertReportService(Map reportMap);
	List<Map<String,String>> detailInterestCategoryService();
}
