package com.kh.makeit.sell.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class SellDaoImpl implements SellDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> findInterest(int interest) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sell.findInterest",interest);
	}
	

}
