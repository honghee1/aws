package com.project;


import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.Service.MemberService;
import com.project.dto.MemberDTO;

@Controller
public class MemberController {

	private MemberService memberService;

	public MemberController(MemberService memberService) {
		super();
		this.memberService = memberService;
	}

	
	/* login_form.html 템플릿을 렌더링하는 GET방식의 login 메서드추가 */
	@RequestMapping("/admin/login")
	public String AdminLogin() {
		return "admin/login_form";
	}
	@RequestMapping("/admin/admin_list")
	public String selectAllAdminList(Model model) {
		
		List<MemberDTO> alist = memberService.selectAllAdmin();
		System.out.println(alist);
		model.addAttribute("alist", alist);
		model.addAttribute("title", "관리자 페이지 :: Hello Movie Cinema");
		model.addAttribute("page", "admin_list.jsp");
		return "admin/index";
	}

	
	@RequestMapping("/helloMovie/signup.do")
	public String signup(MemberDTO _dto,String userPasswdchk,BindingResult bindingResult,Model model, String id, String email, String address1, String address2, String address3) {
		@Valid MemberDTO dto = new MemberDTO();
		System.out.println("asd123asd");
		String userEmail = id + email;
		String address = address1 + "/" + address2 + "/" + address3;
		dto = _dto;
		dto.setUserEmail(userEmail);
		dto.setAddress(address);
		if(bindingResult.hasErrors()){
	    	System.out.println(bindingResult);
			model.addAttribute("page", "main_body.jsp");
			return "helloMovie/main";
        }
        if(!dto.getUserPasswd().equals(userPasswdchk)){
        	System.out.println(bindingResult);
            bindingResult.rejectValue("password2", "passwordInCorrect",
                    "2개의 패스워드가 일치하지 않습니다");
            model.addAttribute("page", "main_body.jsp");
    		return "helloMovie/main";
        }
		System.out.println("asd123asd");
		model.addAttribute("page", "main_body.jsp");
		return "helloMovie/main";
	}
	
	
	@RequestMapping("/helloMovie/signup")
	public String signuppage(Model model) {
		model.addAttribute("page", "signup_form.jsp");
		return "helloMovie/main";
	}


}
