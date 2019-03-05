package com.kh.makeit.sell.model.dao;

import java.util.List;
import java.util.Map;

public interface SellDao {

	List<Map<String, String>> findInterest(int interest);

}
