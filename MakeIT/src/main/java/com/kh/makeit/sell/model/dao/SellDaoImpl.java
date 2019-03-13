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
	
	
	
	
   
	

}