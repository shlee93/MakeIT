package com.kh.makeit.common.msg.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.makeit.common.msg.dao.MessageSendDao;

@Service
public class MessageSendServiceImpl implements MessageSendService 
{
	@Autowired MessageSendDao msd;

	@Override
	public int messageSendService(Map<String, String> messageSendMap) 
	{		
		return msd.messageSendDao(messageSendMap);
	}
	
}
