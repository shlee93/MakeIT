package com.kh.makeit.buy.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BuyDaoImpl implements BuyDao {
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Map<String, String>> selectVolList(Map m) {
		
		return session.selectList("buy.selectVolList",m);
	}

	@Override
	public Map<String, String> selectVolView(Map map) {
		// TODO Auto-generated method stub
		return session.selectOne("buy.selectVolView", map);
	}
	
	

}
