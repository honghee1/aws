package com.project.Service;

import lombok.RequiredArgsConstructor;

import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.project.dto.MemberDTO;
import com.project.dto.SiteUser;
import com.project.mapper.MemberMapper;



@RequiredArgsConstructor
@Service
public class MemberService {
	
    private MemberMapper membermapper;

    public MemberService(MemberMapper membermapper) {
		this.membermapper = membermapper;
	}
    
    public int create(String username, String email, String password){
        SiteUser user = new SiteUser(username, email, password);
        user.setUsername(username);
        user.setEmail(email);
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        user.setPassword(passwordEncoder.encode(password));
        return membermapper.insertuser(user);
    }

	public List<MemberDTO> selectAllAdmin() {
		return membermapper.selectAllAdmin();
	}
}