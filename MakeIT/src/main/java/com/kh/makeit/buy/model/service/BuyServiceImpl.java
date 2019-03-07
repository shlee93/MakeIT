package com.kh.makeit.buy.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.makeit.buy.model.dao.BuyDao;

@Service
public class BuyServiceImpl implements BuyService {
	@Autowired
	BuyDao dao;
	
	@Override
	public List<Map<String, String>> selectVolList(Map m) {
		return dao.selectVolList(m);
	}

	@Override
	public Map<String, String> selectVolView(Map map) {
		// TODO Auto-generated method stub
		return dao.selectVolView(map);
	}
	
	
}
