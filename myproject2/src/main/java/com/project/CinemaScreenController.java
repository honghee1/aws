package com.project;


import java.io.IOException;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.Service.BookingService;
import com.project.Service.ScreenService;
import com.project.Service.movieService;
import com.project.dto.CinemaDTO;
import com.project.dto.MovieDTO;
import com.project.dto.ScreenDTO;
import com.project.vo.Criteria;
import com.project.vo.PageMaker;
import com.project.vo.PaggingVO;

@Controller
public class CinemaScreenController {
	
	private movieService movieservice;
	private ScreenService screenservice;
	
	public CinemaScreenController(movieService movieservice, 
			 ScreenService screenservice, BookingService bookingservice) {
		super();
		this.movieservice = movieservice;
		this.screenservice = screenservice;
	}

	@RequestMapping("/cinemaManagementView.do")
	public String cinemaManagementView(Criteria cri, Model model, String cinemacode, HttpSession session) {
		
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(screenservice.selectAllCount(cinemacode));
		
		List<ScreenDTO> list = screenservice.adminselectScreenList(cinemacode, cri);
		for(int i=0;i<list.size();i++) {
			int n = screenservice.selectAllSeat(list.get(i).getScreenCode());
			list.get(i).setAllseat(n);
		}
		
		//페이징 처리
		ScreenDTO dto = screenservice.selectCinemaInfo(cinemacode);
		 model.addAttribute("pageMaker", pageMaker);
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
		
		/*
		 * // 지점 관리 리스트의 리스트 최신화 List<CinemaDTO> Cinemalist =
		 * movieservice.selectCinemaList(); session.setAttribute("Cinemalist",
		 * Cinemalist);
		 */
		
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
		System.out.println(dto);
		String seatcode = screenservice.selectSeatCode(dto.getSeatType());
		int seatcount = seatcode.split("\\*").length - 1;
		System.out.println("seatcount : " + seatcount);
		
		//	Screen 등록
		int result = screenservice.insertScreen(dto);
		
		/*
		 * // Screen seat 등록 for(int i=0;i<seatcount;i++) { int rs =
		 * screenservice.insertScreenSeat(dto.getScreenCode(), dto.getSeatType(), i+1);
		 * }
		 */
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
		
		List<ScreenDTO> screenlist = screenservice.selectMovieSchedule();
		System.out.println(screenlist);
		model.addAttribute("timelist", timelist);
		model.addAttribute("screenCode", screenCode);
		model.addAttribute("screenlist", screenlist);
		model.addAttribute("title", "극장 상영작 관리 :: Hello Movie Cinema");
		model.addAttribute("page", "es/screenScheduleView.jsp");
		
		return "admin_index";
	}
	
	@RequestMapping("/updateSchedule.do")
	public void updateSchedule(ScreenDTO dto, HttpServletResponse response, HttpServletRequest request,String screenCode) 
			throws IOException {
		System.out.println(dto);
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
	public void screenSchedulePlus(String screenCode,ScreenDTO dto, HttpServletResponse response, HttpServletRequest request) 
			throws IOException {
		String arr[] = dto.getMcode().split(",");
		dto.setMcode(arr[0]);
		
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
	
	
	
	
}
