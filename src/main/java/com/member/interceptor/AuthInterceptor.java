package com.member.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class AuthInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("preHandle()호출");
		HttpSession session=request.getSession();							// 세션에서 "loginMember" 속성이 받기
		System.out.println("interceptor의 session="+session);
		System.out.println("interceptor의 loginMember="+session.getAttribute("loginMember"));
		if(session.getAttribute("loginMember")==null) {						// 세션이 null이라면~(로그인되지 않았다면~)
//			response.sendRedirect(request.getContextPath()+"/login.do");	// 로그인 페이지로 리다이렉트
			response.setContentType("text/html; charset=UTF-8");
	        response.setCharacterEncoding("UTF-8");
			String alertScript = "<script>alert('로그인이 필요한 서비스입니다, 로그인페이지로 이동합니다'); window.location.href='"+request.getContextPath()+"/login.do';</script>";
	        response.getWriter().println(alertScript);
			return false;
		}else {
		    return true;
		}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		 System.out.println("postHandle()호출");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("afterCompletion()호출");
	}

}









