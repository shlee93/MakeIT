package com.kh.makeit.buy.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.makeit.buy.model.vo.BuyAttach;

public interface BuyService {
	List<Map<String, String>> selectVolList(Map m, int numPerPage, int cPage);
	Map<String,String> selectVolView(Map map);
	int buyCount(Map<String, String> map);
	List<Map<String, String>> buyMainGrade(Map<String, String> map, int cPage, int numPerPage);
	List<Map<String, String>> buyMainNew(Map<String, String> map, int cPage, int numPerPage);
	BuyAttach imageDiv2(String buyNo);
	int searchCount(Map<String, String> map2);
	List<Map<String, String>> buySearch(Map map, int numPerPage, int contentCount, int cPage);
	int buyWriteEnd(ArrayList<BuyAttach> files, Map<String, String> map);
	Map<String, String> buyDetail(int buyNo);
	Map<String, String> selectMainImg(int buyNo);
	List<Map<String, String>> selectSubImg(int buyNo);
	int insertReview(Map<String, String> map);
	List<Map<String, String>> selectReview(int buyNo);
	int selectReviewCnt(int buyNo);
	int deleteReview(Map<String, String> map);
	int updateReview(Map<String, String> map);
	Map<String, String> selectSpec(Map specMap);
	List<Map<String, String>> selectAnother(String memberId, int numPerPage, int contentCount, int cPage);
	int anotherCount(String memberId);
	int buyVolEnd(List<Map<String, String>> files, Map<String, String> map);
	int selectVolCount(String buyNo);
	int insertBuySpec(Map map);
	Map<String, String> selectMemberImg(String memberId);
	Map buyOutBoxYn(Map outBoxc);
	int buyOutBoxInsert(Map outBoxInsert);
	int buyOutBoxDelete(Map outBoxDelete);
	int insertReport(Map reportMap);
	int buyRefund(Map<String, String> map);
	int finishWork(Map<String, String> map);
	List<Map<String, String>> selectDownImg(Map<String, String> map);
	
}
