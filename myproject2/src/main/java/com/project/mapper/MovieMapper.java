package com.project.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.CinemaDTO;
import com.project.dto.FileDTO;
import com.project.dto.MovieDTO;
import com.project.dto.NaverRatingDTO;
import com.project.dto.ScreenDTO;
import com.project.dto.ScreenMovieDTO;
import com.project.vo.Criteria;
@Mapper
public interface MovieMapper {
	String selectMovieCode();
	void insertMovie(MovieDTO dto);
	List<MovieDTO> selectAllMovieList();
	MovieDTO selectMovieDTO(String mcode);
	int deleteMovie(String index);
	int insertFileList(FileDTO fileDTO);
	List<CinemaDTO> selectAllCinema();
	List<ScreenDTO> selectScreenList(String cinemacode);
	List<FileDTO> selectFilePath(String mcode);
	String selectFile(Map<String, Object> map);
	String selectImageFile(int fno);
	void insertScreenMovie(ScreenMovieDTO scdto);
	List<ScreenMovieDTO> selectSYSDATEScreenMovie();
	void updateMovie(MovieDTO dto);
	void updateScreenMovie(ScreenMovieDTO scdto);
	/* void updateScreenMovie(ScreenMovieDTO scdto); */
	 ScreenMovieDTO selectScreenMovieList(String mcode);
	List<MovieDTO> NowshowingMovieList();
	List<MovieDTO> ComingSoonMovieList();
	int updateFileList(FileDTO fileDTO);
	int deleteFileList(FileDTO dto);
	void insertNaverRating(NaverRatingDTO ndto);
	NaverRatingDTO selectNaverRating(String mcode);
	void updateNaverRating(NaverRatingDTO ndto);
	List<MovieDTO> selectNowShowingMovieList(Criteria cri);
	int countNowShowingMovieListTotal();
}
