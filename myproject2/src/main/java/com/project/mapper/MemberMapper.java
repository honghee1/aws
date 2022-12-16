package com.project.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.AdminDTO;
import com.project.dto.MemberDTO;

@Mapper
public interface MemberMapper {
	// 로그인
	MemberDTO login(Map<String, Object> map);
	// 회원가입
	int insertMember(MemberDTO dto);
	// 회원정보수정
	int updateMember(MemberDTO dto);
	// 회원탈퇴
	int deleteMember(String userEmail, String userPasswd);
	// 아이디찾기
	List<MemberDTO> selectUserEmail(Map<String, Object> map);
	// 비밀번호찾기
	List<MemberDTO> selectUserPasswd(Map<String, Object> map);
	// 비밀번호 변경
	int updatePasswd(Map<String, Object> map);
	// 회원정보 전체조회
	List<MemberDTO> selectAllMember();
	// 관리자페이지 회원정보 삭제
	int adminDeleteMember(String userEmail);
	// 관리자페이지 회원프로필 조회
	MemberDTO selectMemberProfile(String userEmail);
	// 관리자페이지 회원정보 수정
	int adminMemberUpdate(MemberDTO dto);
	// 회원 마이페이지
	MemberDTO selectMembermypage(String userEmail);
	// admin 페이지
	List<AdminDTO> selectAdminView();
	// 관리자 추가
	int adminInsert(AdminDTO adto);
	// 관리자 삭제
	int adminDelete(String adminId);
	// 관리자 로그인
	AdminDTO adminLogin(HashMap<Object, Object> map);
	
	public int insertuser(AdminDTO user) ;

	public Optional<AdminDTO> findByusername(String username);
	
}
