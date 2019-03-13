package com.kh.makeit.contest.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.makeit.common.exception.BoardException;
import com.kh.makeit.contest.dao.ContestDao;
import com.kh.makeit.contest.vo.ContestImg;

@Service
public class ContestServiceImpl implements ContestService 
{
	@Autowired
	ContestDao cd;
		
	@Override
	public int contestCountService() {
		// TODO Auto-generated method stub
		return cd.contestCountDao();
	}

	@Override
	public List<Map<String,String>> getContestListService(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return cd.getContestListDao(cPage, numPerPage);
	}	

	@Override
	public ContestImg getContestPerFirstImgService(int contestNo) {
		// TODO Auto-generated method stub
		return cd.getContestPerFirstImgDao(contestNo);
	}
		

	@Override
	public List<Map<String,String>> contestDetailService(int contestNo) {
		// TODO Auto-generated method stub
		List<Map<String,String>> contestContainer;
		contestContainer=cd.getContestDetailImg(contestNo);
		contestContainer.add(cd.contestDetailDao(contestNo));
		return contestContainer;
	}

	@Override
	public int contestFormEndService(Map<String,String> contest, List<ContestImg> files) throws BoardException {
		// TODO Auto-generated method stub
		int result=0;
		int contestNo=0;
		
		try
		{
			result=cd.contestFormEndDao(contest);
			System.out.println("돌아온값 : "+contest.get("contestNo"));
			
			contestNo=Integer.parseInt(contest.get("contestNo"));
			if(result==0)
			{
				throw new BoardException("게시판 등록실패");
			}
			for(ContestImg contestImg :files)
			{
				System.out.println("시발"+contestNo);
				contestImg.setContestNo(contestNo);
				result=cd.insertContestImg(contestImg);
				if(result==0) throw new BoardException("파일 업로드 실패");
			}
		}
		catch(Exception e)
		{
			throw e;
		}		
		
		return result;		
	}	

	@Override
	public Map<String,String> contestApplicantCheckService(Map<String,String> checkMap) {
		// TODO Auto-generated method stub
		return cd.contestApplicantCheckDao(checkMap);
	}

	@Override
	public int contestApplicantService(Map<String, String> applicant) {
		// TODO Auto-generated method stub
		/*int contestNo=Integer.parseInt(applicant.get("contestNo"));
		String contestApplicantList=cd.getContestApplcantList(contestNo);
		if(contestApplicantList!=null)
		{
			String[] contestApplicantListArr=contestApplicantList.split(",");
			for(int i=0; i<contestApplicantListArr.length; i++)
			{
				if(contestApplicantListArr[i].equals(String.valueOf(applicant.get("applicantId"))))
				{
					return 0;
				}
			}	
			contestApplicantList+=","+String.valueOf(applicant.get("applicantId"));					
						
			applicant.put("applicantId", contestApplicantList);
		}*/
		
		return cd.contestApplicantDao(applicant);
	}

	@Override
	public List<Map> contestApplicantListService(int contestNo) {
		// TODO Auto-generated method stub
		return cd.contestApplcantListDao(contestNo);
	}

	@Override
	public Map contestApplicantOneService(Map applicantInfo) {
		// TODO Auto-generated method stub
		return cd.contestApplicantOneDao(applicantInfo);
	}

	@Override
	public int applicantConfirmService(Map applicantConfirmInfo) {
		// TODO Auto-generated method stub
		return cd.applicantConfirmDao(applicantConfirmInfo);
	}

	@Override
	public int contestDelService(int contestDelNo) {
		// TODO Auto-generated method stub
		return cd.contestDelDao(contestDelNo);
	}

	@Override
	public Map contestModifyService(int contestNo) {
		// TODO Auto-generated method stub
		return cd.contestModifyDao(contestNo);
	}

	@Override
	public List<Map<String, String>> contestModifyImgService(int contestNo) {
		// TODO Auto-generated method stub
		return cd.contestModifyImg(contestNo);
	}

	@Override
	public int contestModifyEndService(Map<String, String> contest, List<ContestImg> files) throws BoardException {
		// TODO Auto-generated method stub
		int result=0;
		int contestNo=0;
		
		try
		{
			result=cd.contestModifyEndDao(contest);
			
			contestNo=Integer.parseInt(String.valueOf(contest.get("contestNo")));
			cd.contestModifyForeDelImg(contestNo);
			if(result==0)
			{
				throw new BoardException("게시판 등록실패");
			}
			for(ContestImg contestImg :files)
			{
				System.out.println("시발"+contestNo);
				contestImg.setContestNo(contestNo);
				result=cd.contestUpdateImg(contestImg);
				if(result==0) throw new BoardException("파일 업로드 실패");
			}
		}
		catch(Exception e)
		{
			throw e;
		}		
		
		return result;	
	}		
}
