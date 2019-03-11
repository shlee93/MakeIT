package com.kh.makeit.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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
	public Map<Object, Object> login(Map<String, String> map) {
		return sqlSession.selectOne("member.login",map);
	}

	@Override
	public Map<Object, Object> selectOne(String id) {
		return sqlSession.selectOne("member.selectOne",id);
	}

	@Override
	public int memberIntroduction(Map<String, String> map) {
		return sqlSession.update("member.memberIntroduction",map);
	}

	@Override
	public int selectBuyCount(String id) {
		return sqlSession.selectOne("member.selectBuyCount",id);
	}

	@Override
	public int boardSellCount(String id) {
		return sqlSession.selectOne("member.boardSellCount",id);
	}

	@Override
	public double buyAvg(String id) {
		return sqlSession.selectOne("member.buyAvg",id);
	}

	@Override
	public double sellAvg(String id) {
		return sqlSession.selectOne("member.sellAvg",id);
	}

	@Override
	public String searchId(String email) {
		return sqlSession.selectOne("member.searchId",email);
	}

	@Override
	public String searchEmail(String id) {
		return sqlSession.selectOne("member.searchEmail",id);
	}

	@Override
	public int updatePw(Map<String, String> map) {
		return sqlSession.update("member.updatePw",map);
	}

	
	
	
	
	
	
	
	
	
	
	
	

}
