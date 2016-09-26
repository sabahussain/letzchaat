package com.dao;

import java.util.List;

import com.model.Chatmessage;
import com.model.Chatroom;

public interface ChatroomDAO {
	public List<Chatroom> list();
	public Chatroom single(int id);
	public void delete(int id);
	public void save(Chatroom chatroom);
	public void saveMessage(Chatmessage chatMessage);
	public void deleteAll();
	public List<Chatmessage> getChatList(int id);
}
