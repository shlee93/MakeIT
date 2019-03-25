package com.kh.makeit.sell.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.makeit.sell.model.vo.SellAttach;
import com.kh.makeit.sell.model.vo.SellmainOption;
@Repository
public class SellDaoImpl implements SellDao {
   @Autowired
   SqlSessionTemplate sqlSession;

   @Override
   public List<Map<String, String>> findInterest(int interest) {
      // TODO Auto-generated method stub
      return sqlSession.selectList("sell.findInterest",interest);
   }

   @Override
   public int insertDataMap(Map dataMap) {
      // TODO Auto-generated method stub
      return sqlSession.insert("sell.insertDataMap",dataMap);
   }

   @Override
   public int insertAttach(SellAttach a) {
      // TODO Auto-generated method stub
      return sqlSession.insert("sell.insertAttach",a);
   }

   @Override
   public int insertOption(Map<String, String> map) {
      // TODO Auto-generated method stub
      return sqlSession.insert("sell.insertOption",map);
   }
   
   @Override
   public List<Map> sellMainGrade(Map map,int cPage, int numPerPage) {
      // TODO Auto-generated method stub
	   RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
      return sqlSession.selectList("sell.sellMainGrade", map,rb);
   }

   @Override
   public List<Map> sellMainPerformance(Map map,int cPage, int numPerPage) {
      // TODO Auto-generated method stub
	   RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
      return sqlSession.selectList("sell.sellMainPerformance", map,rb);
   }

   @Override
   public List<Map<String, String>> sellMainNew(Map map,int cPage,int numPerPage) {
      // TODO Auto-generated method stub
	   RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
      return sqlSession.selectList("sell.sellMainNew", map,rb);
   }
	
	@Override
	public int sellCount(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sell.sellCount",map);
	}
	@Override
	public SellAttach imageDiv(String imageId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sell.imageDiv",imageId);
	}

	@Override
	public SellmainOption sellPrice(String sellNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sell.sellPrice",sellNo);
	}

	@Override
	public int sellPerCount(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sell.sellPerCount",map);
	}

	@Override
	public List<Map<String, String>> sellSearch(Map map, int numPerPage, int contentCount, int cPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("sell.sellSearch",map, rb);
	}

	@Override
	public int searchCount(Map<String, String> map2) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sell.searchCount", map2);
	}

	@Override
	public int searchPerCount(Map<String, String> map2) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sell.searchPerCount", map2);
	}
	//메인창에서 디테일로 뿌려줄 자료가져오는 것

	@Override
	public List<Map<String, String>> selldetailView(int sellno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sell.selldetailView",sellno);
	}

	@Override
	public List<Map<String, String>> selldetailImg(int sellno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sell.selldetailImg",sellno);
	}

	@Override
	public List<Map<String, String>> selldetailOption(int sellno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sell.selldetailOption",sellno);
	}

	@Override
	public List<Map<String, String>> sellReivew(int sellno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sell.sellReview",sellno);
	}

	@Override
	public List<Map<String, String>> sellsubImg(int sellno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sell.sellsubImg",sellno);
	}

	//글수정 값가져오기
	@Override
	public Map sellModify(int sellno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sell.sellModify",sellno);
	}

	@Override
	public List<Map<String, String>> sellOptionModify(int sellno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sell.sellOptionModify",sellno);
	}

	@Override
	public List<Map<String, String>> sellImgModify(int sellno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sell.sellImgModify",sellno);
	}

	@Override
	public int updateDataMap(Map dataMap) {
		// TODO Auto-generated method stub
		return sqlSession.update("sell.updateDataMap",dataMap);
	}

	@Override
	public int deleteAttach(Map dataMap) {
		// TODO Auto-generated method stub
		return sqlSession.delete("sell.deleteAttach",dataMap);
	}

	@Override
	public int insertAttach2(SellAttach a) {
		// TODO Auto-generated method stub
		return sqlSession.update("sell.insertAttach2",a);
	}

	@Override
	public int deleteOption(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.delete("sell.deleteOption",map);
	}

	@Override
	public int insertOption2(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("sell.insertOption2",map);
	}

	@Override
	public Map sellOutBoxYn(Map outBoxc) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sell.sellOutBoxYn",outBoxc);
	}

	@Override
	public int sellOutBoxInsert(Map outBoxInsert) {
		// TODO Auto-generated method stub
		return sqlSession.insert("sell.sellOutBoxInsert",outBoxInsert);
	}

	@Override
	public int sellOutBoxDelete(Map outBoxDelete) {
		// TODO Auto-generated method stub
		return sqlSession.insert("sell.sellOutBoxDelete",outBoxDelete);
	}

	@Override
	public int insertReport(Map reportMap) {
		// TODO Auto-generated method stub
		return sqlSession.insert("sell.insertReport",reportMap);
	}
	/*선택된 옵션 가져가는것 결재위해*/
	@Override
	public Map selctedOption(Map optionMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sell.selctedOption",optionMap);
	}

	@Override
	public int sellDetailDelete(int sellno) {
		// TODO Auto-generated method stub
		return sqlSession.delete("sell.sellDetailDelete",sellno);
	}
	//셀판매자 찾기
	@Override
	public Map selectSeller(Map optionMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sell.selectSeller",optionMap);
	}
	//결재완료

	@Override
	public int purchaseComplete(Map purchaseInfo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("sell.purchaseComplete",purchaseInfo);
	}
	//결재완료창 선택한옵션 조회

	@Override
	public Map optionInfo(Map purchaseInfo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sell.optionInfo",purchaseInfo);
	}
	//구매자들띄워주기

	@Override
	public List<Map<String, String>> sellBuyerShow(int sellno, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("sell.sellBuyerShow",sellno,rb);
	}
	//판매자가 작업상태변경
	@Override
	public int sellSpectUpdate(int specNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("sell.sellSpectUpdate",specNo);
	}

	@Override
	public List<Map<String, String>> purcahseList(Map refund) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sell.purcahseList",refund);
	}

	@Override
	public int sellRefundEnd(Map payBack) {
		// TODO Auto-generated method stub
		return sqlSession.update("sell.sellRefundEnd",payBack);
	}

	@Override
	   public int insertReview(Map<String, String> map) {
	      // TODO Auto-generated method stub
	      return sqlSession.insert("sell.insertReview", map);
	   }

	  /* @Override
	   public int deleteReview(Map<String, String> map) {
	      // TODO Auto-generated method stub
	      return session.delete("buy.deleteReview",map);
	   }

	   @Override
	   public int updateReview(Map<String, String> map) {
	      // TODO Auto-generated method stub
	      return session.update("buy.updateReview",map);
	   }*/
	
	@Override
	   public int selectReviewCnt(int sellno) {
	      // TODO Auto-generated method stub
	      return sqlSession.selectOne("sell.selectReviewCnt", sellno);
	   }
	
	@Override
	   public int updateReview(Map<String, String> map) {
	      // TODO Auto-generated method stub
	      return sqlSession.update("sell.updateReview",map);
	   }
	@Override
	   public int deleteReview(Map<String, String> map) {
	      // TODO Auto-generated method stub
	      return sqlSession.delete("sell.deleteReview",map);
	   }

	//구매확정
	@Override
	public int sellCommit(int sellSpecNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("sell.sellCommit",sellSpecNo);
	}

	@Override
	public int sellBuyerCount(int sellno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sell.sellBuyerCount",sellno);
	}

	@Override
	public List<Map<String, String>> selectSellImg(int sellno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sell.selectSellImg",sellno);
	}

	@Override
	public int insertSellImg(Map<String, String> m) {
		// TODO Auto-generated method stub
		return sqlSession.insert("sell.insertSellImg",m);
	}

	

}