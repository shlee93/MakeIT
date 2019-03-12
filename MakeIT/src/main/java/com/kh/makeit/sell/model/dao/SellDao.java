package com.kh.makeit.sell.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.makeit.sell.model.vo.SellAttach;
import com.kh.makeit.sell.model.vo.SellOption;
import com.kh.makeit.sell.model.vo.SellmainOption;

public interface SellDao {

   List<Map<String, String>> findInterest(int interest);

   int insertDataMap(Map dataMap);

   int insertAttach(SellAttach a);

   int insertOption(Map<String, String> map);

   List<Map> sellMainGrade(Map map,int cPage, int numPerPage);
   
   List<Map> sellMainPerformance(Map map,int cPage, int numPerPage);

   List<Map<String, String>> sellMainNew(Map map, int cPage, int numPerPage);

   int sellCount(Map<String, String> map);

SellAttach imageDiv(String imageId);

SellmainOption sellPrice(String sellNo);


}