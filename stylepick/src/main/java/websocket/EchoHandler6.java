package websocket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import logic.User;

public class EchoHandler6  extends TextWebSocketHandler {
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.add(session);
		String senderId = getUserid(session);
		userSessionsMap.put(senderId , session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String senderId = getUserid(session);
		// Broadcasting
		for (WebSocketSession sess : sessions) {
			sess.sendMessage(new TextMessage(senderId + ": " +  message.getPayload()));
		}
		
		// command, sender, receiver, sequence
		String msg = message.getPayload();
		if (StringUtils.isNotEmpty(msg)) {
			String[] strs = msg.split(",");
			
			if (strs != null && strs.length == 5) {
				String cmd = strs[0];
				String sender = strs[1]; 
				String receiver = strs[2];
				String receiverId = strs[3];
				String seq = strs[4];
				
				// receiver login
				WebSocketSession boardWriterSession = userSessionsMap.get(receiverId);
				if("reply".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(sender + " to " + receiver + " at " + seq);
					boardWriterSession.sendMessage(tmpMsg);
				}
			}
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed " + session + ", " + status);
		userSessionsMap.remove(session.getId());
		sessions.remove(session);
	}
	
	private String getUserid(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		User loginUser = (User)httpSession.get("loginUser");
		
		if(loginUser == null) {
			return session.getId();
		} else {
			return loginUser.getUserid();
		}
	}
}
