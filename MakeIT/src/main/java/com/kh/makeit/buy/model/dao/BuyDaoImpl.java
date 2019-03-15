package com.kh.makeit.buy.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.makeit.buy.model.vo.BuyAttach;

@Repository
public class BuyDaoImpl implements BuyDao {
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public int buyCount(Map<String, String> map) {
		// TODO Auto-generated method stub
		return session.selectOne("buy.buyCount", map);
	}
	
	@Override
	public List<Map<String, String>> buyMainGrade(Map<String, String> map, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("buy.buyMainGrade", map, rb);
	}

	@Override
	public List<Map<String, String>> buyMainNew(Map<String, String> map, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("buy.buyMainNew", map, rb);
	}
	
	@Override
	public BuyAttach imageDiv2(String buyNo) {
		// TODO Auto-generated method stub
		return session.selectOne("buy.imageDiv2",buyNo);
	}

	@Override
	public int searchCount(Map<String, String> map2) {
		// TODO Auto-generated method stub
		return session.selectOne("buy.searchCount", map2);
	}
	
	@Override
	public List<Map<String, String>> buySearch(Map map, int numPerPage, int contentCount, int cPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("buy.buySearch",map,rb);
	}
	
	@Override
	public int insertBuy(Map<String, String> map) {
		// TODO Auto-generated method stub
		return session.insert("buy.insertBuy", map);
	}
	

	@Override
	public int insertAttach(BuyAttach a) {
		// TODO Auto-generated method stub
		return session.insert("buy.insertAttach", a);
	}

	@Override
	public List<Map<String, String>> selectVolList(Map m) {
		
		return session.selectList("buy.selectVolList",m);
	}

	@Override
	public Map<String, String> selectVolView(Map map) {
		// TODO Auto-generated method stub
		return session.selectOne("buy.selectVolView", map);
	}

	@Override
	public Map<String, String> buyDetail(int buyNo) {
		// TODO Auto-generated method stub
		return session.selectOne("buy.buyDetail",buyNo);
	}

	@Override
	public Map<String, String> selectMainImg(int buyNo) {
		// TODO Auto-generated method stub
		return session.selectOne("buy.selectMainImg",buyNo);
	}

	@Override
	public List<Map<String, String>> selectSubImg(int buyNo) {
		// TODO Auto-generated method stub
		return session.selectList("buy.selectSubImg", buyNo);
	}

	@Override
	public List<Map<String, String>> selectReview(int buyNo) {
		// TODO Auto-generated method stub
		return session.selectList("buy.selectReview", buyNo);
	}

	@Override
	public int selectReviewCnt(int buyNo) {
		// TODO Auto-generated method stub
		return session.selectOne("buy.selectReviewCnt", buyNo);
	}

	@Override
	public int insertReview(Map<String, String> map) {
		// TODO Auto-generated method stub
		return session.insert("buy.insertReview", map);
	}
	
	
	

}
