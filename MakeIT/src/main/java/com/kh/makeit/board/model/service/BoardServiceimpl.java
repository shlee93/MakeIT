package com.kh.makeit.board.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.makeit.board.model.dao.BoardDao;
import com.kh.makeit.board.model.vo.BoardAttach;
import com.kh.makeit.buy.model.vo.BuyAttach;
import com.kh.makeit.common.MakeitException;

@Service
public class BoardServiceimpl implements BoardService {

	@Autowired
	BoardDao dao;
	
	@Override
	public int selectBoardCount() {

		return dao.selectBoardCount();
	}

	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {

		return dao.selectBoardList(cPage,numPerPage);
	}

	@Override
	public List<Map<String,String>> selectBoardDetailView(int freeNo) {

		return dao.selectBoardDetailView(freeNo);
	}

	@Override
	public List<Map<String,String>> selectBoardCommentView(int freeNo) {
		// TODO Auto-generated method stub
		return dao.selectBoardCommentView(freeNo);
	}

	@Override
	public List<Map<String,String>> selectBoardImgView(int freeNo) {
		// TODO Auto-generated method stub
		return dao.selectBoardImgView(freeNo);
	}

	@Override
	public int updateboardViews(int freeNo) {
		// TODO Auto-generated method stub
		return dao.updateboardViews(freeNo);
	}

	@Override
	public int insertComment(Map<Object, Object> insertValue) {
		// TODO Auto-generated method stub
		return dao.insertComment(insertValue);
	}
	
	@Override
	public int insertreComment(Map<Object, Object> insertValue) {
		// TODO Auto-generated method stub
		return dao.insertreComment(insertValue);
	}

	@Override
	public int deleteComment(int commentNo) {
		// TODO Auto-generated method stub
		return dao.deleteComment(commentNo);
	}


	@Override
	public int insertBoardList(ArrayList<BoardAttach> files, Map<String, String> map) {
		
		int result =0;
		
		try {
			result = dao.insertBoard(map);
			System.out.println("보드 인서트 : "+result);
			System.out.println("map~~ : "+map);
			System.out.println("map!!!!~~~~~!! : "+map.get("writeContent"));
			System.out.println("map2~~ : "+Integer.parseInt(map.get("freeNo")));
			for(BoardAttach ba : files) {
				System.out.println("실행~~~~~~~~~~~~~~~~~~~~");
				ba.setFreeNo(Integer.parseInt(map.get("freeNo")));
				result = dao.insertBoardImg(ba);
				if(result > 0) {
					
				}
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
			
		return result;
	}
	
	@Override
	public int updateBoardList(ArrayList<BoardAttach> files, Map<Object, Object> map, int freeNo) {
		
		int result =0;
		
		try {
			result = dao.updateBoard(map);
			System.out.println("보드 인서트 : "+result);

			for(BoardAttach ba : files) {
				System.out.println("실행~~~~~~~~~~~~~~~~~~~~");
				/*ba.setFreeNo(Integer.parseInt(map.get("freeNo")));*/
/*				result = dao.deleteBoardImg(ba, freeNo);
				result = dao.insertBoardImg(ba, freeNo);*/
				if(result > 0) {
					
				}
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
			
		return result;
	}

	@Override
	public List<Map<String, String>> selectMemberSortBoard(Map<String,String> sort, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectMemberSortBoard(sort,cPage,numPerPage);
	}

	@Override
	public int selectMemberCountBoard() {
		// TODO Auto-generated method stub
		return dao.selectMemberCountBoard();
	}
	
	@Override
	public int selectSearchCountBoard(String searchId) {
		// TODO Auto-generated method stub
		return dao.selectSearchCountBoard(searchId);
	}

}
