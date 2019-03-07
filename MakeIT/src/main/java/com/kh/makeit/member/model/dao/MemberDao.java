package com.kh.makeit.member.model.dao;

import java.util.Map;

public interface MemberDao {

	Map<String, String> idDuplicate(String memberId);

	int insertMember(Map<Object, Object> map);

	Map<Object, Object> login(Map<String, String> map);

	Map<Object, Object> selectOne(String id);

	int memberIntroduction(Map<String, String> map);

	int selectBuyCount(String id);

	int boardSellCount(String id);

	double buyAvg(String id);

	double sellAvg(String id);

	String searchId(String email);

	String searchEmail(String id);

	int updatePw(Map<String, String> map);

}
