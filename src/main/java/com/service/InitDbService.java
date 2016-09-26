package com.service;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.model.Chatroom;

@Service
public class InitDbService {

	@Autowired
	ChatroomService chatRoomService;

	@Transactional
	@PostConstruct
	@Scheduled(fixedDelay = 86400000, initialDelay = 86400000)
	public void init() {
		System.out.println("START INIT DATABASE");
		chatRoomService.deleteAll();
		{
			Chatroom chatroom = new Chatroom();
			chatroom.setName("Robotics");
			chatroom.setDescription("Future Scope..");
			chatRoomService.save(chatroom);
		}

		{
			Chatroom chatroom = new Chatroom();
			chatroom.setName("Coding Lovers");
			chatroom.setDescription("Code Optimization..");
			chatRoomService.save(chatroom);
		}

		{
			Chatroom chatroom = new Chatroom();
			chatroom.setName("Mark Juckerberg");
			chatroom.setDescription("An enterpreneur..");
			chatRoomService.save(chatroom);
		}
		System.out.println("init completed");
	}
}
