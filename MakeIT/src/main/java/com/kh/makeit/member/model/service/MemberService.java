package com.kh.makeit.member.model.service;

import java.util.Map;

public interface MemberService {

	Map<String, String> idDuplicate(String memberId);

	int insertMember(Map<Object, Object> map);

}
