package aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import exception.SnsException;
import logic.User;

@Component
@Aspect
@Order(1)
public class SnsAspect {
	@Around("execution(* controller.Sns*.loginCheck*(..)) && args(..,session)")
	public Object userLoginCheck(ProceedingJoinPoint joinPoint, HttpSession session) throws Throwable{
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser ==null) {
			throw new SnsException("로그인 후 거래하세요","main.shop?ksb=hot&type=1");
		}
		return joinPoint.proceed();
	}
	

	

	
	/*
	@Around("execution(* controller.User*.check*(..))&&args(id,session)")
	public Object Logincheck(ProceedingJoinPoint joinPoint,String id, HttpSession session) throws Throwable{
		User loginUser = (User)session.getAttribute("loginUser");
		//args(String,session)으로했을때 0번째 args를 가져와서 했었는데 지금대로하면 그냥 바로 id를 대입시켜도 됨
		String target = (String)joinPoint.getArgs()[0];
		
		if(loginUser==null) {
			throw new LoginException("로그인 후 거래하세요.","login.shop");
		}
		if(!loginUser.getUserid().equals("admin") && !loginUser.getUserid().equals(id) ) {
			throw new LoginException("본인만 거래가능합니다.","main.shop");
		}
		
		return joinPoint.proceed();
		
	}
	*/
}
