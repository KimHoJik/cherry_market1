package com.acorn.cherryM1.websocket;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.acorn.cherryM1.ChatService.openChatService;

public class socketHandler extends TextWebSocketHandler{
	@Autowired
	private openChatService Service;
	List<WebSocketSession> sessions=new ArrayList<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.add(session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message)  throws Exception {
		
		for (WebSocketSession sess:sessions) {
			sess.sendMessage(new TextMessage(message.getPayload()));
		}
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
	}
}
