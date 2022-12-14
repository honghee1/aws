package com.project;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.Service.MemberService;
import com.project.Service.NaverAPI;
import com.project.Service.QnAService;
import com.project.Service.kakaoAPI;
import com.project.Service.movieService;
import com.project.dto.AdminDTO;
import com.project.dto.CinemaDTO;
import com.project.dto.MemberDTO;
import com.project.dto.QnADTO;
import com.project.vo.Criteria;
import com.project.vo.PageMaker;



@Controller
public class MemberController {
	
	private movieService movieservice;
	private MemberService service;
	private QnAService qnaservice;
	private kakaoAPI kakaoAPI;
	private NaverAPI naverAPI;
	
	public MemberController(movieService movieservice, MemberService service, QnAService qnaservice,
			com.project.Service.kakaoAPI kakaoAPI,
			com.project.Service.NaverAPI naverAPI) {
		super();
		this.movieservice = movieservice;
		this.service = service;
		this.qnaservice = qnaservice;
		this.kakaoAPI = kakaoAPI;
		this.naverAPI = naverAPI;
	}
	
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
        //    ?????????????????? ???????????? ????????? ??? ????????? ?????? ???????????? ?????? ??????
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
//	            session.removeAttribute("access_Token");
//	            session.removeAttribute("userId");
	            session.invalidate();
	        }else{
	            System.out.println("access_Token is null");
	            return "redirect:/";
	        }
	        return "main_index";
	        
	    }
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
			response.getWriter().write("<script>alert('"+dto.getUserName()+"??? ???????????????.');location.href='main.do';</script>");
//			return "main_index";
		} else {
			session.setAttribute("login", false);
			response.getWriter().write("<script>alert('???????????? ??????????????? ???????????????');location.href='main.do';</script>");
//			return "main_index";
		}
	}
	
	
	@RequestMapping("/memberlogout.do")
	public void memberlogout(HttpSession session, Model model, HttpServletResponse response) throws IOException {
		session.invalidate();
		model.addAttribute("page", "main_body.jsp");
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write("<script>alert('??????????????? ??????????????? ?????????????????????');location.href='main.do';</script>");
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
		System.out.println("1a2sd1a2sd1a2s32"+dto);
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
		List<MemberDTO> list = service.selectUserPasswd(userEmail, userName, userTel);
		if(list.size() > -1) {
			list = service.selectUserPasswd(userEmail, userName, userTel);
		}
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
		model.addAttribute("title", "?????? ?????? ?????? :: Hello Movie Cinema");
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
	public String memberProfile(String userEmail, Model model,Criteria cri) {
		MemberDTO dto = service.selectMemberProfile(userEmail);
		String[] arr = dto.getAddress().split("/");
		System.out.println(userEmail);
		
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(qnaservice.countQna(userEmail));
	    List<QnADTO> qna = qnaservice.selectQna(userEmail,cri);
		
		
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("qna", qna);
		model.addAttribute("dto", dto);
		model.addAttribute("address1", arr[0]);
		model.addAttribute("address2", arr[1]);
		model.addAttribute("address3", arr[2]);
		model.addAttribute("title", "?????? ?????? ?????? :: Hello Movie Cinema");
		model.addAttribute("page", "dh/member_profile.jsp");
		return "admin_index";
	}
	
	@RequestMapping("/memberUpdate.do")
	public void memberUpdate(MemberDTO dto, String address1, String address2, String address3, HttpServletResponse response) throws IOException {
		System.out.println("---------------------"+dto.toString());
		String address = address1 + "/" + address2 + "/" + address3;
		dto.setAddress(address);
		int result = service.adminMemberUpdate(dto);
		response.setContentType("text/html;charset=utf-8");
		if(result == 1)
			response.getWriter().write(
					"<script>alert('????????? ?????????????????????.');location.href='memberProfile.do?userEmail="+dto.getUserEmail()+"';</script>");
		else
			response.getWriter().write(
					"<script>alert('????????? ?????????????????????.');</script>");
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
	public void updateQnaResponse(QnADTO dto, int qno, String qnaTitle, String response, String userEmail,HttpServletResponse script) throws IOException {
		int result = qnaservice.updateQnaResponse(qno, response);
		System.out.println(dto);
		System.out.println(userEmail+"a12sd35");
		script.setContentType("text/html;charset=utf-8");
		if(result == 1)
			script.getWriter().write(
					"<script>alert('????????? ?????????????????????.');location.href='memberProfile.do?userEmail="+dto.getuserEmail()+"';</script>");
		else
			script.getWriter().write(
					"<script>alert('??????????????? ?????????????????????.');</script>");
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
		model.addAttribute("title", "?????? ?????? ?????? :: Hello Movie Cinema");
		model.addAttribute("page", "dh/all_qna_view.jsp");
		return "admin_index";
	}
	
	@RequestMapping("/adminView.do")
	public String adminView(Model model) {
		List<AdminDTO> alist = service.selectAdminView();
		model.addAttribute("alist", alist);
		model.addAttribute("title", "????????? ????????? :: Hello Movie Cinema");
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
	
	@RequestMapping("/adminLogin.do")
	public void adminMain(@Valid  AdminDTO adto, Errors errors, HttpSession session, Model model, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		System.out.println("2");
		System.out.println(adto.getAdminId());
		if(errors.hasErrors()) {
			 Map<String, String> validatorResult = new HashMap<>();
			System.out.println("1");
			session.setAttribute("login", false);
			 for (FieldError error : errors.getFieldErrors()) {
		            String validKeyName = String.format("valid_%s", error.getField());
		            validatorResult.put(validKeyName, error.getDefaultMessage());
		            response.getWriter().write("<script>alert('"+error.getDefaultMessage()+"');location.href='/';</script>");
		        }
		}
		adto = service.adminLogin(adto.getAdminId(), adto.getAdminPasswd());
		model.addAttribute("page", "main_body.jsp");
		if(adto != null) {
			session.setAttribute("adminlogin", true);
			session.setAttribute("adto", adto);
			session.setAttribute("adminId", adto.getAdminId());
			session.setAttribute("grade", adto.getGrade());
			response.getWriter().write("<script>alert('????????? ???????????????.');location.href='admin.do';</script>");
		} else {
			session.setAttribute("login", false);
			response.getWriter().write("<script>alert('???????????? ??????????????? ???????????????');location.href='/';</script>");
		}
	}
	
	@RequestMapping("/admin.do")
	public String admin(String cinemacode, String name, HttpSession session) {
		session.setAttribute("cinemacode", cinemacode);
		session.setAttribute("title", "?????? ????????? :: Hello Movie Cinema");
		session.setAttribute("name", name);
		return "admin_index";
	}
	
	@RequestMapping("/adminLogout.do")
	public void adminLogout(HttpSession session, HttpServletResponse response) throws IOException {
		session.removeAttribute("adminlogin");
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write("<script>alert('??????????????? ??????????????? ?????????????????????');location.href='/';</script>");
	}


}
