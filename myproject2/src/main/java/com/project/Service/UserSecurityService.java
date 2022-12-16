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

import com.project.dto.AdminDTO;
import com.project.dto.UserRole;
import com.project.mapper.MemberMapper;

@Service                /*스프링시큐리티가 제공하는 UserDetailService*/
public class UserSecurityService implements UserDetailsService {

	private MemberMapper membermapper;

    public UserSecurityService(MemberMapper membermapper) {
		this.membermapper = membermapper;
	}

    @Override /*loadUserByUsername : 사용자명으로 비밀번호를 조회하여 리턴하는 메서드*/
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    	System.out.println(username);
        Optional<AdminDTO> _siteUser = this.membermapper.findByusername(username);
        if (_siteUser.isEmpty()) {
            throw new UsernameNotFoundException("사용자를 찾을수 없습니다.");
        }
        AdminDTO siteUser = _siteUser.get();
        List<GrantedAuthority> authorities = new ArrayList<>();
        if ("admin".equals(username)) {
            authorities.add(new SimpleGrantedAuthority(UserRole.ADMIN.getValue()));
        } else {
            authorities.add(new SimpleGrantedAuthority(UserRole.USER.getValue()));
        }
        return new User(siteUser.getAdminId(), siteUser.getAdminPasswd(), authorities);
    }
}