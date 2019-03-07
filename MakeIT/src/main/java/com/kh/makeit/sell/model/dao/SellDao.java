package com.kh.makeit.sell.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.makeit.sell.model.vo.SellAttach;
import com.kh.makeit.sell.model.vo.SellOption;

public interface SellDao {

	List<Map<String, String>> findInterest(int interest);

	int insertDataMap(Map dataMap);

	int insertAttach(SellAttach a);

	int insertOption(Map<String, String> map);

}
