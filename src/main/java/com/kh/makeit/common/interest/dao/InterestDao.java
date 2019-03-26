package com.kh.makeit.common.interest.dao;

import java.util.List;
import java.util.Map;

public interface InterestDao 
{
	List<Map<String,String>> InterestSelDao(int categoryNo);
}
