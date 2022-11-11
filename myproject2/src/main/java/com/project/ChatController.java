package com.project;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.json.JSONObject;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.project.vo.Room;

@Controller
public class ChatController {

	
	
	List<Room> roomList = new ArrayList<Room>();
	static int roomNumber = 0;
	
	@RequestMapping("/chat")
	public ModelAndView chat() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat");
		return mv;
	}
	
	/**
	 * 방 페이지
	 * @return
	 */
	@RequestMapping("/room")
	public ModelAndView room() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("room");
		return mv;
	}
	
	/**
	 * 방 생성하기
	 * @param params
	 * @return
	 */
	@RequestMapping("/createRoom")
	public @ResponseBody List<Room> createRoom(@RequestParam HashMap<Object, Object> params){
		String roomName = (String) params.get("roomName");
		if(roomName != null && !roomName.trim().equals("")) {
			Room room = new Room();
			room.setRoomNumber(++roomNumber);
			room.setRoomName(roomName);
			roomList.add(room);
		}
		return roomList;
	}
	
	/**
	 * 방 정보가져오기
	 * @param params
	 * @return
	 */
	@RequestMapping("/getRoom")
	public @ResponseBody List<Room> getRoom(@RequestParam HashMap<Object, Object> params){
		return roomList;
	}
	
	/**
	 * 채팅방
	 * @return
	 */
	@RequestMapping("/moveChating")
	public ModelAndView chating(@RequestParam HashMap<Object, Object> params) {
		ModelAndView mv = new ModelAndView();
		System.out.println(params.get("roomNumber"));
		int roomNumber = Integer.parseInt((String) params.get("roomNumber")); 
		List<Room> new_list = roomList.stream().filter(o->o.getRoomNumber()==(roomNumber)).collect(Collectors.toList());
		if(new_list != null && new_list.size() > 0) {
			mv.addObject("roomName", params.get("roomName"));
			mv.addObject("roomNumber", params.get("roomNumber"));
			mv.setViewName("userchat");
		}else {
			mv.setViewName("room");
		}
		return mv;
	}
	
	/*
	 * @RequestMapping("/") public String main(Model model) { return "index"; }
	 */
	@RequestMapping("/test_chat.do")
	public String test_chat(Model model) {
		return "test_chat";
	}
	
	@Component
	public class MyHandler extends TextWebSocketHandler{
		//연결 요청 처리 
	        //메시지 받기, 메시지 전달

		//WebSocketSession 클라이언트 당 하나씩 생성, 해당 클라이언트와 연결된 웹소켓을 이용할 수 있는 객체  
		//해당 객체를 통해 메시지를 주고 받음

		private List<WebSocketSession> users;
		private Map<String, Object> userMap;
		
		public MyHandler() {
			users= new ArrayList<WebSocketSession>();
			userMap = new HashMap<String,Object>();
		}

		@Override
	        //소켓 연결 생성 후 실행 메서드
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			System.out.println("TextWebSocketHandler : 연결 생성!");
			users.add(session);
		}

		@Override
	        //메시지 수신 후 실행 메서드
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			System.out.println("TextWebSocketHandler : 메시지 수신!");
			System.out.println("메시지 : " + message.getPayload());
			JSONObject object = new JSONObject(message.getPayload());
			String type = object.getString("type");

			if(type != null && type.equals("register") ) {
				//등록 요청 메시지
				String user = object.getString("userid");
				//아이디랑 Session이랑 매핑 >>> Map
				userMap.put(user, session);
			}else {
				//채팅 메시지 : 상대방 아이디를 포함해서 메시지를 보낼것이기 때문에
				//Map에서 상대방 아이디에 해당하는 WebSocket 꺼내와서 메시지 전송
				String target = object.getString("target");
				WebSocketSession ws = (WebSocketSession)userMap.get(target);
				String msg = object.getString("message");
				if(ws !=null ) {
					ws.sendMessage(new TextMessage(msg));
				}
			}
		}

		@Override
	        //연결 해제 후 실행 메서드
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			System.out.println("TextWebSocketHandler : 연결 종료!");
			users.remove(session);
		}	
	}
}
