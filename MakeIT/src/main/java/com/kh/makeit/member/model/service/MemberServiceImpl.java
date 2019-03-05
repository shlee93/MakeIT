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
	public Map<String, String> login(Map<String, String> map) {
		return dao.login(map);
	}

}
