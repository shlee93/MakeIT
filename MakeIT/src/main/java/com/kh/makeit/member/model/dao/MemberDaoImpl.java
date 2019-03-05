package com.kh.makeit.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public Map<String, String> idDuplicate(String memberId) {
		return sqlSession.selectOne("member.idDuplicate",memberId);
	}

	@Override
	public int insertMember(Map<Object, Object> map) {
		return sqlSession.insert("member.insertMember",map);
	}

	@Override
	public Map<String, String> login(Map<String, String> map) {
		return sqlSession.selectOne("member.login",map);
	}

}
