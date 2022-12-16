package com.project;

import java.util.stream.Collectors;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	
	
	
	
	
	
	
	
	@RequestMapping("/admin/index")
	public String main(Authentication authentication,Model model) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		System.out.println("username = " + userDetails.getUsername());
		System.out.println("role = "
				+ userDetails.getAuthorities().stream().map(r -> String.valueOf(r)).collect(Collectors.joining(",")));
		model.addAttribute("adminId", userDetails.getUsername());
		return "admin/index";
	}
	
	@RequestMapping("/")
	public String index(Model model) {
		model.addAttribute("page", "main_body.jsp");
		return "helloMovie/main";
	}
	
}
