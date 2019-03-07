package com.kh.makeit.member.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.makeit.member.model.dao.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;
	
	@Override
	public Map<String, String> idDuplicate(String memberId) {
		return dao.idDuplicate(memberId);
	}

	@Override
	public int insertMember(Map<Object, Object> map) {
		return dao.insertMember(map);
	}

	@Override
	public Map<Object, Object> login(Map<String, String> map) {
		return dao.login(map);
	}

	@Override
	public Map<Object, Object> selectOne(String id) {
		return dao.selectOne(id);
	}

	@Override
	public int memberIntroduction(Map<String, String> map) {
		return dao.memberIntroduction(map);
	}

	@Override
	public int selectBuyCount(String id) {
		return dao.selectBuyCount(id);
	}

	@Override
	public int boardSellCount(String id) {
		return dao.boardSellCount(id);
	}

	@Override
	public double buyAvg(String id) {
		return dao.buyAvg(id);
	}

	@Override
	public double sellAvg(String id) {
		return dao.sellAvg(id);
	}

}
