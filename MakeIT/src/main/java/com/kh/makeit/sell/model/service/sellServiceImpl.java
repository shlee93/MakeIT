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
	public List<Map> sellMainGrade() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<Map> sellMainPerformance() {
		// TODO Auto-generated method stub
		return dao.sellMainPerformance();
	}
	@Override
	public List<Map> sellMainNew() {
		// TODO Auto-generated method stub
		return null;
	}
	



}
