package com.kh.makeit.member.model.dao;

import java.util.List;
import java.util.Map;

public interface MemberDao {

	Map<String, String> idDuplicate(String memberId);

	int insertMember(Map<Object, Object> map);

	Map<Object, Object> login(Map<String, String> map);

	Map<Object, Object> selectOne(String id);

	int memberIntroduction(Map<String, String> map);

	int selectBuyCount(String id);

	int boardSellCount(String id);

	double buyAvg(String id);

	double sellAvg(String id);

	List<String> searchId(String email);

	String searchEmail(String id);

	int updatePw(Map<String, String> map);

	int memberUpdate(Map<Object, Object> map);

	int deleteMember(String id);

	List<Map<String, String>> buyOutBoxList(String memberId, int buycPage, int numPerPage);

	List<Map<String, String>> sellOutBoxList(String memberId, int sellcPage, int numPerPage);

	int selectOutBoxBuyCount(String memberId);

	int selectOutBoxSellCount(String memberId);

	List<Map<String, String>> buyList(String memberId, int buycPage, int numPerPage);

	List<Map<String, String>> sellList(String memberId, int sellcPage, int numPerPage);

	List<Map<String, String>> sendMessage(String memberId, int buycPage, int numPerPage);

	List<Map<String, String>> receiveMessage(String memberId,int sellcPage, int numPerPage);

	int totalSendCount(String memberId);

	int totalReceiveCount(String memberId);

	Map<Object, Object> messageDetail(int messageNo);

	int updateMessageDate(int messageNo);

	int deleteReceiveMessage(Map<Object, Object> map);

	int deleteSendMessage(Map<Object, Object> map);

	int deleteReceiveMessages(int delListInt);

	int deleteSendMessages(int delListInt);

	int sendMessageEnd(Map<String, String> message);

	int selectFreeCount(String memberId);

	List<Map<String, String>> freeList(String memberId, int freecPage, int numPerPage);

	List<Map<String, String>> qnaList(String memberId, int qnacPage, int numPerPage);

	int selectQnaCount(String memberId);

	Map<String, Object> getAccount(Map<String, String> account);

	List<Map<String, String>> contestList(String memberId, int contestcPage, int numPerPage);

	int selectContestCount(String memberId);

	int noReadMessage(String id);

}
