package com.kh.makeit.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.makeit.member.model.dao.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {

   @Autowired
   MemberDao dao;
   
   @Override
   public Map<String, String> idDuplicate(String memberId) {
      return dao.idDuplicate(memberId);
   }

   @Override
   public int insertMember(Map<Object, Object> map) {
      return dao.insertMember(map);
   }

	@Override
	public Map<Object, Object> login(Map<String, String> map) {
		return dao.login(map);
	}

   @Override
   public Map<Object, Object> selectOne(String id) {
      return dao.selectOne(id);
   }

	@Override
	public int memberIntroduction(Map<String, String> map) {
		return dao.memberIntroduction(map);
	}

	@Override
	public int selectBuyCount(String id) {
		return dao.selectBuyCount(id);
	}

	@Override
	public int boardSellCount(String id) {
		return dao.boardSellCount(id);
	}

	@Override
	public double buyAvg(String id) {
		return dao.buyAvg(id);
	}

	@Override
	public double sellAvg(String id) {
		return dao.sellAvg(id);
	}

	@Override
	public List<String> searchId(String email) {
		return dao.searchId(email);
	}

	@Override
	public String searchEmail(String id) {
		return dao.searchEmail(id);
	}

	@Override
	public int updatePw(Map<String, String> map) {
		return dao.updatePw(map);
	}

	@Override
	public int memberUpdate(Map<Object, Object> map) {
		return dao.memberUpdate(map);
	}

	@Override
	public int deleteMember(String id) {
		return dao.deleteMember(id);
	}

	@Override
	public List<Map<String, String>> buyOutBoxList(String memberId, int buycPage, int numPerPage) {
		return dao.buyOutBoxList(memberId,buycPage,numPerPage);
	}

	@Override
	public List<Map<String, String>> sellOutBoxList(String memberId, int sellcPage, int numPerPage) {
		return dao.sellOutBoxList(memberId,sellcPage,numPerPage);
	}

	@Override
	public int selectOutBoxBuyCount(String memberId) {
		return dao.selectOutBoxBuyCount(memberId);
	}

	@Override
	public int selectOutBoxSellCount(String memberId) {
		return dao.selectOutBoxSellCount(memberId);
	}

	@Override
	public List<Map<Object, Object>> buyList(String memberId, int buycPage, int numPerPage) {
		return dao.buyList(memberId,buycPage,numPerPage);
	}

	@Override
	public List<Map<Object, Object>> sellList(String memberId, int sellcPage, int numPerPage) {
		return dao.sellList(memberId,sellcPage,numPerPage);
	}

	@Override
	public int selectServiceNum() {

		return dao.selectServiceNum();
	}

	@Override
	public int selectTradeNum() {
		
		return dao.selectTradeNum();
	}

	@Override
	public List<Map<String, String>> selectRanking() {

		return dao.selectRanking();
	}

	public List<Map<String, String>> sendMessage(String memberId,int buycPage, int numPerPage) {
		return dao.sendMessage(memberId,buycPage,numPerPage);
	}

	@Override
	public List<Map<String, String>> receiveMessage(String memberId,int sellcPage, int numPerPage) {
		return dao.receiveMessage(memberId,sellcPage,numPerPage);
	}

	@Override
	public int totalSendCount(String memberId) {
		return dao.totalSendCount(memberId);
	}

	@Override
	public int totalReceiveCount(String memberId) {
		return dao.totalReceiveCount(memberId);
	}

	@Override
	public Map<Object, Object> messageDetail(int messageNo) {
		return dao.messageDetail(messageNo);
	}

	@Override
	public int updateMessageDate(int messageNo) {
		return dao.updateMessageDate(messageNo);
	}

	@Override
	public int deleteReceiveMessage(Map<Object, Object> map) {
		return dao.deleteReceiveMessage(map);
	}

	@Override
	public int deleteSendMessage(Map<Object, Object> map) {
		return dao.deleteSendMessage(map);
	}

	@Override
	public int deleteReceiveMessages(int delListInt) {
		return dao.deleteReceiveMessages(delListInt);
	}

	@Override
	public int deleteSendMessages(int delListInt) {
		return dao.deleteSendMessages(delListInt);
	}

	@Override
	public int sendMessageEnd(Map<String, String> message) {
		return dao.sendMessageEnd(message);
	}

	@Override
	public List<Map<Object, Object>> freeList(String memberId, int freecPage, int numPerPage) {
		return dao.freeList(memberId,freecPage,numPerPage);
	}

	@Override
	public int selectFreeCount(String memberId) {
		return dao.selectFreeCount(memberId);
	}

	@Override
	public List<Map<Object, Object>> qnaList(String memberId, int qnacPage, int numPerPage) {
		return dao.qnaList(memberId,qnacPage,numPerPage);
	}

	@Override
	public int selectQnaCount(String memberId) {
		return dao.selectQnaCount(memberId);
	}

	@Override
	public Map<String, Object> getAccount(Map<String, String> account) {
		return dao.getAccount(account);
	}

	@Override
	public List<Map<Object, Object>> contestList(String memberId, int contestcPage, int numPerPage) {
		return dao.contestList(memberId,contestcPage,numPerPage);
	}

	@Override
	public int selectContestCount(String memberId) {
		return dao.selectContestCount(memberId);
	}

	@Override
	public int noReadMessage(String id) {
		return dao.noReadMessage(id);
	}

	@Override
	public int insertNaverMember(Map<String, String> map) {
		return dao.insertNaverMember(map);
	}

	@Override
	public Map<Object, Object> selectNaverOne(String id) {
		return dao.selectNaverOne(id);
	}

	@Override
	public int deleteNaverMember(String updateId) {
		return dao.deleteNaverMember(updateId);
	}

	@Override
	public List<Map<String, String>> bankList() {
		return dao.bankList();
	}

	@Override
	public List<Map<String,String>> memberSearch(String receiveId) {
		return dao.memberSearch(receiveId);
	}

	@Override
	public List<Map<String, String>> contestOutBoxList(String memberId, int contestcPage, int numPerPage) {
		return dao.contestOutBoxList(memberId,contestcPage,numPerPage);
	}

	@Override
	public int selectOutBoxContestCount(String memberId) {
		return dao.selectOutBoxContestCount(memberId);
	}

	@Override
	public List<Map<Object, Object>> sellTradeList(String memberId, int sellcPage, int numPerPage) {
		return dao.sellTradeList(memberId,sellcPage,numPerPage);
	}

	@Override
	public List<Map<Object, Object>> buyTradeList(String memberId, int buycPage, int numPerPage) {
		return dao.buyTradeList(memberId,buycPage,numPerPage);
	}

	@Override
	public List<Map<Object, Object>> contestTradeList(String memberId, int contestcPage, int numPerPage) {
		return dao.contestTradeList(memberId,contestcPage,numPerPage);
	}

	@Override
	public int totalSellTradeCount(String memberId) {
		return dao.totalSellTradeCount(memberId);
	}

	@Override
	public int totalBuyTradeCount(String memberId) {
		return dao.totalBuyTradeCount(memberId);
	}

	@Override
	public int totalContestTradeCount(String memberId) {
		return dao.totalContestTradeCount(memberId);
	}
	
}

