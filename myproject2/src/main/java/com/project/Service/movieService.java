package com.project.Service;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.project.dto.CinemaDTO;
import com.project.dto.FileDTO;
import com.project.dto.MovieDTO;
import com.project.dto.NaverRatingDTO;
import com.project.dto.ScreenDTO;
import com.project.dto.ScreenMovieDTO;
import com.project.mapper.MovieMapper;
import com.project.vo.Criteria;

@Service
public class movieService {

	private MovieMapper mapper;

	public movieService(MovieMapper mapper) {
		this.mapper = mapper;
	}

	public String insertMovie(MovieDTO dto, ScreenMovieDTO scdto,NaverRatingDTO ndto) {
		String mcode = mapper.selectMovieCode();
		dto.setMcode(mcode);
		scdto.setmcode(mcode);
		ndto.setMCODE(mcode);
		mapper.insertMovie(dto);
		if (scdto.getStartdate() == null) {
			scdto.setStartdate("");
		}
		if (scdto.getEnddate() == null) {
			scdto.setEnddate("");
		}
		mapper.insertMovieSchedule(scdto);
		if(ndto.getNaver_mtitle()!=null) {
			try {
		mapper.insertNaverRating(ndto);
			}catch (Exception e) {
				System.out.println("중복된 값입니다");
				return mcode; 
			}
		}
		return mcode;
	}

	public int insertFileList(FileDTO fileDTO) {
		return mapper.insertFileList(fileDTO);
	}

	public List<MovieDTO> selectAllMovieList() {
		return mapper.selectAllMovieList();
	}

	public MovieDTO selectMovieDTO(String mcode) {
		return mapper.selectMovieDTO(mcode);
	}

	public int deleteMovie(String[] index) {
		int count = 0;
		for (int i = 0; i < index.length; i++) {
			String str = index[i];
			count += mapper.deleteMovie(str);
		}
		return count;
	}

	public List<CinemaDTO> selectCinemaList() {
		return mapper.selectAllCinema();
	}

	public List<ScreenDTO> selectScreenList(String cinemacode) {
		return mapper.selectScreenList(cinemacode);
	}

	public List<FileDTO> selectFilePath(String mcode) {
		return mapper.selectFilePath(mcode);
	}

	public String selectFile(String mcode, int fno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mcode", mcode);
		map.put("fno", fno);
		return mapper.selectFile(map);
	}

	public String selectImageFile(int fno) {
		return mapper.selectImageFile(fno);
	}

	public List<ScreenMovieDTO> selectSYSDATEScreenMovie() {
		return mapper.selectSYSDATEScreenMovie();
	}

	public String updateMovie(MovieDTO dto, ScreenMovieDTO scdto,NaverRatingDTO ndto) {
		String mcode = mapper.selectMovieCode();
		mapper.updateMovie(dto);
		mapper.updateMovieSchedule(scdto);
		mapper.updateNaverRating(ndto);
		return mcode;
	}


	public List<MovieDTO> selectNowshowingMovieList() {
		return mapper.NowshowingMovieList();
	}

	public List<MovieDTO> selectComingSoonMovieList() {
		return mapper.ComingSoonMovieList();
	}

	public List<MovieDTO> NowshowingMovieList() {
		return mapper.NowshowingMovieList();
	}

	public int updateFileList(FileDTO fileDTO) {
		return mapper.updateFileList(fileDTO);
		
	}
	public int deleteFileList(String mcode, int i) {
		FileDTO dto = new FileDTO();
		dto.setFno(i);
		dto.setmcode(mcode);
		return mapper.deleteFileList(dto);
		
	}

	public NaverRatingDTO selectNaverRating(String mcode) {
		return mapper.selectNaverRating(mcode);
	}

	
	public List<MovieDTO> selectNowShowingMovieList(Criteria cri) {
		return mapper.selectNowShowingMovieList(cri);
	}

	public int countNowShowingMovieListTotal() {
		return mapper.countNowShowingMovieListTotal();
	}

	public int countComingSoonMovieListTotal() {
		return mapper.countComingSoonMovieListTotal();
	}

	public List<MovieDTO> selectComingSoonMovieListList(Criteria cri) {
		return mapper.selectComingSoonMovieListList(cri);
	}

	public ScreenMovieDTO selectMovieSchedule(String mcode) {
		return mapper.selectMovieSchedule(mcode);
	}

	public List<MovieDTO> selectAllMovieSchedule() {
		return mapper.selectAllMovieSchedule();
	}
	
	

}
