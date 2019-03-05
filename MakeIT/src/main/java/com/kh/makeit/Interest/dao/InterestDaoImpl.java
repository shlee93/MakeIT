package com.kh.makeit.Interest.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InterestDaoImpl implements InterestDao 
{
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> InterestSelDao(int interestNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("common.interestSel", interestNo);
	}	
}
