package com.project.mapper;


import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.MemberDTO;
import com.project.dto.SiteUser;

@Mapper
public interface MemberMapper {

	public int insertuser(SiteUser user) ;

	MemberDTO findByusername(String userEmail);

	List<MemberDTO> selectAllAdmin();
	
		
	
}
