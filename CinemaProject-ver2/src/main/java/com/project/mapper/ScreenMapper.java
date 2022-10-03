package com.project.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.ScreenDTO;


@Mapper
public interface ScreenMapper {

	List<ScreenDTO> selectScreenList(Map<String, String> map);

}
