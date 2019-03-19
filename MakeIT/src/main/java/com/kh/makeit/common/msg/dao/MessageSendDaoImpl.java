package com.kh.makeit.common.msg.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageSendDaoImpl implements MessageSendDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int messageSendDao(Map<String, String> messageSendMap) {
		// TODO Auto-generated method stub
		return sqlSession.insert("common.messageSend", messageSendMap);
	}	
}
