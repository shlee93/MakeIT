package com.kh.makeit.buy.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.makeit.buy.model.dao.BuyDao;
import com.kh.makeit.buy.model.vo.BuyAttach;
import com.kh.makeit.common.MakeitException;

@Service
public class BuyServiceImpl implements BuyService {
	@Autowired
	BuyDao dao;
	
	@Override
	public int buyCount(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.buyCount(map);
	}
	
	@Override
	public List<Map<String, String>> buyMainGrade(Map<String, String> map, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.buyMainGrade(map, cPage, numPerPage);
	}

	@Override
	public List<Map<String, String>> buyMainNew(Map<String, String> map, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.buyMainNew(map, cPage, numPerPage);
	}
	
	@Override
	public BuyAttach imageDiv2(String buyNo) {
		// TODO Auto-generated method stub
		return dao.imageDiv2(buyNo);
	}
	
	@Override
	public int searchCount(Map<String, String> map2) {
		// TODO Auto-generated method stub
		return dao.searchCount(map2);
	}

	@Override
	public List<Map<String, String>> buySearch(Map map, int numPerPage, int contentCount, int cPage) {
		// TODO Auto-generated method stub
		return dao.buySearch(map, numPerPage, contentCount, cPage);
	}

	@Override
	public List<Map<String, String>> selectVolList(Map m) {
		return dao.selectVolList(m);
	}

	@Override
	public Map<String, String> selectVolView(Map map) {
		// TODO Auto-generated method stub
		return dao.selectVolView(map);
	}

	@Override
	public int buyWriteEnd(ArrayList<BuyAttach> files, Map<String, String> map) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = dao.insertBuy(map);
			if(result < 1)
			{
				throw new MakeitException("구매 게시글 등록에 실패하였습니다.");
			}
			for(BuyAttach a : files)
			{
				a.setBuyNo(Integer.parseInt(map.get("buyNo")));
				result = dao.insertAttach(a);
				if(result < 1)
				{
					throw new MakeitException("파일 업로드에 실패하였습니다.");
				}
			}

		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Map<String, String> buyDetail(int buyNo) {
		// TODO Auto-generated method stub
		return dao.buyDetail(buyNo);
	}

	@Override
	public Map<String, String> selectMainImg(int buyNo) {
		// TODO Auto-generated method stub
		return dao.selectMainImg(buyNo);
	}

	@Override
	public List<Map<String, String>> selectSubImg(int buyNo) {
		// TODO Auto-generated method stub
		return dao.selectSubImg(buyNo);
	}

	@Override
	public List<Map<String, String>> selectReview(int buyNo) {
		// TODO Auto-generated method stub
		return dao.selectReview(buyNo);
	}

	@Override
	public int selectReviewCnt(int buyNo) {
		// TODO Auto-generated method stub
		return dao.selectReviewCnt(buyNo);
	}
	
	@Override
	public Map<String, String> selectSpec(Map specMap) {
		// TODO Auto-generated method stub
		return dao.selectSpec(specMap);
	}

	@Override
	public List<Map<String, String>> selectAnother(String memberId, int numPerPage, int contentCount, int cPage) {
		// TODO Auto-generated method stub
		return dao.selectAnother(memberId, numPerPage, contentCount, cPage);
	}

	@Override
	public int anotherCount(String memberId) {
		// TODO Auto-generated method stub
		return dao.anotherCount(memberId);
	}
	
	@Override
	public int buyVolEnd(List<Map<String, String>> files, Map<String, String> map) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = dao.insertVol(map);
			if(result < 1)
			{
				throw new MakeitException("지원에 실패하였습니다.");
			}
			for(Map<String,String> a : files)
			{
				result = dao.insertVolImg(a);
				if(result < 1)
				{
					throw new MakeitException("파일 업로드에 실패하였습니다.");
				}
			}

		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int insertReview(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.insertReview(map);
	}

	@Override
	public int deleteReview(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.deleteReview(map);
	}

	@Override
	public int updateReview(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.updateReview(map);
	}
	
	
	
	
	
}
