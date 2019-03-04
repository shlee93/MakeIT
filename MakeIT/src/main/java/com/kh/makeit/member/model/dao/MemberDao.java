package com.kh.makeit.member.model.dao;

import java.util.Map;

public interface MemberDao {

	Map<String, String> idDuplicate(String memberId);

	int insertMember(Map<Object, Object> map);

}
