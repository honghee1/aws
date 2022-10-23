package com.project;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.project.Service.BookingService;
import com.project.Service.MemberService;
import com.project.Service.NaverAPI;
import com.project.Service.QnAService;
import com.project.Service.ScreenService;
import com.project.Service.kakaoAPI;
import com.project.Service.movieService;
import com.project.dto.AdminDTO;
import com.project.dto.BookingDTO;
import com.project.dto.CinemaDTO;
import com.project.dto.FileDTO;
import com.project.dto.MemberDTO;
import com.project.dto.MovieDTO;
import com.project.dto.QnADTO;
import com.project.dto.ScreenDTO;
import com.project.dto.ScreenMovieDTO;
import com.project.vo.PaggingVO;
import com.project.vo.Room;

@Controller
public class MainController {
	private movieService movieservice;
	private MemberService service;
	private QnAService qnaservice;
	private kakaoAPI kakaoAPI;
	private ScreenService screenservice;
	private BookingService bookingservice;
	private NaverAPI naverAPI;
	
	
	public MainController(movieService movieservice, MemberService service, QnAService qnaservice,
			com.project.Service.kakaoAPI kakaoAPI, ScreenService screenservice, BookingService bookingservice,
			com.project.Service.NaverAPI naverAPI) {
		super();
		this.movieservice = movieservice;
		this.service = service;
		this.qnaservice = qnaservice;
		this.kakaoAPI = kakaoAPI;
		this.screenservice = screenservice;
		this.bookingservice = bookingservice;
		this.naverAPI = naverAPI;
	}

	/*---------------------------------------------박홍희------------------------------------------------*/
//	@RequestMapping("/admin-mainpage.do")
//	public String admin_mainpage1(Model model) {
//		return "admin-mainpage";
//	}

	@RequestMapping("/")
	public String index() {
		return "admin-login";
	}
	// 지점 관리 (은수은수은수)
//	@RequestMapping("/adminLogin.do")
//	public String adminMain(Model model, String cinemacode, String name, HttpSession session) {	
//		List<CinemaDTO> Cinemalist = movieservice.selectCinemaList();
//		session.setAttribute("cinemacode", cinemacode);
//		session.setAttribute("name", name);
//		model.addAttribute("Cinemalist", Cinemalist);
//		return "admin_index";
//	}

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
	
	@RequestMapping("/admin-mainpage.do")
	public String admin_mainpage(Model model) {
		return "admin-mainpage";
	}
	@RequestMapping("/moviesingle.do")
	public String moviesingle(Model model,String mcode) {
		List<FileDTO> Filelist = movieservice.selectFilePath(mcode);
		System.out.println(mcode);
		MovieDTO moviedto= movieservice.selectMovieDTO(mcode); 
		System.out.println(moviedto);
		model.addAttribute("moviedto", moviedto);
		model.addAttribute("Filelist", Filelist);
		model.addAttribute("page", "hh/moviesingle.jsp");
		return "main_index";
	}

//	@RequestMapping("/")
//	public String index(Model model, String cinemacode, String name, HttpSession session) {
//		List<CinemaDTO> Cinemalist = movieservice.selectCinemaList();
//		session.setAttribute("cinemacode", cinemacode);
//		session.setAttribute("name", name);
//		model.addAttribute("Cinemalist", Cinemalist);
//		return "admin_index";
//	}

	@RequestMapping("/main.do")
	public String blank(Model model, HttpServletResponse response) {
		List<MovieDTO> NowShowingMovielist = movieservice.selectNowshowingMovieList();
		System.out.println(NowShowingMovielist);
		model.addAttribute("NowShowingMovielist", NowShowingMovielist);
		List<MovieDTO> ComingSoonMovieList = movieservice.selectComingSoonMovieList();
		model.addAttribute("page", "main_body.jsp");
		model.addAttribute("ComingSoonMovieList", ComingSoonMovieList);
		
		return "main_index";
	}

	@RequestMapping("/select_all_movielist.do")
	public String selectAllMovieList(Model model) {
		List<MovieDTO> movieList = movieservice.selectAllMovieList();
		model.addAttribute("movieList", movieList);
		System.out.println(movieList);
		model.addAttribute("title", "영화 목록 :: Hello Movie Cinema");
		model.addAttribute("page", "hh/select_all_movielist.jsp");
		return "admin_index";
	}

	@RequestMapping("/deletemovie.do")
	public String deretemovie(Model model, String mcode) {
		String[] index = mcode.split(",");
		movieservice.deleteMovie(index);
		model.addAttribute("page", "hh/select_all_movielist.jsp");
		return "redirect:/select_all_movielist.do";
	}

	@RequestMapping("/select_movie_openAPI.do")
	public String openAPI(MovieDTO dto, Model model, HttpSession session, String cinemacode, String name) {
		List<CinemaDTO> Cinemalist = movieservice.selectCinemaList();
		session.setAttribute("cinemacode", cinemacode);
		session.setAttribute("name", name);
		/* model.addAttribute("Cinemalist", Cinemalist); */
		model.addAttribute("title", "영화 검색 :: Hello Movie Cinema");
		model.addAttribute("page", "hh/select_movie_openAPI.jsp");
		return "admin_index";
	}

	@RequestMapping("/insertMovie_pop_list.do")
	public String insertMovie_pop_list(Model model,HttpServletResponse response, MovieDTO dto,String tag) {
		System.out.println(tag);
		model.addAttribute("tag", tag);
		return "insertMovie_pop_list";
	}
	@RequestMapping("/insertMovie_pop.do")
	public String insertMovie_pop(Model model,HttpServletResponse response, MovieDTO dto,String tag) {
		System.out.println(tag);
		model.addAttribute("tag", tag);
		return "insertMovie_pop";
	}

	@RequestMapping("fileDown.do")
	public void fileDown(int fno, String mcode, HttpServletResponse response) throws IOException {
		System.out.println("ASdasd");
		String path = movieservice.selectFile(mcode, fno);
		File file = new File(path);
		response.setHeader("Content-Disposition", "attachement;fileName=" + file.getName());
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setContentLength((int) file.length());

		FileInputStream fis = new FileInputStream(file);
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
		byte[] buffer = new byte[1024 * 1024];
		while (true) {
			int size = fis.read(buffer);
			if (size == -1)
				break;
			bos.write(buffer, 0, size);
			bos.flush();
		}
		bos.close();
		fis.close();
	}
	

	@RequestMapping("/uploadmovie.do")
	public String uploadmovie(Model model, MovieDTO dto, ScreenMovieDTO scdto, MultipartHttpServletRequest request,
			String close, String update, int[] newfileindex, int[] oldfile) {
		System.out.println("ㅁㄴㅇㅁㄴㅇ"+scdto);
		System.out.println(scdto.getStartdate());
		if(scdto.getStartdate().length()==0) {
			scdto.setStartdate("0000-00-00");
		}
		if(scdto.getEnddate().length()==0) {
			scdto.setEnddate("0000-00-00");
		}
		dto.setTrailer(dto.getTrailer().substring(dto.getTrailer().lastIndexOf("/")+1));
		if (update != null) {
			dto.setMcode(update);
			scdto.setmcode(update);
			movieservice.updateMovie(dto, scdto);
			// 파일 업로드
			// 저장할 경로
			String root = "/var/lib/tomcat9/webapps/upload/";
			File userRoot = new File(root);
			if (!userRoot.exists())
				userRoot.mkdirs();
			String mcode = dto.getMcode();
			List<MultipartFile> fileList = request.getFiles("file");
			List<MultipartFile> newfileList = request.getFiles("newfile");
			int i = 1;
			int nf = 0;
			if (newfileindex != null) {
				nf = newfileindex[0];
			}
			/*
			 * for(int ii = 0;ii<=4;ii++) { System.out.println("asd"+oldfile[ii]);
			 * System.out.println("asd"+newfileindex[i]); }
			 */
			for (MultipartFile f : fileList) {
				/*
				 * if (f.getOriginalFilename() != "") { i++; continue; }
				 */
				String originalFileName = f.getOriginalFilename();
				if (f.getSize() == 0) {
					i++;
					continue;
				}
				File uploadFile = new File(root  +"/"+ originalFileName);
				movieservice.deleteFileList(mcode, i);
				movieservice.insertFileList(new FileDTO(uploadFile, mcode, i));
				i++;
				try {
					f.transferTo(uploadFile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (newfileindex != null) {
				int index = 0;
				for (MultipartFile f : newfileList) {
					String originalFileName = f.getOriginalFilename();
					if (f.getSize() == 0)
						continue;
					File uploadFile = new File(root +"/"+  originalFileName);
					movieservice.insertFileList(new FileDTO(uploadFile, mcode, newfileindex[index]));
					nf++;
					try {
						f.transferTo(uploadFile);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
					index++;
				}
			}
			if (close == null) {
				List<MovieDTO> list = movieservice.selectAllMovieList();
				model.addAttribute("list", list);
				return "redirect:/select_all_movielist.do";
			}
			return "close";
		} else {
			String mcode = movieservice.insertMovie(dto, scdto);
			// 파일 업로드
			// 저장할 경로
			String root = "/var/lib/tomcat9/webapps/upload/";
			File userRoot = new File(root);
			if (!userRoot.exists())
				userRoot.mkdirs();

			List<MultipartFile> fileList = request.getFiles("file");
			int i = 1;
			for (MultipartFile f : fileList) {
				String originalFileName = f.getOriginalFilename();
				if (f.getSize() == 0)
					continue;
				File uploadFile = new File(root +"/"+  originalFileName);
				movieservice.insertFileList(new FileDTO(uploadFile, mcode, i));
				i++;
				try {
					f.transferTo(uploadFile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (close == null) {
				List<MovieDTO> list = movieservice.selectAllMovieList();
				model.addAttribute("list", list);
				return "redirect:/select_all_movielist.do";
			}
			return "close";
		}
	}

	@RequestMapping("/close.do")
	public String close(Model model, String mcode) {
		return "close";
	}

	@RequestMapping("/movieView.do")
	public String movieView(String mcode, String update, Model model, HttpSession session) {
		MovieDTO dto = movieservice.selectMovieDTO(mcode);
		List<FileDTO> Filelist = movieservice.selectFilePath(mcode);
		ScreenMovieDTO scdto = movieservice.selectScreenMovieList(mcode);
		model.addAttribute("movie", dto);
		model.addAttribute("Filepath", Filelist);
		model.addAttribute("scdto", scdto);
		model.addAttribute("page", "hh/select_movie_detail_view.jsp");

		return "admin_index";
	}


	@RequestMapping("/insert_movie.do")
	public String insertMovie(HttpSession session, HttpServletResponse response, Model model, MovieDTO mdto,
			String cinemacode, String name,String genre,String close) {
		List<CinemaDTO> Cinemalist = movieservice.selectCinemaList();
		session.setAttribute("cinemacode", cinemacode);
		session.setAttribute("name", name);
		model.addAttribute("Cinemalist", Cinemalist);
		model.addAttribute("movie", mdto);
		model.addAttribute("title", "영화 등록 :: Hello Movie Cinema");
		model.addAttribute("page", "hh/insert_movie.jsp");
		model.addAttribute("pagetitle", "영화 등록 페이지");
		return "admin_index";
	}
	@RequestMapping("/insertmovie.do")
	public String insert_Movie(HttpSession session, HttpServletResponse response, Model model, MovieDTO mdto,
			String cinemacode, String name,String genre,String close) {
		List<CinemaDTO> Cinemalist = movieservice.selectCinemaList();
		session.setAttribute("cinemacode", cinemacode);
		session.setAttribute("name", name);
		model.addAttribute("Cinemalist", Cinemalist);
		model.addAttribute("mdto", mdto);
		model.addAttribute("page", "hh/insert_movie.jsp");
		model.addAttribute("pagetitle", "영화 등록 페이지");
		return "admin_index";
	}
	
	
	
	
	@RequestMapping("/data.do")
	public String data() {
		return "data";
	}
	@RequestMapping("/testapi.do")
	public String test() {
		return "testapi";
	}
	/*--------------------------------------------------------------------------------------------------*/

	/*---------------------------------------------이동희------------------------------------------------*/

	@RequestMapping("/loginView.do")
	public String loginView(Model model) {
		model.addAttribute("page", "dh/login.jsp");
		return "main_index";
	}
	
	@RequestMapping(value="/login")
    public String login(@RequestParam("code") String code, HttpSession session, Model model) {
        System.out.println("code : " + code);

        String access_Token = kakaoAPI.getAccessToken(code);
        System.out.println("access_Token : " + access_Token);
        
        HashMap<String, Object> userInfo = kakaoAPI.getUserInfo(access_Token);
        System.out.println("login Controller : " + userInfo);
        model.addAttribute("page", "dh/simple-register.jsp");
        //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
        if (userInfo.get("email") != null) {
            session.setAttribute("userEmail", userInfo.get("email"));
            session.setAttribute("access_Token", access_Token);
            session.setAttribute("kakaoLogin", true);
        }
        
    return "main_index";
}
 @RequestMapping(value="/logout")
    public String logout(HttpSession session, Model model) {
        String access_Token = (String)session.getAttribute("access_Token");
        model.addAttribute("page", "main_body.jsp");
        if(access_Token != null && !"".equals(access_Token)){
            kakaoAPI.kakaoLogout(access_Token);
//            session.removeAttribute("access_Token");
//            session.removeAttribute("userId");
            session.invalidate();
        }else{
            System.out.println("access_Token is null");
            return "redirect:/";
        }
        return "main_index";
        
    }
 
	 /*
	  * 네이버 로그인
	  */
	 @RequestMapping("/naverLogin.do")
	 public String naverLogin(String code, HttpSession session, Model model) throws UnsupportedEncodingException {
	    System.out.println("naver-code : " + code);
	
	    String access_token = naverAPI.getAccessToken(code);
	
	    HashMap<String, Object> userInfo = naverAPI.getUserInfo(access_token);
	    String nickname = (String) userInfo.get("nickname");
	    String email = (String) userInfo.get("email");
	    
	    session.setAttribute("naverlogin", true);
	    session.setAttribute("userName", nickname);
	    session.setAttribute("userEmail", email);
	    
	    session.setAttribute("naverToken", access_token);
	    
	    model.addAttribute("page", "dh/simple-register.jsp");
	    System.out.println("nickname : "+nickname);
	    System.out.println("email : "+email);
	    
	    return "main_index";
	
	 }
	
	@RequestMapping("/memberlogin.do")
	public void login(String userEmail, String userPasswd, HttpSession session, Model model, HttpServletResponse response) throws IOException {
		MemberDTO dto = service.login(userEmail, userPasswd);
		System.out.println(userEmail + " " + userPasswd);
		System.out.println(dto);
		model.addAttribute("page", "main_body.jsp");
		response.setContentType("text/html;charset=utf-8");
		if(dto != null) {
			String[] arr = dto.getAddress().split("/");
			session.setAttribute("login", true);
			session.setAttribute("dto", dto);
			session.setAttribute("userEmail", dto.getUserEmail());
			session.setAttribute("userName", dto.getUserName());
			session.setAttribute("address1", arr[0]);
			session.setAttribute("address2", arr[1]);
			session.setAttribute("address3", arr[2]);
			response.getWriter().write("<script>alert('"+dto.getUserName()+"님 환영합니다.');location.href='main.do';</script>");
//			return "main_index";
		} else {
			session.setAttribute("login", false);
			response.getWriter().write("<script>alert('이메일과 비밀번호를 확인하세요');location.href='main.do';</script>");
//			return "main_index";
		}
	}
	
	
	@RequestMapping("/memberlogout.do")
	public void memberlogout(HttpSession session, Model model, HttpServletResponse response) throws IOException {
		session.invalidate();
		model.addAttribute("page", "main_body.jsp");
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write("<script>alert('로그아웃이 정상적으로 처리되었습니다');location.href='main.do';</script>");
//		return "main_index";
	}
	
	@RequestMapping("/registerView.do")
	public String registerView(Model model) {
		model.addAttribute("page", "dh/register.jsp");
		return "main_index";
	}
	
	@RequestMapping("/register.do") 
	public String register(MemberDTO dto, String id, String email, String address1, String address2, String address3, Model model) {
		String userEmail = id + email;
		System.out.println(userEmail);
		System.out.println(dto.getUserBirth());
		String address = address1 + "/" + address2 + "/" + address3;
		dto.setUserEmail(userEmail);
		dto.setAddress(address);
		System.out.println(dto.toString());
		model.addAttribute("page", "main_body.jsp");
		service.insertMember(dto);
		return "main_index";
	}
	
	@RequestMapping("/memberMypage.do")
	public String memberMypage(Model model, HttpSession session) {
		String userEmail = (String) session.getAttribute("userEmail");
		MemberDTO mdto = service.selectMembermypage(userEmail);
		List<QnADTO> qdto = qnaservice.selectQnamypage(userEmail);
		model.addAttribute("mdto", mdto);
		model.addAttribute("qdto", qdto);
		model.addAttribute("page", "dh/mypage.jsp");
		return "main_index";
	}
	
	@RequestMapping("/qnaDetailView.do")
	public String qnaDetailView(int qno, Model model) {
		QnADTO qdto = qnaservice.selectQnaDetail(qno);
		model.addAttribute("qdto", qdto);
		model.addAttribute("page", "dh/qna-detail.jsp");
		return "main_index";
	}
	
	@RequestMapping("/updateView.do")
	public String updateView(Model model) {
		model.addAttribute("page", "dh/member_update.jsp");
		return "main_index";
	}
	
	@RequestMapping("/update.do")
	public String update(MemberDTO dto, String userEmail, String address1, String address2, String address3, String userTel, Model model) {
		String address = address1 + "/" + address2 + "/" + address3;
		dto.setAddress(address);
		dto.setUserTel(userTel);
		System.out.println(dto);
		service.updateMember(dto);
		model.addAttribute("page", "main_body.jsp");
		return "main_index";
	}
	
	@RequestMapping("/deleteView.do")
	public String deleteView(Model model) {
		model.addAttribute("page", "dh/check_delete.jsp");
		return "main_index";
	}
	
	@RequestMapping("/delete.do")
	public String delete(String id, String email, String userPasswd, HttpSession session, Model model) {
		String userEmail = id + email;
		service.deleteMamber(userEmail, userPasswd);
		model.addAttribute("page", "main_body.jsp");
		session.invalidate();
		return "main_index";
	}
	
	@RequestMapping("/findIdView.do")
	public String findIdView(Model model) {
		model.addAttribute("page", "dh/find-id.jsp");
		return "main_index";
	}
	
	@RequestMapping("findId.do")
	public ResponseEntity<List<MemberDTO>> findId(String userName, String userTel) {
		List<MemberDTO> list = service.selectUserEmail(userName, userTel);
		System.out.println(userTel);
		System.out.println(userName);
		return ResponseEntity.ok(list);
	}
	
	@RequestMapping("/findPasswdView.do")
	public String findPasswdView(Model model) {
		model.addAttribute("page", "dh/find-passwd.jsp");
		return "main_index";
	}
	
	@RequestMapping("findPasswd.do")
	public ResponseEntity<List<MemberDTO>> findPasswd(String userEmail, String userName, String userTel) {
//		System.out.println(userEmail);
//		System.out.println(userName);
//		System.out.println(userTel);
		List<MemberDTO> list = service.selectUserPasswd(userEmail, userName, userTel);
		if(list.size() > -1) {
			list = service.selectUserPasswd(userEmail, userName, userTel);
		}
//		System.out.println(list.toString());
		return ResponseEntity.ok(list);
	}
	
	@RequestMapping("/updatePasswd.do")
	public String updatePasswd(String userEmail, String userPasswd) {
		System.out.println("updatePasswd.do " + userEmail + " " + userPasswd);
		service.updatePasswd(userEmail, userPasswd);
		return "redirect:/main";
	}
	
	@RequestMapping("/allMemberView")
	public String allMemberView(Model model) {
		List<MemberDTO> list = service.selectAllMember();
		System.out.println(list.toString());
		for(int i=0;i<list.size();i++) {
			String[] arr = list.get(i).getAddress().split("/");
			model.addAttribute("address1", arr[0]);
			model.addAttribute("address2", arr[1]);
			model.addAttribute("address3", arr[2]);
		}
		model.addAttribute("title", "전체 회원 관리 :: Hello Movie Cinema");
		model.addAttribute("page", "dh/all_member_view.jsp");
		model.addAttribute("list", list);
		return "admin_index";
	}
	
	@RequestMapping("/memberDelete.do")
	public void memberDelete(String userEmail, HttpServletResponse response) throws IOException {
		int result = service.adminDeleteMember(userEmail);
		response.getWriter().write(String.valueOf(result));
	}
	
	@RequestMapping("memberProfile.do")
	public String memberProfile(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo, String userEmail, Model model) {
		MemberDTO dto = service.selectMemberProfile(userEmail);
		String[] arr = dto.getAddress().split("/");
		System.err.println(userEmail);
		List<QnADTO> qna = qnaservice.selectQna(userEmail, pageNo);
		System.out.println(qna.toString());
		int count = qnaservice.countQna(userEmail);
		PaggingVO vo = new PaggingVO(count, pageNo, 5 ,5);
		
		model.addAttribute("pagging", vo);
		model.addAttribute("qna", qna);
		model.addAttribute("dto", dto);
		model.addAttribute("address1", arr[0]);
		model.addAttribute("address2", arr[1]);
		model.addAttribute("address3", arr[2]);
		model.addAttribute("title", "회원 정보 관리 :: Hello Movie Cinema");
		model.addAttribute("page", "dh/member_profile.jsp");
		return "admin_index";
	}
	
	@RequestMapping("/memberUpdate.do")
	public void memberUpdate(MemberDTO dto, String address1, String address2, String address3, HttpServletResponse response) throws IOException {
		System.out.println(dto.toString());
		String address = address1 + "/" + address2 + "/" + address3;
		dto.setAddress(address);
		int result = service.adminMemberUpdate(dto);
		response.setContentType("text/html;charset=utf-8");
		if(result == 1)
			response.getWriter().write(
					"<script>alert('수정이 완료되었습니다.');location.href='memberProfile.do?userEmail="+dto.getUserEmail()+"';</script>");
		else
			response.getWriter().write(
					"<script>alert('수정에 실패하였습니다.');</script>");
	}
	
	@RequestMapping("qnaWriteView.do")
	public String qnaWriteView(Model model) {
		model.addAttribute("page", "dh/qna.jsp");
		return "main_index";
	}
	
	@RequestMapping("/qnaWrite.do")
	public String insertContent(QnADTO dto, HttpSession session, Model model) {
		dto.setuserEmail((String) session.getAttribute("userEmail"));
		System.out.println(dto);
		qnaservice.insertQnA(dto);
		model.addAttribute("page", "main_body.jsp");
		return "main_index";
	}
	
	@RequestMapping("/updateQnaResponse.do")
	public void updateQnaResponse(QnADTO dto, int qno, String qnaTitle, String response, HttpServletResponse script) throws IOException {
		int result = qnaservice.updateQnaResponse(qno, response);
		script.setContentType("text/html;charset=utf-8");
		if(result == 1)
			script.getWriter().write(
					"<script>alert('답변이 등록되었습니다.');location.href='memberProfile.do?userEmail="+dto.getuserEmail()+"';</script>");
		else
			script.getWriter().write(
					"<script>alert('답변등록에 실패하였습니다.');</script>");
	}
	
	@RequestMapping("/faqView.do")
	public String faqView(Model model) {
		model.addAttribute("page", "dh/faq.jsp");
		return "main_index";
	}
	
	@RequestMapping("allQnaView")
	public String allQnaView(Model model) {
		List<QnADTO> qlist = qnaservice.selectAllQnaView();
		System.out.println(qlist);
		model.addAttribute("qlist", qlist);
		model.addAttribute("title", "전체 문의 내역 :: Hello Movie Cinema");
		model.addAttribute("page", "dh/all_qna_view.jsp");
		return "admin_index";
	}
	
	@RequestMapping("/adminView.do")
	public String adminView(Model model) {
		List<AdminDTO> alist = service.selectAdminView();
		model.addAttribute("alist", alist);
		model.addAttribute("title", "관리자 페이지 :: Hello Movie Cinema");
		model.addAttribute("page", "dh/all_admin_view.jsp");
		return "admin_index";
	}
	
	@RequestMapping("/adminInsert.do")
	public ResponseEntity<Integer> adminInsert(AdminDTO adto) {
		System.out.println(adto);
		int result = service.adminInsert(adto);
		return ResponseEntity.ok(result);
	}
	
	@RequestMapping("/adminDelete.do")
	public ResponseEntity<Integer> adminDelete(String adminId) {
		System.out.println(adminId);
		int result = service.adminDelete(adminId);
		return ResponseEntity.ok(result);
	}
	
	@RequestMapping("adminLogin.do")
	public void adminMain(String adminId, String adminPasswd, HttpSession session, Model model, HttpServletResponse response) throws IOException {
		System.out.println("23123123"+adminPasswd);
		AdminDTO adto = service.adminLogin(adminId, adminPasswd);
		System.out.println(adto);
		model.addAttribute("page", "main_body.jsp");
		response.setContentType("text/html;charset=utf-8");
		if(adto != null) {
			session.setAttribute("login", true);
			session.setAttribute("adto", adto);
			session.setAttribute("adminId", adto.getAdminId());
			session.setAttribute("grade", adto.getGrade());
			response.getWriter().write("<script>alert('로그인 되었습니다.');location.href='admin.do';</script>");
		} else {
			session.setAttribute("login", false);
			response.getWriter().write("<script>alert('이메일과 비밀번호를 확인하세요');location.href='/';</script>");
		}
	}
	
	@RequestMapping("/admin.do")
	public String admin(String cinemacode, String name, HttpSession session) {
		List<CinemaDTO> Cinemalist = movieservice.selectCinemaList();
		session.setAttribute("cinemacode", cinemacode);
		session.setAttribute("title", "메인 페이지 :: Hello Movie Cinema");
		session.setAttribute("name", name);
		session.setAttribute("Cinemalist", Cinemalist);
		return "admin_index";
	}
	
	@RequestMapping("/adminLogout.do")
	public void adminLogout(HttpSession session, HttpServletResponse response) throws IOException {
		session.invalidate();
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write("<script>alert('로그아웃이 정상적으로 처리되었습니다');location.href='/';</script>");
	}

	/*--------------------------------------------------------------------------------------------------*/

	/*---------------------------------------------박은수------------------------------------------------*/
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YY/MM/dd"); // 날짜 데이터 포멧 설정
	@RequestMapping("/reserveView.do")
	public String reserveView(Model model) {
		// 추가할것 : 지점별 영화가 몇개있는지 추가 ex 서울(4)
		//         연령별 이미지 추가
		
		// 현재 날짜 기본 설정값 초기화
		String sdate = LocalDate.now().format(formatter);
		System.out.println(sdate);
		// 영화 리스트 불러오는 부분
		List<MovieDTO> movielist = movieservice.selectAllMovieList();
		
		// 1번째 리스트 mcode -> html에 최초 화면 제공용
		String mcode = movielist.get(0).getMcode();
		
		// sdate 임시 재설정
		/* sdate = "22/07/02"; */
		// 해당 영화 상영 지점 출력
		List<ScreenDTO> screenlist = screenservice.selectScreenList(mcode, sdate);
		
		model.addAttribute("movielist", movielist);
		model.addAttribute("screenlist", screenlist);
		model.addAttribute("title", "영화 예매 :: Hello Movie Cinema");
		model.addAttribute("page", "es/reserveView.jsp");
		return "main_index";
	}
	
	@RequestMapping("/screenListView.do")
	public ResponseEntity<List<ScreenDTO>> screenListView(String mcode, Model model) {
		String sdate = LocalDate.now().format(formatter);
		
		// sdate 임시 재설정
		/* sdate = "22/07/02"; */
				
		System.out.println("screenListView, mcode : "+mcode);
		System.out.println("movieListView, sdate : "+sdate);
		
		List<ScreenDTO> screenlist = screenservice.selectScreenList(mcode, sdate);
		
		return ResponseEntity.ok(screenlist);
	}
	
	@RequestMapping("/movieListView.do")
	public ResponseEntity<List<BookingDTO>> MovieListView(String screenCode, String sdate, String mcode, Model model) {

		// sdate 임시 재설정
		/* sdate = "22/07/02"; */
		
		System.out.println("movieListView, screenCode : "+screenCode);
		System.out.println("movieListView, sdate : "+sdate);
		System.out.println("movieListView, mcode : "+mcode);
				
		List<BookingDTO> movielist = bookingservice.selectMovieList(screenCode, sdate, mcode);
		
		// 좌석 잔여 개수 구하는 부분
		for(int i=0; i<movielist.size(); i++) {
			List<String> bookedSeat = bookingservice.selectBookedSeat(movielist.get(i).getTimeCode());
			String allSeat = bookingservice.selectAllSeat(screenCode);
			movielist.get(i).setRemainseat(String.valueOf(bookedSeat.size()));
			movielist.get(i).setAllseat(allSeat);
		}
		
		model.addAttribute("movielist", movielist);
		return ResponseEntity.ok(movielist);
	}
	String tag ="";
	@RequestMapping("/seatCreate.do")
	public ResponseEntity<Integer> seatCreate(String screenCode, String timeCode, String mcode, Model model) {
		System.out.println("seatView.do, screenCode : " + screenCode);
		ScreenDTO seatdto = bookingservice.selectSeatType(screenCode);
		List<String> bookedSeat = bookingservice.selectBookedSeat(timeCode);
		tag ="";
		String str = seatdto.getSeatTag();
//		FileReader fr;
//		try {
//			fr = new FileReader(seatType + ".txt");
//			BufferedReader br = new BufferedReader(fr);
//			while(true) {
//				String t = br.readLine();
//				if(t == null) break;
//				str += t;
//			}
//		} catch (FileNotFoundException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		System.out.println(str);
		tag = "<input type='hidden' name='screenCode' value='"+screenCode+"'>"
				+ "<input type='hidden' name='timeCode' value='"+timeCode+"'>"
				+ "<input type='hidden' name='mcode' value='"+mcode+"'>"
				+ "<input type='hidden' name='price' value='0'>";
		str = str.replace("/", "<div class='empty'></div>");
		str = str.replace("^", "<br>");
		int seat = 1;
		
		while(str.contains("*")) {
			if(bookedSeat.contains(String.valueOf(seat))) {
				str = str.replaceFirst("\\*", "<input type='button' value='" + seat + "' class='seat' disabled >");
			}else {
				str = str.replaceFirst("\\*", "<input type='button' value='" + seat + "' class='seat'>");
			}
			seat++;
		}
		
		tag += str;
		System.out.println(tag);
		return ResponseEntity.ok(1);
	}
	
	@RequestMapping("/seatView.do")
	public String seatView(Model model) {
		model.addAttribute("tag", tag);
		model.addAttribute("title", "인원/좌석 선택 :: Hello Movie Cinema");
		model.addAttribute("page", "es/seatView.jsp");
		return "main_index";
	}
	
	@RequestMapping("/booking.do")
	public ResponseEntity<Integer> booking(String[] seatList, String id) {
		String screenCode = seatList[0];
		String timeCode = seatList[1];
		String mcode = seatList[2];
		int totalPrice = Integer.parseInt(seatList[3]);
		String data = "";
		
		// seat 데이터 확인부
		for(int i=4;i<seatList.length;i++) {
			data += seatList[i] + ", ";
		}
		System.out.println("booking.do, seatList : " + data);
		
		// 데이터 임시 설정
		id = "test"; 
//		totalPrice = 10000;
		
		bookingservice.insertReservation(screenCode, timeCode, mcode, seatList, id, totalPrice);
		
		return ResponseEntity.ok(1);
	}
	
	@RequestMapping("/kakaopay.do")
	@ResponseBody
	public String kakaopay(String timeCode, String price, int count){
		try {
			BookingDTO dto = bookingservice.selectMovieTime(timeCode);
			String item_name = "영화 예매 - " + dto.getTitle();
			
			
			URL host = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection con = (HttpURLConnection) host.openConnection( );
			con.setRequestMethod("POST");
			con.setRequestProperty("Authorization", "KakaoAK 7c80bdaf6195fbde0c8f9cb6da9451e1");
			con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			con.setDoOutput(true);
			
			System.out.println("item_name : " + item_name + "count : " + count + "price : " + price);
			
			String item = URLEncoder.encode(item_name, "UTF-8");
			String bookingCode = bookingservice.selectBookingCode();
			String param = "cid=TC0ONETIME&partner_order_id=order_id"
					+ "&partner_user_id=user_id&item_name=" + item
					+ "&quantity=" + String.valueOf(count)
					+ "&total_amount=" + price + "&tax_free_amount=" + price
					+ "&approval_url=http://15.165.77.144:8080/approval.do?bookingCode=" + bookingCode
					+ "&cancel_url=http://15.165.77.144:8080/cancel.do&fail_url=http://15.165.77.144:8080/cancel.do";
			
			OutputStream os = con.getOutputStream();
			DataOutputStream dos = new DataOutputStream(os);
			String p = URLEncoder.encode(param, "UTF-8");
			dos.writeBytes(param);
			dos.close();
			
			int result = con.getResponseCode();
			
			InputStream is;
			// 정상 통신 = 200 코드
			if(result == 200) {
				is = con.getInputStream();
			}else {
				is = con.getErrorStream();
			}
			
			InputStreamReader isr = new InputStreamReader(is, "UTF-8");
			BufferedReader br = new BufferedReader(isr);
			return br.readLine();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "result";
		
	}
   
	@RequestMapping("/approval.do")
	public void approval(String bookingCode, Model model, HttpServletResponse response) {
		// kakaopay 성공 시 진입
		System.out.println("approval 진입, bookingCode : " + bookingCode);
		
		try {
			response.getWriter().write("<script>opener.document.location.href='parchaseResult.do?bookingCode="+ "12" +"'; window.close(); </script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
		
	}
	
	@RequestMapping("/cancel.do")
	public void cancel(Model model, HttpServletResponse response) {
		// kakaopay 실패/취소 시 진입
		System.out.println("cancel 진입");
		
		try {
			response.getWriter().write("<script>opener.document.location.href='parchaseFail.do'; window.close(); </script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("/parchaseResult.do")
	public String purchaseResult(String bookingCode, Model model) throws ParseException {
		System.out.println("purchaseResult 진입, bookingCode : " + bookingCode);
		List<BookingDTO> list = bookingservice.selectBookingResult(bookingCode);
		
		// 날짜 형태 변환부 ----년 --월 --일
		String strDate = list.get(0).getMovieDate().substring(0, 10);
		SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat newDtFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
		Date formatDate = dtFormat.parse(strDate);
		String strNewDtFormat = newDtFormat.format(formatDate);
		list.get(0).setMovieDate(strNewDtFormat);
		
		System.out.println("result 부 날짜 형태 : " + list.get(0).getMovieDate());
		model.addAttribute("resultlist", list);
		model.addAttribute("title", "결제 성공 :: Hello Movie Cinema");
		model.addAttribute("page", "es/purchaseResult.jsp");
		return "main_index";
	}
	
	@RequestMapping("/parchaseFail.do")
	public String payfail(Model model, HttpServletResponse response) {
		
		model.addAttribute("title", "결제 실패 :: Hello Movie Cinema");
		model.addAttribute("page", "es/purchaseFail.jsp");
		return "main_index";
	}
	
	///////////////////// 관리자단 ////////////////////////////
	
	@RequestMapping("/cinemaManagementView.do")
	public String cinemaManagementView(@RequestParam(name = "pageNo",defaultValue = "1")int pageNo, Model model, String cinemacode, HttpSession session) {
		
		List<ScreenDTO> list = screenservice.adminselectScreenList(cinemacode, pageNo);
		for(int i=0;i<list.size();i++) {
			int n = screenservice.selectAllSeat(list.get(i).getScreenCode());
			list.get(i).setAllseat(n);
		}
		
		//페이징 처리
		int count = screenservice.selectAllCount(cinemacode);
		PaggingVO vo = new PaggingVO(count, pageNo, 5, 3);
		model.addAttribute("pagging", vo);
		model.addAttribute("pageNo", pageNo);
		
		ScreenDTO dto = screenservice.selectCinemaInfo(cinemacode);
		
		session.setAttribute("name", dto.getCinemaName());
		model.addAttribute("dto", dto);
		model.addAttribute("list", list);
		model.addAttribute("title", "지점 관리 :: Hello Movie Cinema");
		model.addAttribute("page", "es/cinemaManagementView.jsp");
		
		return "admin_index";
	}
	
	
	
	@RequestMapping("/cinemaInsertView.do")
	public String cinemaInsertView(Model model) {
				
		model.addAttribute("title", "지점 추가 하기 :: Hello Movie Cinema");
		model.addAttribute("page", "es/cinemaInsertView.jsp");
		
		return "admin_index";
	}
	
	@RequestMapping("/cinemaUpdate.do")
	public void cinemaUpdate(ScreenDTO dto, HttpServletResponse response, HttpServletRequest request) 
			throws IOException {
		
		int result = screenservice.updateCinema(dto);
		response.setContentType("text/html;charset=utf-8");
		if(result == 1)
			response.getWriter().write(
					"<script>alert('지점 수정이 완료되었습니다.');location.href='cinemaManagementView.do?cinemacode="+dto.getCinemaCode()+"';</script>");
		else
			response.getWriter().write(
					"<script>alert('지점 수정에 실패하였습니다.');</script>");
	}
	
	@RequestMapping("/cinemaInsert.do")
	public void cinemaInsert(ScreenDTO dto, HttpServletResponse response, HttpServletRequest request, HttpSession session) 
			throws IOException {
		
		int result = screenservice.insertCinema(dto);
		response.setContentType("text/html;charset=utf-8");
		
		// 지점 관리 리스트의 리스트 최신화
		List<CinemaDTO> Cinemalist = movieservice.selectCinemaList();
		session.setAttribute("Cinemalist", Cinemalist);
		
		if(result == 1)
			response.getWriter().write(
					"<script>alert('지점 등록이 완료되었습니다, 지점 관리 페이지로 이동합니다');location.href='cinemaManagementView.do?cinemacode="+dto.getCinemaCode()+"';</script>");
		else
			response.getWriter().write(
					"<script>alert('지점 등록에 실패하였습니다.');</script>");
	}
	
	@RequestMapping("/cinemaDelete.do")
	public void cinemaDelete(String cinemacode, HttpServletResponse response, HttpServletRequest request, HttpSession session) 
			throws IOException {
		
		int result = screenservice.deleteCinema(cinemacode);
		response.setContentType("text/html;charset=utf-8");
		
		// 지점 관리 리스트의 리스트 최신화
		List<CinemaDTO> Cinemalist = movieservice.selectCinemaList();
		session.setAttribute("Cinemalist", Cinemalist);
		
		if(result == 1)
			response.getWriter().write(
					"<script>alert('지점 삭제가 완료되었습니다');location.href='admin.do';</script>");
		else
			response.getWriter().write(
					"<script>alert('지점 삭제가 실패하였습니다.');</script>");
	}
	
	@RequestMapping("/screenInsertView.do")
	public String screenInsertView(String cinemacode, Model model) {
		
		//String seatType = bookingservice.selectSeatType(screencode);
		List<ScreenDTO> seatlist = screenservice.selectTypeList();
		
		model.addAttribute("seatlist", seatlist);
		model.addAttribute("cinemacode", cinemacode);
		model.addAttribute("title", "지점 극장 등록 :: Hello Movie Cinema");
		model.addAttribute("page", "es/screenInsertView.jsp");
		
		return "admin_index";
	}
	
	@RequestMapping("/screenInsert.do")
	public void screenInsert(ScreenDTO dto, HttpServletResponse response, HttpServletRequest request) 
			throws IOException {
		String seatcode = screenservice.selectSeatCode(dto.getSeatType());
		int seatcount = seatcode.split("\\*").length - 1;
		System.out.println("seatcount : " + seatcount);
		
		//	Screen 등록
		int result = screenservice.insertScreen(dto);
		
		//	Screen seat 등록
		for(int i=0;i<seatcount;i++) {
			int rs = screenservice.insertScreenSeat(dto.getScreenCode(), dto.getSeatType(), i+1);
		}
		
		response.setContentType("text/html;charset=utf-8");
		
		if(result == 1)
			response.getWriter().write(
					"<script>alert('극장 등록이 완료되었습니다, 지점 관리 페이지로 이동합니다');location.href='cinemaManagementView.do?cinemacode="+dto.getCinemaCode()+"';</script>");
		else
			response.getWriter().write(
					"<script>alert('극장 등록에 실패하였습니다.');</script>");
	}
	
	@RequestMapping("/screenDelete.do")
	public void screenDelete(String screencode, String cinemacode, HttpServletResponse response, HttpServletRequest request, HttpSession session) 
			throws IOException {
		
		int result = screenservice.deleteScreen(screencode);
		response.setContentType("text/html;charset=utf-8");
		
		// 지점 관리 리스트의 리스트 최신화
		List<CinemaDTO> Cinemalist = movieservice.selectCinemaList();
		session.setAttribute("Cinemalist", Cinemalist);
		
		if(result == 1)
			response.getWriter().write(
					"<script>alert('극장 삭제가 완료되었습니다');location.href='cinemaManagementView.do?cinemacode="+cinemacode+"';</script>");
		else
			response.getWriter().write(
					"<script>alert('극장 삭제가 실패하였습니다.');</script>");
	}
	
	@RequestMapping("/screenScheduleView.do")
	public String screenScheduleView(String screenCode, Model model) {
		
		List<ScreenDTO> timelist = screenservice.selectScreenSchedule(screenCode);
		
		for(int i=0;i<timelist.size();i++) {
			timelist.get(i).setMovieDate(timelist.get(i).getMovieDate().substring(0, 10));
		}
		
		List<ScreenDTO> screenlist = screenservice.selectScreenMovie(screenCode);
		
		model.addAttribute("timelist", timelist);
		model.addAttribute("screenlist", screenlist);
		model.addAttribute("title", "극장 상영작 관리 :: Hello Movie Cinema");
		model.addAttribute("page", "es/screenScheduleView.jsp");
		
		return "admin_index";
	}
	
	@RequestMapping("/updateSchedule.do")
	public void updateSchedule(ScreenDTO dto, HttpServletResponse response, HttpServletRequest request) 
			throws IOException {
		
		int result = screenservice.updateSchedule(dto);
		response.setContentType("text/html;charset=utf-8");
		if(result == 1)
			response.getWriter().write(
					"<script>alert('상영 일정 수정이 완료되었습니다.');location.href='screenScheduleView.do?screenCode="+dto.getScreenCode()+"';</script>");
		else
			response.getWriter().write(
					"<script>alert('상영 일정 수정에 실패하였습니다.');</script>");
	}
	
	@RequestMapping("/screenSchedulePlus.do")
	public void screenSchedulePlus(ScreenDTO dto, HttpServletResponse response, HttpServletRequest request) 
			throws IOException {
		
		String arr[] = dto.getMcode().split(",");
		dto.setMcode(arr[0]);
		System.out.println(dto);
		int result = screenservice.insertScreenSchedule(dto);
		
		response.setContentType("text/html;charset=utf-8");
		
		if(result == 1)
			response.getWriter().write(
					"<script>alert('극장 상영 일정 등록이 완료되었습니다, 지점 관리 페이지로 이동합니다');location.href='screenScheduleView.do?screenCode="+dto.getScreenCode()+"';</script>");
		else
			response.getWriter().write(
					"<script>alert('극장 상영 일정 등록에 실패하였습니다.');</script>");
	}
	
	@RequestMapping("/seatTypeCreateView.do")
	public String seatTypeCreateView(Model model) {
		
		List<ScreenDTO> seatlist = screenservice.selectAllSeatType();
		
		for(int i=0;i<seatlist.size();i++) {
			String str = seatlist.get(i).getSeatTag();
			str = str.replace("/", "<div class='empty'></div>");
			str = str.replace("^", "<br>");
			str = str.replace("*", "<input type='button' class='seat'>");
			seatlist.get(i).setSeatTag(str);
		}
		
		model.addAttribute("seatlist", seatlist);
		model.addAttribute("title", "좌석 타입 관리 :: Hello Movie Cinema");
		model.addAttribute("page", "es/seatTypeCreateView.jsp");
		
		return "admin_index";
	}
	
	@RequestMapping("/insertSeatType.do")
	public void insertSeatType(String seatTag, String seatType, HttpServletResponse response, HttpServletRequest request) 
			throws IOException {
		System.out.println("old tag: " + seatTag);
		
		seatTag = seatTag.replace("<div class='empty'></div>", "/");
		seatTag = seatTag.replace("<br>", "^");
		seatTag = seatTag.replace("<input type='button' class='seat'>", "*");
		System.out.println("new tag: " + seatTag);
		int result = screenservice.insertSeatType(seatType, seatTag);
		
		response.setContentType("text/html;charset=utf-8");
		
		if(result == 1)
			response.getWriter().write(
					"<script>alert('좌석 타입 등록이 완료되었습니다, 지점 관리 페이지로 이동합니다');location.href='seatTypeCreateView.do';</script>");
		else
			response.getWriter().write(
					"<script>alert('좌석 타입 등록에 실패하였습니다.');</script>");
	}
	
	@RequestMapping("/deleteSeatType.do")
	public void deleteSeatType(String seatType, HttpServletResponse response, HttpServletRequest request) 
			throws IOException {
		
		String arr[] = seatType.split(",");
		
		int result = screenservice.deleteSeatType(arr[0]);
		
		response.setContentType("text/html;charset=utf-8");
		
		if(result == 1)
			response.getWriter().write(
					"<script>alert('좌석 타입 삭제가 완료되었습니다');location.href='seatTypeCreateView.do';</script>");
		else
			response.getWriter().write(
					"<script>alert('좌석 타입 삭제가 실패하였습니다.');</script>");
	}
	/*--------------------------------------------------------------------------------------------------*/
}