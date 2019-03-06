package com.kh.makeit.member.model.service;

import java.util.Map;

public interface MemberService {

	Map<String, String> idDuplicate(String memberId);

	int insertMember(Map<Object, Object> map);

	Map<Object, Object> login(Map<String, String> map);
	
	Map<Object, Object> selectOne(String id);

	int memberIntroduction(Map<String, String> map);

}
