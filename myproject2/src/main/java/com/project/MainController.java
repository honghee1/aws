package com.project;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.project.Service.movieService;
import com.project.dto.MovieDTO;

@Controller
public class MainController {
	private movieService movieservice;
	
	public MainController(movieService movieservice) {
		super();
		this.movieservice = movieservice;
	}



	@RequestMapping("/")
	public String index() {
		return "admin-login";
	}
	
	@RequestMapping("/admin-mainpage.do")
	public String admin_mainpage(Model model) {
		return "admin-mainpage";
	}
	
	@RequestMapping("/main.do")
	public String blank(Model model, HttpServletResponse response) {
		List<MovieDTO> NowShowingMovielist = movieservice.selectNowshowingMovieList();
		System.out.println(NowShowingMovielist);
		for(MovieDTO i : NowShowingMovielist) {
			try {
			 i.setUser_rating(movieservice.selectNaverRating(i.getMcode()).getUser_rating(
			 ));
			}catch (NullPointerException e) {
				i.setUser_rating("평점 준비중입니다.");
			}
		}
		model.addAttribute("NowShowingMovielist", NowShowingMovielist);
		List<MovieDTO> ComingSoonMovieList = movieservice.selectComingSoonMovieList();
		model.addAttribute("page", "main_body.jsp");
		model.addAttribute("ComingSoonMovieList", ComingSoonMovieList);
		
		return "main_index";
	}
	
	
}