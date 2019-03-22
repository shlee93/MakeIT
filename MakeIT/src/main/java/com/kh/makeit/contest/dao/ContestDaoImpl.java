package com.kh.makeit.contest.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.makeit.contest.vo.ContestImg;

@Repository
public class ContestDaoImpl implements ContestDao 
{
	@Autowired
	SqlSessionTemplate sqlSession;
		
	@Override
	public int contestCountDao() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("contest.contestCount");
	}

	@Override
	public int sortCountDao(Map<String,String> searchFlag) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("contest.sortCount", searchFlag);
	}

	@Override
	public List<Map<String,String>> getContestListDao(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("contest.getContestList", null, rb);
	}	
	
	@Override
	public List<Map<String, String>> contestSortDao(int cPage, int numPerPage, Map<String, String> searchFlag) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("contest.contestSort", searchFlag, rb);
	}

	@Override
	public List<Map<String,String>> getContestDetailImg(int contestNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("contest.getContestDetailImg",contestNo);
	}

	@Override
	public Map<String,String> contestDetailDao(int contestNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("contest.contestDetail", contestNo);
	}

	@Override
	public ContestImg getContestPerFirstImgDao(int contestNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("contest.getContestPerFirstImg",contestNo);
	}

	@Override
	public int contestFormEndDao(Map<String,String> contest) 
	{
		return sqlSession.insert("contest.insertContest", contest);
	}

	@Override
	public int insertContestImg(ContestImg contestImg) 
	{		
		return sqlSession.insert("contest.insertContestImg", contestImg);
	}		
	
	@Override
	public Map<String,String> contestApplicantCheckDao(Map<String,String> checkMap) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne("contest.contestApplicantCheck", checkMap);
	}

	@Override
	public List<Map> contestApplcantListDao(int contestNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("contest.contestApplicantList",contestNo);
	}

	@Override
	public int contestApplicantDao(Map<String, String> applicant) {
		// TODO Auto-generated method stub
		return sqlSession.update("contest.contestApplicant", applicant);
	}

	@Override
	public Map contestApplicantOneDao(Map applicantInfo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("contest.contestApplicantOne", applicantInfo);
	}

	@Override
	public int applicantConfirmDao(Map applicantConfirmInfo) {
		// TODO Auto-generated method stub
		return sqlSession.update("contest.applicantConfirm",applicantConfirmInfo);
	}

	@Override
	public int contestDelDao(int contestDelNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("contest.contestDel", contestDelNo);
	}

	@Override
	public Map contestModifyDao(int contestNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("contest.contestModify", contestNo);
	}

	@Override
	public List<Map<String, String>> contestModifyImg(int contestNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("contest.contestModifyImg", contestNo);
	}

	@Override
	public int contestModifyEndDao(Map<String, String> contest) {
		// TODO Auto-generated method stub
		return sqlSession.update("contest.contestModifyEnd", contest);
	}
	
	@Override
	public int contestModifyForeDelImg(int contestNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("contest.modifyForeDelImg", contestNo);
	}

	@Override
	public int contestUpdateImg(ContestImg contestImg) {
		// TODO Auto-generated method stub
		return sqlSession.update("contest.contestUpdateImg", contestImg);
	}

	@Override
	public Map contestOutBoxYnDao(Map outBoxc) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("contest.contestOutBoxYn", outBoxc);
	}

	@Override
	public int contestOutBoxInsertDao(Map outBoxInsert) {
		// TODO Auto-generated method stub
		return sqlSession.insert("contest.contestOutBoxInsert", outBoxInsert);
	}

	@Override
	public int contestOutBoxDeleteDao(Map outBoxDelete) {
		// TODO Auto-generated method stub
		return sqlSession.insert("contest.contestOutBoxDelete", outBoxDelete);
	}

	@Override
	public int insertReportDao(Map reportMap) {
		// TODO Auto-generated method stub
		return sqlSession.insert("contest.insertReport", reportMap);
	}
}
