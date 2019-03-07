package com.kh.makeit.sell.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.makeit.sell.model.dao.SellDao;

@Service
public class sellServiceImpl implements sellService {
	@Autowired
	SellDao dao;
	@Override
	public List<Map<String, String>> findInterest(int interest) {
		// TODO Auto-generated method stub
		return dao.findInterest(interest);
	}



}
