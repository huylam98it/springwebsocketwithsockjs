package com.huylam98it.springwebsocketsockjs.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import com.huylam98it.springwebsocketsockjs.model.Message;

@Controller
public class SocketController {

	@MessageMapping("/hello")		//neu tin nhan duoc gui den /hello
	@SendTo("/topic/abc")			//thi se gui tin nhan do den cac client subscribe /topic/abc
	public  Message test(Message message) {
		System.out.println("client said: " + message.getData());
		return new Message("ban da ket noi den server");
	}
}
