package com.kh.makeit.member.model.service;

import java.util.List;
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

	@Override
	public String searchId(String email) {
		return dao.searchId(email);
	}

	@Override
	public String searchEmail(String id) {
		return dao.searchEmail(id);
	}

	@Override
	public int updatePw(Map<String, String> map) {
		return dao.updatePw(map);
	}

	@Override
	public int memberUpdate(Map<Object, Object> map) {
		return dao.memberUpdate(map);
	}

	@Override
	public int deleteMember(String id) {
		return dao.deleteMember(id);
	}

	@Override
	public List<Map<String, String>> buyOutBoxList(String memberId, int buycPage, int numPerPage) {
		return dao.buyOutBoxList(memberId,buycPage,numPerPage);
	}

	@Override
	public List<Map<String, String>> sellOutBoxList(String memberId, int sellcPage, int numPerPage) {
		return dao.sellOutBoxList(memberId,sellcPage,numPerPage);
	}

}
