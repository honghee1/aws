package com.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.QnADTO;

@Mapper
public interface QnAMapper {

	int insertQnA(QnADTO dto);
	
	List<QnADTO> selectQna(HashMap<Object, Object> map);

	int countQna(String userEmail);

	int updateQnaResponse(HashMap<Object, Object> map);

	List<QnADTO> selectAllQnaView();

	List<QnADTO> selectQnamypage(String userEmail);

	QnADTO selectQnaDetail(int qno);
	
}