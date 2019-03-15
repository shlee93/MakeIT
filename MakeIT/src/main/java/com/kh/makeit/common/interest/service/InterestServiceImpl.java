package com.kh.makeit.common.interest.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.makeit.common.interest.dao.InterestDao;

@Service
public class InterestServiceImpl implements InterestService 
{
	@Autowired InterestDao id;
	@Override
	public List<Map<String,String>> interestSelService(int interestNo) {
		// TODO Auto-generated method stub		
		return id.InterestSelDao(interestNo);
	}
	
}
