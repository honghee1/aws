package com.project.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.CinemaDTO;
import com.project.dto.ScreenDTO;


@Mapper
public interface ScreenMapper {

	List<ScreenDTO> selectScreenList(Map<String, String> map);

	List<ScreenDTO> adminselectScreenList(Map<String, Object> map);

	int selectAllSeat(String screenCode);

	ScreenDTO selectCinemaInfo(String cinemacode);

	int updateCinema(ScreenDTO dto);

	int insertCinema(ScreenDTO dto);

	int deleteCinema(String cinemacode);

	int selectAllCount(String cinemacode);

	int insertScreen(ScreenDTO dto);

	int deleteScreen(String screencode);

	List<ScreenDTO> selectTypeList();

	int insertScreenSeat(Map<String, Object> map);

	String selectSeatCode(String seatType);

	List<ScreenDTO> selectScreenSchedule(String screencode);

	List<ScreenDTO> selectScreenMovie(String screencode);

	int updateSchedule(ScreenDTO dto);

	int insertScreenSchedule(ScreenDTO dto);

	List<ScreenDTO> selectAllSeatType();

	int insertSeatType(Map<String, Object> map);

	int deleteSeatType(String seatType);

	void updateScreenCode(ScreenDTO dto);

}
