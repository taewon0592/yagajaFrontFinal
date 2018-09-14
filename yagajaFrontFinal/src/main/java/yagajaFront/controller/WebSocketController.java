package yagajaFront.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * Tomcat7의 webSocket 테스트
 * <P>
 * 이 모듈을 사용할 경우 Singleton으로 동작하지 않는다. sessions가 각 호출 시 마다 생성되므로 static으로 정해 줘야
 * 한다.<br>
 * 브라우져가 websocket을 지원 해야 한다.<br>
 * 웹 소켓 연결 후 별도 close 동작 없이 브라우져를 닫을 경우 자동으로 OnClose가 호출 된다.
 * 
 * @author KimSH
 * @see https://blog.idrsolutions.com/2013/12/websockets-an-introduction/
 */
@Controller
//@ServerEndpoint는 클라이언트에서 서버로 접속 할 주소로 지정합니다.
@ServerEndpoint(value = "/echo/{roomId}")
public class WebSocketController {

	
	private static final java.util.Set<Session> sessions = java.util.Collections
			.synchronizedSet(new java.util.HashSet<Session>());

	/**
	 * @OnOpen allows us to intercept the creation of a new session. The session
	 *         class allows us to send data to the user. In the method onOpen,
	 *         we'll let the user know that the handshake was successful.
	 */
	//@OnOpen은 클라이언트에서 서버로 접속할 때의 처리입니다.
	@OnOpen
	public void onOpen(Session session, @PathParam("roomId") String roomId) {
		System.out.println("Open session id : " + session.getId());
		
		//세션에 파라미터로 받은 roomId 저장
		session.getUserProperties().put("roomId", roomId);

		try {
			final Basic basic = session.getBasicRemote();
			basic.sendText("admin : 안녕하세요. 무엇을 도와 드릴까요?");
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}

		sessions.add(session);
	}

	/**
	 * 모든 사용자에게 메시지를 전달한다.
	 * 
	 * @param self
	 * @param message
	 */
	private void sendAllSessionToMessage(Session self, String message) {
		try {
			for (Session session : sessions) {
				if (!self.getId().equals(session.getId()))
					session.getBasicRemote().sendText("All : " + message);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * When a user sends a message to the server, this method will intercept the
	 * message and allow us to react to it. For now the message is read as a
	 * String.
	 */
	//@OnMessage에서는 클라이언트로 부터 메시지가 도착했을때 처리입니다.
	@OnMessage
	public void onMessage(String message, Session session) {

		System.out.println("Message From " + message.split(",")[1] + " : " + message.split(",")[0]);
		String name = message.split(",")[1];
		message = message.split(",")[0];
		try {

			System.out.println("session " + session.getUserProperties().get("roomId"));
			// 세션리스트 조회
			for (Session ss : WebSocketController.sessions) {

				System.out.println("ss " + ss.getUserProperties().get("roomId"));
				// 세션리스트 조회
				// 현재 세션안에 속성으로 적어둔roomId의 값과 전체 세션리스트의 세션roomId의 값이 같으면
				if (session.getUserProperties().get("roomId").equals(ss.getUserProperties().get("roomId"))) {
					// 메세지 출력
					ss.getBasicRemote().sendText(name + " : " + message);
				}
			}

			// String sendMessage = "잘모르겠습니다.";
			// basic.sendText("서버 : " + sendMessage);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		//sendAllSessionToMessage(session, message);
	}

	@OnError
	public void onError(Throwable e, Session session) {

	}

	/**
	 * The user closes the connection.
	 * 
	 * Note: you can't send messages to the client from this method
	 */
	//@OnClose는 접속이 끊겼을때 처리입니다.
	@OnClose
	public void onClose(Session session) {
		System.out.println("Session " + session.getId() + " has ended");
		sessions.remove(session);
	}
}
