package com.project.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.project.dto.AdminDTO;
import com.project.dto.MemberDTO;
import com.project.mapper.MemberMapper;

@Service
public class MemberService {
	private MemberMapper mapper;

	public MemberService(MemberMapper mapper) {
		this.mapper = mapper;
	}

	public MemberDTO login(String userEmail, String userPasswd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userEmail", userEmail);
		map.put("userPasswd", userPasswd);
		return mapper.login(map);
	}

	public int insertMember(MemberDTO dto) {
		return mapper.insertMember(dto);
	}

	public int updateMember(MemberDTO dto) {
		return mapper.updateMember(dto);
	}

	public int deleteMamber(String userEmail, String userPasswd) {
		return mapper.deleteMember(userEmail, userPasswd);
	}

	public List<MemberDTO> selectUserEmail(String userName, String userTel) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userName", userName);
		map.put("userTel", userTel);
		return mapper.selectUserEmail(map);
	}

	public List<MemberDTO> selectUserPasswd(String userEmail, String userName, String userTel) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userEmail", userEmail);
		map.put("userName", userName);
		map.put("userTel", userTel);
		return mapper.selectUserPasswd(map);
	}

	public int updatePasswd(String userEmail, String userPasswd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userEmail", userEmail);
		map.put("userPasswd", userPasswd);
		return mapper.updatePasswd(map);
	}

	public List<MemberDTO> selectAllMember() {
		return mapper.selectAllMember();
	}

	public int adminDeleteMember(String userEmail) {
		return mapper.adminDeleteMember(userEmail);
	}

	public MemberDTO selectMemberProfile(String userEmail) {
		return mapper.selectMemberProfile(userEmail);
	}

	public int adminMemberUpdate(MemberDTO dto) {
		return mapper.adminMemberUpdate(dto);
	}

	public MemberDTO selectMembermypage(String userEmail) {
		return mapper.selectMembermypage(userEmail);
	}

	public List<AdminDTO> selectAdminView() {
		return mapper.selectAdminView();
	}

	public int adminInsert(AdminDTO adto) {
		return mapper.adminInsert(adto);
	}

	public int adminDelete(String adminId) {
		return mapper.adminDelete(adminId);
	}

	public AdminDTO adminLogin(String adminId, String adminPasswd) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("adminId", adminId);
		map.put("adminPasswd", adminPasswd);
		return mapper.adminLogin(map);
	}





	
	
}
