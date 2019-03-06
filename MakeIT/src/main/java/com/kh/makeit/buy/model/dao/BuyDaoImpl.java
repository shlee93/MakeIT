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
	public List<Map<String, String>> selectVolList(int buyNo, String category) {
		Map<String,String> map = new HashMap();
		map.put("buyNo", String.valueOf(buyNo));
		map.put("category", category);
		return session.selectList("buy.selectVolList",map);
	}

}
