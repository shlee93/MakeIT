package com.kh.makeit.buy.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.makeit.buy.model.vo.BuyAttach;

public interface BuyDao {
	List<Map<String, String>> selectVolList(Map m);
	Map<String,String> selectVolView(Map map);
	int buyCount(Map<String, String> map);
	List<Map<String, String>> buyMainGrade(Map<String, String> map, int cPage, int numPerPage);
	List<Map<String, String>> buyMainNew(Map<String, String> map, int cPage, int numPerPage);
	BuyAttach imageDiv2(String buyNo);
	int searchCount(Map<String, String> map2);
	List<Map<String, String>> buySearch(Map map, int numPerPage, int contentCount, int cPage);
	int insertBuy(Map<String, String> map);
	int insertAttach(BuyAttach a);
}
