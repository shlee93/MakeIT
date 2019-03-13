package com.kh.makeit.sell.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.makeit.sell.model.vo.SellAttach;
import com.kh.makeit.sell.model.vo.SellOption;
import com.kh.makeit.sell.model.vo.SellmainOption;

public interface sellService {

   List<Map<String, String>> findInterest(int interest);

   int sellWriteEnd(ArrayList<SellAttach> files, Map dataMap, SellOption selloption);

   List<Map> sellMainGrade(Map map,int cPage, int numPerPage);

   List<Map> sellMainPerformance(Map map, int cPage, int numPerPage);

   List<Map<String, String>> sellMainNew(Map map, int cPage, int numPerPage);

int sellCount(Map<String, String> map);

SellAttach imageDiv(String imageId);

SellmainOption sellPrice(String sellNo);

int sellPerCount(Map<String, String> map);

List<Map<String, String>> sellSearch(Map map, int numPerPage, int contentCount, int cPage);

int searchCount(Map<String, String> map2);

int searchPerCount(Map<String, String> map2);



}