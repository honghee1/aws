package test;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@RequiredArgsConstructor
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/templates/**\",\"/resources/**","/css/**","/image/**","/js/**");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception{
        http.headers().frameOptions().sameOrigin();
        http.csrf().disable();
        http.authorizeRequests()
                .antMatchers("/[경로]").permitAll()
                .antMatchers("/[경로]").permitAll()
                .antMatchers("/[경로]/**").permitAll()
                .antMatchers("/[경로]").hasRole("MEMBER")
                .anyRequest().permitAll()
                .and()
                .formLogin()
                .loginPage("/[경로]")
                .loginProcessingUrl("/[경로]")
                .defaultSuccessUrl("/")
                .and()
                .logout();

    }
}