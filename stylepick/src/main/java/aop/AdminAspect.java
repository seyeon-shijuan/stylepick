package aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import exception.LoginException;
import logic.User;

@Component
@Aspect
@Order(1)
public class AdminAspect {
	/*
	 * AdminController 클래스의 모든 클래스는 admin으로 로그인 한 경우만 접근 가능
	 * 1. 비로그인이라면: 로그인 후 가능합니다, login.shop이동
	 * 2. admin이 아니라면: 관리자만 접근할 수 있습니다. main.shop이동
	 * AdminAspect 구현 
	 */
	
	//관리자 로그인인지 여부 확인
	//controller 패키지의 Admin으로 시작하는 클래스
	
	@Around("execution(* controller.Admin*.*(..) )")
	public Object loginCheck(ProceedingJoinPoint joinPoint) throws Throwable {
		User loginUser = null;
		for(Object o : joinPoint.getArgs()) {
			if(o instanceof HttpSession) {
				HttpSession session = (HttpSession)o;
				loginUser = (User)session.getAttribute("loginUser");
				//System.out.println(loginUser);
			}//if
		}//for
		if(loginUser==null) {
			throw new LoginException("로그인 후 접근할 수 있습니다.","../user/login.shop");
		}
		if(!loginUser.getUserid().equals("admin")) {
			throw new LoginException("관리자만 접근할 수 있습니다.","../item/store.shop?id="+loginUser.getUserid());
		}
		Object ret = joinPoint.proceed();
		return ret;
	}//loginCheck
	
	
}
