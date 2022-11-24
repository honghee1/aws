package com.project;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.Service.movieService;
import com.project.dto.CinemaDTO;
import com.project.dto.FileDTO;
import com.project.dto.MovieDTO;
import com.project.dto.NaverRatingDTO;
import com.project.dto.ScreenMovieDTO;
import com.project.vo.Criteria;
import com.project.vo.PageMaker;

@Controller
public class MovieController {
	
	private movieService movieservice;

	public MovieController(movieService movieservice) {
		super();
		this.movieservice = movieservice;
	}
	
	
	@RequestMapping("/moviesingle.do")
	public String moviesingle(Model model,String mcode) {
		List<FileDTO> Filelist = movieservice.selectFilePath(mcode);
		System.out.println(mcode);
		MovieDTO moviedto= movieservice.selectMovieDTO(mcode); 
		NaverRatingDTO ndto = null;
		try {
		    ndto = movieservice.selectNaverRating(mcode);
		}catch (NullPointerException e) {
			ndto.setUser_rating("평점 준비중입니다.");
		}
		System.out.println("123"+ndto);
		System.out.println(moviedto);
		model.addAttribute("moviedto", moviedto);
		model.addAttribute("ndto", ndto);
		model.addAttribute("Filelist", Filelist);
		model.addAttribute("page", "hh/moviesingle.jsp");
		return "main_index";
	}
	
	@RequestMapping("/NowShowingMovieList.do")
	public String moviegrid(Model model,Criteria cri) {
		 	PageMaker pageMaker = new PageMaker();
		    pageMaker.setCri(cri);
		    pageMaker.setTotalCount(movieservice.countNowShowingMovieListTotal());
		    List<MovieDTO> NowShowingMovieList = movieservice.selectNowShowingMovieList(cri);
		    for(MovieDTO i : NowShowingMovieList) {
		    	try {
				 i.setUser_rating(movieservice.selectNaverRating(i.getMcode()).getUser_rating());
		    	}catch (NullPointerException e) {
						i.setUser_rating("평점 준비중입니다.");
					}
			}
		    model.addAttribute("NowShowingMovieList", NowShowingMovieList);
		    model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("page", "hh/NowShowingMovieList.jsp");
		return "main_index";
	}
	@RequestMapping("/ComingSoonMovieList.do")
	public String ComingSoonMovieList(Model model,Criteria cri) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(movieservice.countComingSoonMovieListTotal());
		List<MovieDTO> NowShowingMovieList = movieservice.selectComingSoonMovieListList(cri);
		for(MovieDTO i : NowShowingMovieList) {
			System.out.println("asd");
			try {
			i.setUser_rating(movieservice.selectNaverRating(i.getMcode()).getUser_rating());
			}catch (NullPointerException e) {
				i.setUser_rating("평점 준비중입니다.");
			}
		}
		
		model.addAttribute("NowShowingMovieList", NowShowingMovieList);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("page", "hh/NowShowingMovieList.jsp");
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
		session.setAttribute("cinemacode", cinemacode);
		session.setAttribute("name", name);
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

	@RequestMapping("/insertMovie_pop_list2.do")
	public String insertMovie_pop_list2(Model model,HttpServletResponse response, MovieDTO dto,String tag) {
		System.out.println("asd123asd5"+tag);
		model.addAttribute("tag", tag);
		return "insertMovie_pop_list2";
	}
	
	@RequestMapping("/insertMovie_pop.do")
	public String insertMovie_pop(Model model,HttpServletResponse response, MovieDTO dto,String tag) {
		System.out.println(tag);
		model.addAttribute("tag", tag);
		return "insertMovie_pop";
	}
	
	@RequestMapping("/uploadmovie.do")
	public String uploadmovie(Model model, MovieDTO dto, ScreenMovieDTO scdto, MultipartHttpServletRequest request,
			String close, String update, int[] newfileindex, int[] oldfile,NaverRatingDTO ndto) {
		if(scdto.getStartdate().length()==0) {
			scdto.setStartdate("0000-00-00");
		}
		if(scdto.getEnddate().length()==0) {
			scdto.setEnddate("0000-00-00");
		}
		dto.setTrailer(dto.getTrailer().substring(dto.getTrailer().lastIndexOf("/")+1));
		System.out.println(dto.getTrailer().substring(dto.getTrailer().lastIndexOf("/")+1));
		if (update != null) {
			dto.setMcode(update);
			scdto.setmcode(update);
			ndto.setmcode(update);
			movieservice.updateMovie(dto, scdto,ndto);
			
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
			String mcode = movieservice.insertMovie(dto, scdto,ndto);
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
	
	@RequestMapping("/UpdateMovie.do")
	public String UpdateMovie(Model model, MovieDTO dto, ScreenMovieDTO scdto, MultipartHttpServletRequest request,
			 int[] newfileindex, int[] oldfile,NaverRatingDTO ndto){
		if(scdto.getStartdate().length()==0) {
			scdto.setStartdate("0000-00-00");
		}
		if(scdto.getEnddate().length()==0) {
			scdto.setEnddate("0000-00-00");
		}
		dto.setTrailer(dto.getTrailer().substring(dto.getTrailer().lastIndexOf("/")+1));
		System.out.println(dto);
		System.out.println(scdto);
		System.out.println(ndto);
		movieservice.updateMovie(dto, scdto,ndto);
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
		
			List<MovieDTO> list = movieservice.selectAllMovieList();
			model.addAttribute("list", list);
			return "redirect:/select_all_movielist.do";
		
		
	}
	
	@RequestMapping("/movieView.do")
	public String movieView(String mcode, String update, Model model, HttpSession session) {
		MovieDTO dto = movieservice.selectMovieDTO(mcode);
		List<FileDTO> Filelist = movieservice.selectFilePath(mcode);
		ScreenMovieDTO scdto = movieservice.selectMovieSchedule(mcode);
		NaverRatingDTO ndto = null;
		try {
			    ndto = movieservice.selectNaverRating(mcode);
			}catch (NullPointerException e) {
				ndto.setUser_rating("평점 준비중입니다.");
			}
		model.addAttribute("movie", dto);
		model.addAttribute("naver_rating", ndto);
		model.addAttribute("Filepath", Filelist);
		model.addAttribute("scdto", scdto);
		model.addAttribute("page", "hh/select_movie_detail_view.jsp");

		return "admin_index";
	}
	
	@RequestMapping("/insert_movie.do")
	public String insertMovie(HttpSession session, HttpServletResponse response, Model model, MovieDTO mdto,
			String cinemacode, String name,String genre,String close,String prodYear) {
		JSONObject userrating = APIExamTranslateNMT(mdto.getTitle(),prodYear);
		session.setAttribute("cinemacode", cinemacode);
		session.setAttribute("name", name);
		model.addAttribute("movie", mdto);
		model.addAttribute("userrating", userrating);
		model.addAttribute("prodYear", prodYear);
		model.addAttribute("title", "영화 등록 :: Hello Movie Cinema");
		model.addAttribute("page", "hh/insert_movie.jsp");
		model.addAttribute("pagetitle", "영화 등록 페이지");
		return "admin_index";
	}
	@RequestMapping("/insertmovie.do")
	public String insert_Movie(HttpSession session, HttpServletResponse response, Model model, MovieDTO mdto,
			String cinemacode, String name,String genre,String close) {
		session.setAttribute("cinemacode", cinemacode);
		session.setAttribute("name", name);
		model.addAttribute("mdto", mdto);
		model.addAttribute("page", "hh/insert_movie.jsp");
		model.addAttribute("pagetitle", "영화 등록 페이지");
		return "admin_index";
	}
	
	@RequestMapping("/naver.do")
	public ResponseEntity<String> test(String title,String prodYear,Model model) {
		if(prodYear==null) {
			prodYear="";
		}
		JSONObject userrating = APIExamTranslateNMT(title,prodYear);
		String str = userrating.toString();
		return ResponseEntity.ok(str);
	}
	@RequestMapping("/Naver_API_List.do")
	public ResponseEntity<String> test1(Model model,@RequestBody String param){
		
		return ResponseEntity.ok(param);
	}
	public JSONObject APIExamTranslateNMT(String title,String prodYear) {
		if(title != null) {
		String clientId = "GV9zoyHoPYvom8CtrVnd"; //애플리케이션 클라이언트 아이디
        String clientSecret = "EPVwdRTl5I"; //애플리케이션 클라이언트 시크릿
        String Movietitle = title;
        String MovieprodYear = prodYear;
        try {
        	Movietitle = URLEncoder.encode(title, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }
        String apiURL = "https://openapi.naver.com/v1/search/movie.json?query="+Movietitle+"&yearfrom="+MovieprodYear+"&yearto="+MovieprodYear;    // JSON 결과
        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL,requestHeaders);
        JSONObject jObject = new JSONObject(responseBody);
		return jObject;
		}else {
			return null;
		}
	}
	private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }


            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 오류 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }
	private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);


        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();


            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }


            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는 데 실패했습니다.", e);
        }
    }
	private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }

}
