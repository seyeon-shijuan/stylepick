package aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import exception.ItemEmptyException;
import exception.LoginException;
import exception.SnsException;
import logic.User;

@Component
@Aspect
@Order(1)
public class ItemAspect {
	@Around("execution(* controller.Item*.loginCheck*(..)) && args(..,session)") //기본메소드 실행 전,후
	//pointcut : controller패키지의 User이름으로 시작하는 클래스
	//메서드의 이름이 loginCheck으로 시작
	//매개변수는 상관없음
//args(..,session) : 마지막 매개변수가 session인 메소드
public Object userLoginCheck(ProceedingJoinPoint joinPoint, HttpSession session) throws Throwable{
User loginUser = (User)session.getAttribute("loginUser");
if(loginUser ==null) {
throw new LoginException("로그인 후 거래하세요","login.shop");
}
return joinPoint.proceed();
}
	
}
