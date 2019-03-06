package com.kh.makeit.buy.model.dao;

import java.util.List;
import java.util.Map;

public interface BuyDao {
	List<Map<String, String>> selectVolList(int buyNo, String category);
}
