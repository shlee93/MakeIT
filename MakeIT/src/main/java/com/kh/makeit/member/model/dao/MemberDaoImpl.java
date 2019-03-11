package com.kh.makeit.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public Map<String, String> idDuplicate(String memberId) {
		return sqlSession.selectOne("member.idDuplicate",memberId);
	}

	@Override
	public int insertMember(Map<Object, Object> map) {
		return sqlSession.insert("member.insertMember",map);
	}

	@Override
	public Map<Object, Object> login(Map<String, String> map) {
		return sqlSession.selectOne("member.login",map);
	}

	@Override
	public Map<Object, Object> selectOne(String id) {
		return sqlSession.selectOne("member.selectOne",id);
	}

	@Override
	public int memberIntroduction(Map<String, String> map) {
		return sqlSession.update("member.memberIntroduction",map);
	}

	@Override
	public int selectBuyCount(String id) {
		return sqlSession.selectOne("member.selectBuyCount",id);
	}

	@Override
	public int boardSellCount(String id) {
		return sqlSession.selectOne("member.boardSellCount",id);
	}

	@Override
	public double buyAvg(String id) {
		double result = 0;
		if(sqlSession.selectOne("member.buyAvg",id) != null) {
			result = sqlSession.selectOne("member.buyAvg",id);
		}
		return result;
	}

	@Override
	public double sellAvg(String id) {
		double result = 0;
		if(sqlSession.selectOne("member.sellAvg",id) != null) {
			result = sqlSession.selectOne("member.sellAvg",id);
		}
		return result;
	}

	@Override
	public List<String> searchId(String email) {
		return sqlSession.selectList("member.searchId",email);
	}

	@Override
	public String searchEmail(String id) {
		return sqlSession.selectOne("member.searchEmail",id);
	}

	@Override
	public int updatePw(Map<String, String> map) {
		return sqlSession.update("member.updatePw",map);
	}

	@Override
	public int memberUpdate(Map<Object, Object> map) {
		return sqlSession.update("member.memberUpdate",map);
	}

	@Override
	public int deleteMember(String id) {
		return sqlSession.update("member.deleteMember",id);
	}

	@Override
	public List<Map<String, String>> buyOutBoxList(String memberId, int buycPage, int numPerPage) {
		RowBounds row = new RowBounds((buycPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("member.buyOutBoxList",memberId,row);
	}

	@Override
	public List<Map<String, String>> sellOutBoxList(String memberId, int sellcPage, int numPerPage) {
		RowBounds row = new RowBounds((sellcPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("member.sellOutBoxList",memberId,row);
	}

	@Override
	public int selectOutBoxBuyCount(String memberId) {
		return sqlSession.selectOne("member.selectOutBoxBuyCount",memberId);
	}

	@Override
	public int selectOutBoxSellCount(String memberId) {
		return sqlSession.selectOne("member.selectOutBoxSellCount",memberId);
	}

	@Override
	public List<Map<String, String>> buyList(String memberId, int buycPage, int numPerPage) {
		RowBounds row = new RowBounds((buycPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("member.buyList",memberId,row);
	}

	@Override
	public List<Map<String, String>> sellList(String memberId, int sellcPage, int numPerPage) {
		RowBounds row = new RowBounds((sellcPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("member.sellList",memberId,row);
	}

	@Override
	public List<Map<String, String>> sendMessage(String memberId,int buycPage, int numPerPage) {
		RowBounds row = new RowBounds((buycPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("member.sendMessage",memberId,row);
	}

	@Override
	public List<Map<String, String>> receiveMessage(String memberId,int sellcPage, int numPerPage) {
		RowBounds row = new RowBounds((sellcPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("member.receiveMessage",memberId,row);
	}

	@Override
	public int totalSendCount(String memberId) {
		return sqlSession.selectOne("member.totalSendCount",memberId);
	}

	@Override
	public int totalReceiveCount(String memberId) {
		return sqlSession.selectOne("member.totalReceiveCount",memberId);
	}

	@Override
	public Map<Object, Object> messageDetail(int messageNo) {
		return sqlSession.selectOne("member.messageDetail",messageNo);
	}

	@Override
	public int updateMessageDate(int messageNo) {
		return sqlSession.update("member.updateMessageDate",messageNo);
	}

	@Override
	public int deleteReceiveMessage(Map<Object, Object> map) {
		return sqlSession.update("member.deleteReceiveMessage",map);
	}

	@Override
	public int deleteSendMessage(Map<Object, Object> map) {
		return sqlSession.update("member.deleteSendMessage",map);
	}

	@Override
	public int deleteReceiveMessages(int delListInt) {
		return sqlSession.update("member.deleteReceiveMessages",delListInt);
	}

	@Override
	public int deleteSendMessages(int delListInt) {
		return sqlSession.update("member.deleteSendMessages",delListInt);
	}

	@Override
	public int sendMessageEnd(Map<String, String> message) {
		return sqlSession.insert("member.sendMessageEnd",message);
	}

	@Override
	public int selectFreeCount(String memberId) {
		return sqlSession.selectOne("member.selectFreeCount",memberId);
	}

	@Override
	public List<Map<String, String>> freeList(String memberId, int freecPage, int numPerPage) {
		RowBounds row = new RowBounds((freecPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("member.freeList",memberId,row);
	}

	@Override
	public List<Map<String, String>> qnaList(String memberId, int qnacPage, int numPerPage) {
		RowBounds row = new RowBounds((qnacPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("member.qnaList",memberId,row);
	}

	@Override
	public int selectQnaCount(String memberId) {
		return sqlSession.selectOne("member.selectQnaCount",memberId);
	}
	

}
