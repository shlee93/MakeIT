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

List<Map<String, String>> selldetailView(int sellno);

List<Map<String, String>> selldetailImg(int sellno);

List<Map<String, String>> selldetailOption(int sellno);

List<Map<String, String>> sellReview(int sellno);

List<Map<String, String>> sellsubImg(int sellno);

Map sellModify(int sellno);

List<Map<String, String>> sellOptionModify(int sellno);

List<Map<String, String>> sellImgModify(int sellno);

int sellModifyEnd(ArrayList<SellAttach> files, Map dataMap, SellOption selloption);



Map sellOutBoxYn(Map outBoxc);



int sellOutBoxInsert(Map outBoxInsert);

int sellOutBoxDelete(Map outBoxDelete);

int insertReport(Map reportMap);

Map selectedOption(Map optionMap);

int sellDetailDelete(int sellno);

Map selectSeller(Map optionMap);

int purchaseComplete(Map purchaseInfo);

Map optionInfo(Map purchaseInfo);

List<Map<String, String>> sellBuyerShow(int sellno, int cPage, int numPerPage);

int sellSpecUpdate(Map sellSpecMap);

List<Map<String, String>> purchaseList(Map refund);

int sellRefundEnd(Map payBack);

int insertReview(Map<String, String> map);

int selectReviewCnt(int sellno);

int updateReview(Map<String, String> map);

int deleteReview(Map<String, String> map);

int sellCommit(int sellSpecNo);

int sellBuyerCount(int sellno);


}