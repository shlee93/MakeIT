package com.kh.makeit.buy.model.service;

import java.util.List;
import java.util.Map;

public interface BuyService {
	List<Map<String, String>> selectVolList(int buyNo, String category);
}
