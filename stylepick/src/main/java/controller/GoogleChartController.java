package controller;

import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import logic.GoogleChartService;
import logic.ShopService;

//RestController은 그 데이터 자체를 받아서 제이슨 형식으로 바꿔서 출력하고 싶을때 사용
//(지금은 json 형식으로 차트를 그릴것이기 때문에 Rest를 붙여서 컨트롤러를 선언한 것이다)
//view를통하지 않고 바로 클라이언트로 전달(just data) : @Controller + @ResponseBody
@RestController //json을 리턴하는 method가 있는 경우
@RequestMapping("googlechart")
public class GoogleChartController {
	public ModelAndView charts() {
        return new ModelAndView("admin/dashboard"); //json데이터를 호출한 곳으로 되돌려준다.
    }

}

