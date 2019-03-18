package com.kh.makeit.buy.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.makeit.buy.model.vo.BuyAttach;

public interface BuyDao {
	List<Map<String, String>> selectVolList(Map m, int numPerPage, int cPage);
	Map<String,String> selectVolView(Map map);
	int buyCount(Map<String, String> map);
	List<Map<String, String>> buyMainGrade(Map<String, String> map, int cPage, int numPerPage);
	List<Map<String, String>> buyMainNew(Map<String, String> map, int cPage, int numPerPage);
	BuyAttach imageDiv2(String buyNo);
	int searchCount(Map<String, String> map2);
	List<Map<String, String>> buySearch(Map map, int numPerPage, int contentCount, int cPage);
	int insertBuy(Map<String, String> map);
	int insertAttach(BuyAttach a);
	Map<String, String> buyDetail(int buyNo);
	Map<String, String> selectMainImg(int buyNo);
	List<Map<String, String>> selectSubImg(int buyNo);
	List<Map<String, String>> selectReview(int buyNo);
	int insertReview(Map<String, String> map);
	int selectReviewCnt(int buyNo);
	int deleteReview(Map<String, String> map);
	int updateReview(Map<String, String> map);
	Map<String, String> selectSpec(Map specMap);
	List<Map<String, String>> selectAnother(String memberId, int numPerPage, int contentCount, int cPage);
	int anotherCount(String memberId);
	int insertVol(Map<String, String> map);
	int insertVolImg(Map<String, String> a);
	int selectVolCount(String buyNo);
	int insertBuySpec(Map map);
	
}
