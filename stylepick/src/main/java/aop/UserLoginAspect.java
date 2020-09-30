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
public class UserLoginAspect {
	@Around("(execution(* controller.User*.loginCheck*(..)) || execution(* controller.Cart*.check*(..)) || execution(* controller.Item*.check*(..))) && args(..,session)") //기본메소드 실행 전,후
																	//pointcut : controller패키지의 User이름으로 시작하는 클래스
																	//메서드의 이름이 loginCheck으로 시작
																	//매개변수는 상관없음
															//args(..,session) : 마지막 매개변수가 session인 메소드
	public Object userLoginCheck(ProceedingJoinPoint joinPoint, HttpSession session) throws Throwable{
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser ==null) {
			throw new LoginException("로그인 후 거래하세요","../user/login.shop");
		}
		return joinPoint.proceed();
	}
	
	@Around("execution(* controller.User*.check*(..))&&args(id,session)")
	public Object Logincheck(ProceedingJoinPoint joinPoint,String id, HttpSession session) throws Throwable{
		User loginUser = (User)session.getAttribute("loginUser");
		//args(String,session)으로했을때 0번째 args를 가져와서 했었는데 지금대로하면 그냥 바로 id를 대입시켜도 됨
		String target = (String)joinPoint.getArgs()[0];
		
		if(loginUser==null) {
			throw new LoginException("로그인하세요.","login.shop");
		}
		if(!loginUser.getUserid().equals("admin") && !loginUser.getUserid().equals(id) ) {
			throw new LoginException("잘못된 접근입니다.","main.shop?ksb=hot&type=1");
		}
		
		return joinPoint.proceed();
		
	}
}
