package com.kh.makeit.sell.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.makeit.sell.model.vo.SellAttach;
import com.kh.makeit.sell.model.vo.SellOption;
@Repository
public class SellDaoImpl implements SellDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> findInterest(int interest) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sell.findInterest",interest);
	}

	@Override
	public int insertDataMap(Map dataMap) {
		// TODO Auto-generated method stub
		return sqlSession.insert("sell.insertDataMap",dataMap);
	}

	@Override
	public int insertAttach(SellAttach a) {
		// TODO Auto-generated method stub
		return sqlSession.insert("sell.insertAttach",a);
	}

	@Override
	public int insertOption(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("sell.insertOption",map);
	}
	
	@Override
	public List<Map> sellMainGrade(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sell.sellMainGrade", map);
	}

	@Override
	public List<Map> sellMainPerformance(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sell.sellMainPerformance", map);
	}

	@Override
	public List<Map> sellMainNew(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sell.sellMainNew", map);
	}
	

}
