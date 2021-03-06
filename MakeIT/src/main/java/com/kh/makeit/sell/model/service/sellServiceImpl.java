package com.kh.makeit.sell.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.makeit.common.MakeitException;
import com.kh.makeit.sell.model.dao.SellDao;
import com.kh.makeit.sell.model.vo.SellAttach;
import com.kh.makeit.sell.model.vo.SellOption;
import com.kh.makeit.sell.model.vo.SellmainOption;

@Service
public class sellServiceImpl implements sellService {
   @Autowired
   SellDao dao;
   @Override
   public List<Map<String, String>> findInterest(int interest) {
      // TODO Auto-generated method stub
      return dao.findInterest(interest);
   }
   
   @Override
   public int sellModifyEnd(ArrayList<SellAttach> files, Map dataMap, SellOption selloption) {
	   	  int result=0;
	      int boardNo=0;
	      try {
	         result=dao.updateDataMap(dataMap);
	         if(result==0) //롤백해야되는상황
	         {
	            throw new MakeitException("게시글 수정에 실패하였습니다.");
	         }
	         result=dao.deleteAttach(dataMap);
	         for(SellAttach a : files)
	         {
	            a.setSellNo(Integer.parseInt(String.valueOf(dataMap.get("sellno"))));
	            result=dao.insertAttach2(a);
	            if(result==0)
	            {
	               throw new MakeitException("파일업로드에 실패하였습니다.");  
	            }
	         }
	         int i=0;
	         Map<String,String> map = new HashMap<>();
	         map.put("sellno",String.valueOf((dataMap.get("sellno"))) );
	         result=dao.deleteOption(map);
	         while(i<selloption.getSellOptionContent().length)
	         {
	           /* selloption.setSellNo(Integer.parseInt(String.valueOf(dataMap.get("sellno"))));*/
	            map.put("sellno",String.valueOf((dataMap.get("sellno"))) );
	            map.put("selldeadLine", selloption.getSelldeadline()[i]);
	            map.put("sellPrice", selloption.getSellPrice()[i]);
	            map.put("sellOptionContent",selloption.getSellOptionContent()[i]);
	            map.put("selloptionNo","옵션"+(i+1));
	            result=dao.insertOption2(map);
	            i++;
	         }
	      }catch(Exception e)
	      {
	         throw e;
	      }
	      return result;
	
}

@Override
   public int sellWriteEnd(ArrayList<SellAttach> files, Map dataMap, SellOption selloption) {
      int result=0;
      int boardNo=0;
      try {
         result=dao.insertDataMap(dataMap);
         if(result==0) //롤백해야되는상황
         {
            throw new MakeitException("게시글 등록에 실패하였습니다.");
         }
         for(SellAttach a : files)
         {
            a.setSellNo(Integer.parseInt((String) (dataMap.get("sellNo"))));
            result=dao.insertAttach(a);
            if(result==0)
            {
               throw new MakeitException("파일업로드에 실패하였습니다.");  
            }
         }
         int i=0;
         Map<String,String> map = new HashMap<>();
         while(i<selloption.getSellOptionContent().length)
         {
            selloption.setSellNo(Integer.parseInt((String) (dataMap.get("sellNo"))));
            map.put("sellNo",(String) (dataMap.get("sellNo")));
            map.put("selldeadLine", selloption.getSelldeadline()[i]);
            map.put("sellPrice", selloption.getSellPrice()[i]);
            map.put("sellOptionContent",selloption.getSellOptionContent()[i]);
            map.put("selloptionNo","옵션"+(i+1));
            result=dao.insertOption(map);
            i++;
         }
      }catch(Exception e)
      {
         throw e;
      }
      return result;
   }
   @Override
   public List<Map> sellMainGrade(Map map,int cPage, int numPerPage) {
      // TODO Auto-generated method stub
      return dao.sellMainGrade(map,cPage,numPerPage);
   }
   @Override
   public List<Map> sellMainPerformance(Map map,int cPage, int numPerPage) {
      // TODO Auto-generated method stub
      return dao.sellMainPerformance(map,cPage,numPerPage);
   }
   @Override
   public List<Map<String, String>> sellMainNew(Map map, int cPage, int numPerPage) {
      // TODO Auto-generated method stub
      return dao.sellMainNew(map,cPage,numPerPage);
   }
	@Override
	public int sellCount(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.sellCount(map);
	}
	@Override
	public SellAttach imageDiv(String imageId) {
		// TODO Auto-generated method stub
		return dao.imageDiv(imageId);
	}

	@Override
	public SellmainOption sellPrice(String sellNo) {
		// TODO Auto-generated method stub
		return dao.sellPrice(sellNo);
	}
	//퍼포먼스를위한 카운트
	@Override
	public int sellPerCount(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.sellPerCount(map);
	}

	//서치
	@Override
	public List<Map<String, String>> sellSearch(Map map, int numPerPage, int contentCount, int cPage) {
		// TODO Auto-generated method stub
		return dao.sellSearch(map, numPerPage, contentCount,cPage);
	}
	@Override
	public int searchCount(Map<String, String> map2) {
		// TODO Auto-generated method stub
		return dao.searchCount(map2);
	}
	@Override
	public int searchPerCount(Map<String, String> map2) {
		// TODO Auto-generated method stub
		return dao.searchPerCount(map2);
	}
   //메인창에서 이미지클릭시 상세창으로 다가 간다.
	@Override
	public List<Map<String, String>> selldetailView(int sellno) {
		// TODO Auto-generated method stub
		return dao.selldetailView(sellno);
	}
	@Override
	public List<Map<String, String>> selldetailImg(int sellno) {
		// TODO Auto-generated method stub
		return dao.selldetailImg(sellno);
	}
	@Override
	public List<Map<String, String>> selldetailOption(int sellno) {
		// TODO Auto-generated method stub
		return dao.selldetailOption(sellno);
	}
	@Override
	public List<Map<String, String>> sellReview(int sellno) {
		// TODO Auto-generated method stub
		return dao.sellReivew(sellno);
	}
	@Override
	public List<Map<String, String>> sellsubImg(int sellno) {
		// TODO Auto-generated method stub
		return dao.sellsubImg(sellno);
	}
	
	//수정을 위해 값가져오기
	@Override
	public Map sellModify(int sellno) {
		// TODO Auto-generated method stub
		return dao.sellModify(sellno);
	}
	@Override
	public List<Map<String, String>> sellOptionModify(int sellno) {
		// TODO Auto-generated method stub
		return dao.sellOptionModify(sellno);
	}
	@Override
	public List<Map<String, String>> sellImgModify(int sellno) {
		// TODO Auto-generated method stub
		return dao.sellImgModify(sellno);
	}

	@Override
	public Map sellOutBoxYn(Map outBoxc) {
		// TODO Auto-generated method stub
		return dao.sellOutBoxYn(outBoxc);
	}

	@Override
	public int sellOutBoxInsert(Map outBoxInsert) {
		// TODO Auto-generated method stub
		return dao.sellOutBoxInsert(outBoxInsert);
	}

	@Override
	public int sellOutBoxDelete(Map outBoxDelete) {
		// TODO Auto-generated method stub
		return dao.sellOutBoxDelete(outBoxDelete);
	}
//신고 인서트
	@Override
	public int insertReport(Map reportMap) {
		// TODO Auto-generated method stub
		return dao.insertReport(reportMap);
	}
//구매 선택한 옵션띄우주게 셀렉트

	@Override
	public Map selectedOption(Map optionMap) {
		// TODO Auto-generated method stub
		return dao.selctedOption(optionMap);
	}
//셀글삭제

	@Override
	public int sellDetailDelete(int sellno) {
		// TODO Auto-generated method stub
		return dao.sellDetailDelete(sellno);
	}
//판매글올린사람 서치
	@Override
	public Map selectSeller(Map optionMap) {
		// TODO Auto-generated method stub
		return dao.selectSeller(optionMap);
	}
//결재종료후 값 인서트
	@Override
	public int purchaseComplete(Map purchaseInfo) {
		// TODO Auto-generated method stub
		return dao.purchaseComplete(purchaseInfo);
	}
//결재완료창에서 옵션뭐선택했는지 띄워준다

	@Override
	public Map optionInfo(Map purchaseInfo) {
		// TODO Auto-generated method stub
		return dao.optionInfo(purchaseInfo);
	}
//구매자들 띄워주기

	@Override
	public List<Map<String, String>> sellBuyerShow(int sellno,int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.sellBuyerShow(sellno,cPage,numPerPage);
	}
	//판매자가 작업상태변경

	@Override
	public int sellSpecUpdate(int specNo) {
		// TODO Auto-generated method stub
		return dao.sellSpectUpdate(specNo);
	}

	@Override
	public List<Map<String, String>> purchaseList(Map refund) {
		// TODO Auto-generated method stub
		return dao.purcahseList(refund);
	}

	@Override
	public int sellRefundEnd(Map payBack) {
		// TODO Auto-generated method stub
		return dao.sellRefundEnd(payBack);
	}
	@Override
	   public int insertReview(Map<String, String> map) {
	      // TODO Auto-generated method stub
	      return dao.insertReview(map);
	   }
	@Override
	   public int selectReviewCnt(int sellno) {
	      // TODO Auto-generated method stub
	      return dao.selectReviewCnt(sellno);
	   }

	@Override
	   public int updateReview(Map<String, String> map) {
	      // TODO Auto-generated method stub
	      return dao.updateReview(map);
	   }
	
	@Override
	   public int deleteReview(Map<String, String> map) {
	      // TODO Auto-generated method stub
	      return dao.deleteReview(map);
	   }

	@Override
	public int sellCommit(int sellSpecNo) {
		// TODO Auto-generated method stub
		return dao.sellCommit(sellSpecNo);
	}

	@Override
	public int sellBuyerCount(int sellno) {
		// TODO Auto-generated method stub
		return dao.sellBuyerCount(sellno);
	}

	
}