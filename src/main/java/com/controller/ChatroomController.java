package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.model.Chatmessage;
import com.model.Chatroom;
import com.model.ChatroomDto;
import com.service.ChatroomService;

@Controller
@RequestMapping("/chatroom")
public class ChatroomController {
	@Autowired
   ChatroomService chatRoomService;
	
	@RequestMapping
	public String show() {
		return "chatroom";
	}
	
	/*@RequestMapping("showchat")
	public String showchat(HttpServletRequest request,final RedirectAttributes redirectAttributes) {
		int id=Integer.parseInt(request.getParameter("id"));
		System.out.println("id to show chat "+id);
		List<Chatmessage> list=chatRoomService.getChatList(id);
		redirectAttributes.addFlashAttribute("list", list);
		return "redirect:/chatroom/detail";
	}*/
	
	

	@RequestMapping("/detail/{id}")
	@ResponseBody
	public ChatroomDto restDetail(@PathVariable int id) {
		System.out.println("inside @RequestMapping(/detail/{id})");
		ChatroomDto r= chatRoomService.getSingleChatroom(id);
		return r;
	}

	@RequestMapping("/detail")
	public String mm(Model model,@RequestParam int id) {
		System.out.println("inside @RequestMapping(/detail/{id})");
		Chatroom chatroom=chatRoomService.getChatroom(id);
		model.addAttribute("chatroom", chatroom);
		return "detail";
	}


	@ModelAttribute("chatroom")
	public Chatroom create() {
		Chatroom chatroom = new Chatroom();
		return chatroom;
	}

	@RequestMapping(method = RequestMethod.POST)
	public String save(@ModelAttribute @Valid Chatroom chatroom,
			BindingResult bindingResult) {
		System.out.println("inside method = RequestMethod.POST");
		if (bindingResult.hasErrors()) {
			return "chatroom";
		}
		chatRoomService.save(chatroom);
		return "redirect:/chatroom.html?success=true";
	}

	@RequestMapping("/list")
	public String list(Model model) {
		model.addAttribute("chatrooms", chatRoomService.getChatrooms());
		return "list";
	}

	/*@RequestMapping("/detail")
	public String detail(Model model, @RequestParam int id) {
		//Gson gson=new Gson();
		//System.out.println("inside /detail");
		Chatroom chatroom = chatRoomService.getChatroom(id);
		List<Chatmessage> chatmessage=chatRoomService.getChatList(id);
		String json=gson.toJson(chatmessage);
    	System.out.println(json);
		model.addAttribute("chatroom", chatroom);
		model.addAttribute("list", json.toString());
		
		return "detail";
	}*/

	@RequestMapping("/remove")
	public String remove(Model model, @RequestParam int id) {
		chatRoomService.delete(id);
		return "redirect:/chatroom/list";
	}

	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public String saveMessage(@RequestParam String message, @RequestParam int id,Model m) {
		System.out.println("inside /detail with post");
		Chatmessage chatMessage = new Chatmessage();
		chatMessage.setMessage(message);
		chatRoomService.saveChatMessage(chatMessage, id);
		 //List list = (List) m.asMap().get("list");
		 //m.addAttribute("list", list);
		return "redirect:/chatroom/detail?id=" + id;
	}

}
