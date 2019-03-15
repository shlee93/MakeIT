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

int sellPerCount(Map<String, String> map);

List<Map<String, String>> sellSearch(Map map, int numPerPage, int contentCount, int cPage);

int searchCount(Map<String, String> map2);

int searchPerCount(Map<String, String> map2);

List<Map<String, String>> selldetailView(int sellno);

List<Map<String, String>> selldetailImg(int sellno);

List<Map<String, String>> selldetailOption(int sellno);

List<Map<String, String>> sellReivew(int sellno);

List<Map<String, String>> sellsubImg(int sellno);

Map sellModify(int sellno);

List<Map<String, String>> sellOptionModify(int sellno);

List<Map<String, String>> sellImgModify(int sellno);

int updateDataMap(Map dataMap);



int insertAttach2(SellAttach a);

int deleteOption(Map<String, String> map);

int insertOption2(Map<String, String> map);

int deleteAttach(Map dataMap);

Map sellOutBoxYn(Map outBoxc);

int sellOutBoxInsert(Map outBoxInsert);

int sellOutBoxDelete(Map outBoxDelete);


}