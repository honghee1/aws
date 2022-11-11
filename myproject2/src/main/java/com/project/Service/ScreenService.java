package com.project.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.project.dto.CinemaDTO;
import com.project.dto.ScreenDTO;
import com.project.mapper.ScreenMapper;


@Service
public class ScreenService {
	private ScreenMapper mapper;
	
	public ScreenService(ScreenMapper mapper) {
		this.mapper = mapper;
	}

	public List<ScreenDTO> selectScreenList(String mcode, String sdate) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("mcode", mcode);
		map.put("sdate", sdate);
		return mapper.selectScreenList(map);
	}

	public List<ScreenDTO> adminselectScreenList(String cinemacode, int pageNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cinemacode", cinemacode);
		map.put("pageNo", pageNo);
		return mapper.adminselectScreenList(map);
	}

	public int selectAllSeat(String screenCode) {
		return mapper.selectAllSeat(screenCode);
	}

	public ScreenDTO selectCinemaInfo(String cinemacode) {
		return mapper.selectCinemaInfo(cinemacode);
	}

	public int updateCinema(ScreenDTO dto) {
		return mapper.updateCinema(dto);
	}

	public int insertCinema(ScreenDTO dto) {
		return mapper.insertCinema(dto);
	}

	public int deleteCinema(String cinemacode) {
		return mapper.deleteCinema(cinemacode);
	}

	public int selectAllCount(String cinemacode) {
		return mapper.selectAllCount(cinemacode);
	}

	public int insertScreen(ScreenDTO dto) {
		return mapper.insertScreen(dto);
	}

	public int deleteScreen(String screencode) {
		return mapper.deleteScreen(screencode);
	}

	public List<ScreenDTO> selectTypeList() {
		return mapper.selectTypeList();
	}

	public int insertScreenSeat(String screenCode, String seatType, int seatNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seatNo", seatNo);
		map.put("screenCode", screenCode);
		map.put("seatType", seatType);
		return mapper.insertScreenSeat(map);
	}

	public String selectSeatCode(String seatType) {
		return mapper.selectSeatCode(seatType);
	}

	public List<ScreenDTO> selectScreenSchedule(String screencode) {
		return mapper.selectScreenSchedule(screencode);
	}

	public List<ScreenDTO> selectScreenMovie(String screencode) {
		return mapper.selectScreenMovie(screencode);
	}

	public int updateSchedule(ScreenDTO dto) {
		return mapper.updateSchedule(dto);
	}

	public int insertScreenSchedule(ScreenDTO dto) {
		return mapper.insertScreenSchedule(dto);
	}

	public List<ScreenDTO> selectAllSeatType() {
		return mapper.selectAllSeatType();
	}

	public int insertSeatType(String seatType, String seatTag) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seatType", seatType);
		map.put("seatTag", seatTag);
		return mapper.insertSeatType(map);
	}

	public int deleteSeatType(String seatType) {
		return mapper.deleteSeatType(seatType);
	}

	public void updateScreenCode(ScreenDTO dto) {
		mapper.updateScreenCode(dto);
	}
}
