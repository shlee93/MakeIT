package com.kh.makeit.sell.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.makeit.sell.model.vo.SellAttach;
import com.kh.makeit.sell.model.vo.SellOption;

public interface sellService {

	List<Map<String, String>> findInterest(int interest);

	int sellWriteEnd(ArrayList<SellAttach> files, Map dataMap, SellOption selloption);

	List<Map> sellMainGrade(Map map);

	List<Map> sellMainPerformance(Map map);

	List<Map> sellMainNew(Map map);

}
