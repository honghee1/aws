package com.project.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.project.dto.MemberDTO;
import com.project.dto.UserRole;
import com.project.mapper.MemberMapper;

@Service                /*스프링시큐리티가 제공하는 UserDetailService*/
public class UserSecurityService implements UserDetailsService {

	private MemberMapper memberMapper;

    public UserSecurityService(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}

    @Override /*loadUserByUsername : 사용자명으로 비밀번호를 조회하여 리턴하는 메서드*/
    public UserDetails loadUserByUsername(String userEmail) throws UsernameNotFoundException {
    	System.out.println(userEmail);
        MemberDTO member = this.memberMapper.findByusername(userEmail);
		/*
		 * if (_member.Empty()) { System.out.println("asd123"); throw new
		 * UsernameNotFoundException("사용자를 찾을수 없습니다."); }
		 */
        System.out.println("as1d2"+member);
		/* MemberDTO member = _member.get(); */
        List<GrantedAuthority> authorities = new ArrayList<>();
        if ("admin".equals(member.getUserrole())) {
            authorities.add(new SimpleGrantedAuthority(UserRole.ADMIN.getValue()));
        } else {
            authorities.add(new SimpleGrantedAuthority(UserRole.USER.getValue()));
        }
        return new User(member.getUserName(), member.getUserPasswd(), authorities);
    }
}