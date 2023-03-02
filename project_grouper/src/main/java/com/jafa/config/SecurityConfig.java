package com.jafa.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;

import lombok.extern.log4j.Log4j;

@Configuration
@EnableWebSecurity
@Log4j
@ComponentScan("com.jafa.security")
@EnableGlobalMethodSecurity(prePostEnabled = true,securedEnabled = true)
//prePostEnabled : @PreAuthorize @PostAuthorize 어노테이션 활성화 
//securedEnabled : @Secured 어노테이션 활성화 
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public PersistentTokenRepository persistentTokenRepository() {
		JdbcTokenRepositoryImpl jdbcTokenRepository =  new JdbcTokenRepositoryImpl();
		jdbcTokenRepository.setDataSource(dataSource);
		return jdbcTokenRepository;
	}
	
	@Autowired
	AccessDeniedHandler accessDeniedHandler;
	
	@Autowired
	AuthenticationFailureHandler authenticationFailureHandler;
	
	@Autowired
	AuthenticationSuccessHandler authenticationSuccessHandler;
	
	@Autowired
	LogoutSuccessHandler logoutSuccessHandler;
	
	@Autowired
	UserDetailsService userDetailsService;
	
	@Autowired
	DataSource dataSource;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
        
		CharacterEncodingFilter filter = new CharacterEncodingFilter();
		filter.setEncoding("utf-8");
		filter.setForceEncoding(true);
		http.addFilterBefore(filter, CsrfFilter.class);
		
		http.formLogin()
	        .loginPage("/member/login") // 로그인 페이지, 기본값 : /login GET요청
			.loginProcessingUrl("/member/login") // 로그인 처리, 기본값 : /login POST요청 
			.usernameParameter("loginId") // 아이디 name값, 기본값 : username
			.passwordParameter("loginPwd") // 비밀번호 name 값, 기본값 : password
			.failureHandler(authenticationFailureHandler) // 로그인 실패 핸들러
			.successHandler(authenticationSuccessHandler); // 로그인 성공 핸들러 
			// /login으로 요청하면 스프링시큐리티가 제공하는 로그인 페이지로 이동 
		
        
        http.logout()
        	.invalidateHttpSession(true)
        	.logoutUrl("/member/logout") // 로그아웃 처리 URL, 기본값 : /logout 
        	.logoutSuccessHandler(logoutSuccessHandler)
//        	.logoutSuccessUrl("/"); // 로그아웃 성공시 요청 페이지, 기본값 : 로그인
        	.deleteCookies("remember-me","JSESSION_ID");
		
		http.exceptionHandling()
        	.accessDeniedHandler(accessDeniedHandler);
		
		http.rememberMe()
			.key("fefe") // 인증받은 사용자의 정보로 token을 생성하는데 사용되는 임의의 key값 설정 
			.tokenRepository(persistentTokenRepository())
			.rememberMeParameter("remember-me") // 자동로그인 체크박스의 name속성 지정 : 기본값
			.tokenValiditySeconds(86400); // token만료시간 설정
        
	
	}
	
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }
}
