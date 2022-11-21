package com.project;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonParser;
import com.google.gson.JsonArray;
import com.project.Service.movieService;
import com.project.dto.CinemaDTO;
import com.project.dto.MovieDTO;

@Controller
public class MainController {
	private movieService movieservice;

	public MainController(movieService movieservice) {
		super();
		this.movieservice = movieservice;
	}

	@RequestMapping("/select_cinema_list.do")
	public ResponseEntity<String> select_cinema_list() {

		JSONObject obj = new JSONObject();
		List<CinemaDTO> cinemalist = movieservice.selectCinemaList();
        try {
            JSONArray jArray = new JSONArray();//배열이 필요할때
            int totalcinemacount = 0;
            for (int i = 0; i < cinemalist.size(); i++)//배열
            {
                JSONObject sObject = new JSONObject();//배열 내에 들어갈 json
                sObject.put("cinemacode", cinemalist.get(i).getCinemacode());
                sObject.put("cinemaname", cinemalist.get(i).getcinemaname());
                jArray.put(sObject);
                totalcinemacount++;
            }
            obj.put("totalCinemaCount", totalcinemacount);
            obj.put("id", "userID");
            obj.put("items", jArray);//배열을 넣음

            System.out.println(obj.toString());

        } catch (JSONException e) {
            e.printStackTrace();
        }
		return ResponseEntity.ok(obj.toString());
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
	public String blank(Model model, HttpServletResponse response, HttpSession session) {
		System.out.println(session.getAttribute("login"));
		System.out.println(session.getAttributeNames());
		List<MovieDTO> NowShowingMovielist = movieservice.selectNowshowingMovieList();
		System.out.println(NowShowingMovielist);
		for (MovieDTO i : NowShowingMovielist) {
			try {
				i.setUser_rating(movieservice.selectNaverRating(i.getMcode()).getUser_rating());
			} catch (NullPointerException e) {
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