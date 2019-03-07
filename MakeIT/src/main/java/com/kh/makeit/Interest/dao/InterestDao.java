package com.kh.makeit.Interest.dao;

import java.util.List;
import java.util.Map;

public interface InterestDao 
{
	List<Map<String,String>> InterestSelDao(int categoryNo);
}
