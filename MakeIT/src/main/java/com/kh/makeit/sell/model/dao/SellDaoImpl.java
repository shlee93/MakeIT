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
   

}