package com.service;

import java.util.Date;
import java.util.List;

import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ChatroomDAOImpl;
import com.model.Chatmessage;
import com.model.Chatroom;
import com.model.ChatroomDto;

@Service
public class ChatroomService {

	@Autowired
   ChatroomDAOImpl chatRoomDAOImpl;
	public List<Chatroom> getChatrooms() {
		return chatRoomDAOImpl.list();
	}

	public Chatroom getChatroom(int id) {
		return chatRoomDAOImpl.single(id);
	}
	
	public void delete(int id) {
		chatRoomDAOImpl.delete(id);
	}

	
	public void save(Chatroom chatroom) {
		chatRoomDAOImpl.save(chatroom);
	}

	public void saveChatMessage(Chatmessage chatMessage, int id) {
		Chatroom chatroom = chatRoomDAOImpl.single(id);
		chatMessage.setChatroom(chatroom);
		chatMessage.setAddedDate(new Date());
		chatRoomDAOImpl.saveMessage(chatMessage);
	}

	public void deleteAll() {
		chatRoomDAOImpl.deleteAll();
	}
	
	public ChatroomDto getSingleChatroom(int id) {
		System.out.println("inside dozer mapper");
		Chatroom chatroom = chatRoomDAOImpl.single(id);
		Mapper mapper = new DozerBeanMapper();
		return mapper.map(chatroom, ChatroomDto.class);
	}
	
	public List<Chatmessage> getChatList(int id) {
		List<Chatmessage> list= chatRoomDAOImpl.getChatList(id);
		return list;
	}
}
