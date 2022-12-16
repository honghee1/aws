package com.project.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;


@Configuration //스프링환경설정파일의미-스프링시큐리티의설정
@EnableWebSecurity //모든요청URL이 스프링시큐리티의 제어받음
public class SecurityConfig {

    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        /*스프링 시큐리티의 세부 설정은 SecurityFilterChain 빈을 생성하여 설정 가능*/
    	http.csrf().disable();
    	/* 모든 인증되지 않은 요청을 허락한다는 의미 - 로그인하지않더라도 모든페이지에 접근가능*/
        http.authorizeRequests()
		.antMatchers("/admin/index").hasAuthority("ROLE_ADMIN")
        .antMatchers("/**").permitAll()
       
        /*스프링 시큐리티의 로그인 설정을 담당하는 부분*/
        .and()
        .formLogin()
        .loginPage("/admin/login")
        .loginPage("/user/login")
        .defaultSuccessUrl("/admin/index")
        .usernameParameter("userEmail")
        
        .and()
        .logout()
        .logoutRequestMatcher(new AntPathRequestMatcher("/admin/logout"))
        .logoutSuccessUrl("/admin/login")
        .invalidateHttpSession(true)
        ;
    	
        return http.build();
    }

    //PasswordEncoder 빈(bean)
    @Bean
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }
}