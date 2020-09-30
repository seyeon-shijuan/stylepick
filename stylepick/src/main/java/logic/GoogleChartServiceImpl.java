package logic;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class GoogleChartServiceImpl implements GoogleChartService {

	@Autowired
	ShopService service;
	//샵 서비스에 있는 값들을 가져오기 위해서 의존성을 주입
	
	//{"변수명" : [{},{},{}], "변수명" : "값"}
	
	//[admin] dashboard index 2-1 주간 매출
    @Override
    public JSONObject getChartData() {//제이슨 오브젝트를 리턴하는 것
        // getChartData메소드를 호출하면
        //db에서 리스트 받아오고, 받아온걸로 json형식으로 만들어서 리턴을 해주게 된다.
    	//List<CartDTO> items = cartService.cartMoney();
    	//Map<String, Object> items = service.weeklyrevenue(); //이게 문젠가?
        List<Buy> items = service.weeklyrevenue(); //it works
        //System.out.println(items.toString());
    	
        //리턴할 json 객체
        JSONObject data = new JSONObject(); //{}
        
        //json의 칼럼 객체
        JSONObject col1 = new JSONObject();
        JSONObject col2 = new JSONObject();
        
        //json 배열 객체, 배열에 저장할때는 JSONArray()를 사용
        JSONArray title = new JSONArray();
        col1.put("label","주문일"); //col1에 자료를 저장 ("필드이름","자료형")
        col1.put("type", "string");
        col2.put("label", "금액");
        col2.put("type", "number");
        
        //테이블행에 컬럼 추가
        title.add(col1);
        title.add(col2);
        
        //json 객체에 타이틀행 추가
        data.put("cols", title);//제이슨을 넘김
        //이런형식으로 추가가된다. {"cols" : [{"label" : 주문일","type":"string"}
        //,{"label" : "금액", "type" : "number"}]}
        
        JSONArray body = new JSONArray(); //json 배열을 사용하기 위해 객체를 생성
        for (Buy dto : items) { //items에 저장된 값을 dto로 반복문을 돌려서 하나씩 저장한다.
            
            JSONObject orderdate = new JSONObject(); //json오브젝트 객체를 생성
            orderdate.put("v", dto.getOrderdateinString()); //name변수에 dto에 저장된 주문일을 v라고 저장한다.
            
            JSONObject amount = new JSONObject(); //json오브젝트 객체를 생성
            amount.put("v", dto.getAmount()); //name변수에 dto에 저장된 금액을 v라고 저장한다.
            
            JSONArray row = new JSONArray(); //json 배열 객체 생성 (위에서 저장한 변수를 칼럼에 저장하기위해)
            row.add(orderdate); //name을 row에 저장 (테이블의 행)
            row.add(amount); //name을 row에 저장 (테이블의 행)
            
            JSONObject cell = new JSONObject(); 
            cell.put("c", row); //cell 2개를 합쳐서 "c"라는 이름으로 추가
            body.add(cell); //레코드 1개 추가
                
        }
        data.put("rows", body); //data에 body를 저장하고 이름을 rows라고 한다.
        
        return data; //이 데이터가 넘어가면 json형식으로 넘어가게되서 json이 만들어지게 된다.
    }

    //[admin] dashboard index 2-2 최근 4주간 매출
    @Override
    public JSONObject getChartData2() {//제이슨 오브젝트를 리턴하는 것
        // getChartData메소드를 호출하면
        //db에서 리스트 받아오고, 받아온걸로 json형식으로 만들어서 리턴을 해주게 된다.
    	//List<CartDTO> items = cartService.cartMoney();
    	//Map<String, Object> items = service.weeklyrevenue(); //이게 문젠가?
        List<Buy> items = service.monthlyrevenue(); //it works
    	//System.out.println(items.toString());
        //리턴할 json 객체
        JSONObject data = new JSONObject(); //{}
        
        //json의 칼럼 객체
        JSONObject col1 = new JSONObject();
        JSONObject col2 = new JSONObject();
        
        //json 배열 객체, 배열에 저장할때는 JSONArray()를 사용
        JSONArray title = new JSONArray();
        col1.put("label","주"); //col1에 자료를 저장 ("필드이름","자료형")
        col1.put("type", "string");
        col2.put("label", "금액");
        col2.put("type", "number");
        
        //테이블행에 컬럼 추가
        title.add(col1);
        title.add(col2);
        
        //json 객체에 타이틀행 추가
        data.put("cols", title);//제이슨을 넘김
        //이런형식으로 추가가된다. {"cols" : [{"label" : 주","type":"number"}
        //,{"label" : "금액", "type" : "number"}]}
        
        JSONArray body = new JSONArray(); //json 배열을 사용하기 위해 객체를 생성
        for (Buy dto : items) { //items에 저장된 값을 dto로 반복문을 돌려서 하나씩 저장한다.
            
            JSONObject weeks_ago = new JSONObject(); //json오브젝트 객체를 생성
            weeks_ago.put("v", dto.getWeeks_ago()); //name변수에 dto에 저장된 주문일을 v라고 저장한다.
            
            JSONObject amount = new JSONObject(); //json오브젝트 객체를 생성
            amount.put("v", dto.getAmount()); //name변수에 dto에 저장된 금액을 v라고 저장한다.
            
            JSONArray row = new JSONArray(); //json 배열 객체 생성 (위에서 저장한 변수를 칼럼에 저장하기위해)
            row.add(weeks_ago); //name을 row에 저장 (테이블의 행)
            row.add(amount); //name을 row에 저장 (테이블의 행)
            
            JSONObject cell = new JSONObject(); 
            cell.put("c", row); //cell 2개를 합쳐서 "c"라는 이름으로 추가
            body.add(cell); //레코드 1개 추가
                
        }
        data.put("rows", body); //data에 body를 저장하고 이름을 rows라고 한다.
        
        return data; //이 데이터가 넘어가면 json형식으로 넘어가게되서 json이 만들어지게 된다.
    }
    
    //[admin] widgets index 2-1 이번 달 최다 구매 회원 랭킹
    @Override
    public JSONObject getChartData3() {//제이슨 오브젝트를 리턴하는 것
    	// getChartData메소드를 호출하면
        //db에서 리스트 받아오고, 받아온걸로 json형식으로 만들어서 리턴을 해주게 된다.
    	//List<CartDTO> items = cartService.cartMoney();
    	//Map<String, Object> items = service.weeklyrevenue(); //이게 문젠가?
        List<Buy> items = service.monthlyheavyusers(); //it works
    	//System.out.println(items.toString());
        //리턴할 json 객체
        JSONObject data = new JSONObject(); //{}
        
        //json의 칼럼 객체
        JSONObject col1 = new JSONObject();
        JSONObject col2 = new JSONObject();
        
        //json 배열 객체, 배열에 저장할때는 JSONArray()를 사용
        JSONArray title = new JSONArray();
        col1.put("label","아이디"); //col1에 자료를 저장 ("필드이름","자료형")
        col1.put("type", "string");
        col2.put("label", "금액");
        col2.put("type", "number");
        
        //테이블행에 컬럼 추가
        title.add(col1);
        title.add(col2);
        
        //json 객체에 타이틀행 추가
        data.put("cols", title);//제이슨을 넘김
        //이런형식으로 추가가된다. {"cols" : [{"label" : 아이디","type":"string"}
        //,{"label" : "금액", "type" : "number"}]}
        
        JSONArray body = new JSONArray(); //json 배열을 사용하기 위해 객체를 생성
        for (Buy dto : items) { //items에 저장된 값을 dto로 반복문을 돌려서 하나씩 저장한다.
            
            JSONObject userid = new JSONObject(); //json오브젝트 객체를 생성
            userid.put("v", dto.getUserid()); //name변수에 dto에 저장된 주문일을 v라고 저장한다.
            
            JSONObject amount = new JSONObject(); //json오브젝트 객체를 생성
            amount.put("v", dto.getAmount()); //name변수에 dto에 저장된 금액을 v라고 저장한다.
            
            JSONArray row = new JSONArray(); //json 배열 객체 생성 (위에서 저장한 변수를 칼럼에 저장하기위해)
            row.add(userid); //name을 row에 저장 (테이블의 행)
            row.add(amount); //name을 row에 저장 (테이블의 행)
            
            JSONObject cell = new JSONObject(); 
            cell.put("c", row); //cell 2개를 합쳐서 "c"라는 이름으로 추가
            body.add(cell); //레코드 1개 추가
                
        }
        data.put("rows", body); //data에 body를 저장하고 이름을 rows라고 한다.
        
        return data; //이 데이터가 넘어가면 json형식으로 넘어가게되서 json이 만들어지게 된다.
    }
    
    //[admin] widgets index 2-2 올해 최다 구매 회원 랭킹
    @Override
    public JSONObject getChartData4() {//제이슨 오브젝트를 리턴하는 것
    	// getChartData메소드를 호출하면
        //db에서 리스트 받아오고, 받아온걸로 json형식으로 만들어서 리턴을 해주게 된다.
    	//List<CartDTO> items = cartService.cartMoney();
    	//Map<String, Object> items = service.weeklyrevenue(); //이게 문젠가?
        List<Buy> items = service.yearlyheavyusers(); //it works
    	//System.out.println(items.toString());
        //리턴할 json 객체
        JSONObject data = new JSONObject(); //{}
        
        //json의 칼럼 객체
        JSONObject col1 = new JSONObject();
        JSONObject col2 = new JSONObject();
        
        //json 배열 객체, 배열에 저장할때는 JSONArray()를 사용
        JSONArray title = new JSONArray();
        col1.put("label","아이디"); //col1에 자료를 저장 ("필드이름","자료형")
        col1.put("type", "string");
        col2.put("label", "금액");
        col2.put("type", "number");
        
        //테이블행에 컬럼 추가
        title.add(col1);
        title.add(col2);
        
        //json 객체에 타이틀행 추가
        data.put("cols", title);//제이슨을 넘김
        //이런형식으로 추가가된다. {"cols" : [{"label" : 아이디","type":"string"}
        //,{"label" : "금액", "type" : "number"}]}
        
        JSONArray body = new JSONArray(); //json 배열을 사용하기 위해 객체를 생성
        for (Buy dto : items) { //items에 저장된 값을 dto로 반복문을 돌려서 하나씩 저장한다.
            
            JSONObject userid = new JSONObject(); //json오브젝트 객체를 생성
            userid.put("v", dto.getUserid()); //name변수에 dto에 저장된 주문일을 v라고 저장한다.
            
            JSONObject amount = new JSONObject(); //json오브젝트 객체를 생성
            amount.put("v", dto.getAmount()); //name변수에 dto에 저장된 금액을 v라고 저장한다.
            
            JSONArray row = new JSONArray(); //json 배열 객체 생성 (위에서 저장한 변수를 칼럼에 저장하기위해)
            row.add(userid); //name을 row에 저장 (테이블의 행)
            row.add(amount); //name을 row에 저장 (테이블의 행)
            
            JSONObject cell = new JSONObject(); 
            cell.put("c", row); //cell 2개를 합쳐서 "c"라는 이름으로 추가
            body.add(cell); //레코드 1개 추가
                
        }
        data.put("rows", body); //data에 body를 저장하고 이름을 rows라고 한다.
        
        return data; //이 데이터가 넘어가면 json형식으로 넘어가게되서 json이 만들어지게 된다.
    }
    
    
    //[admin] widgets index 3-1 우수 입점 스토어 차트
    @Override
    public JSONObject getChartData5() {//제이슨 오브젝트를 리턴하는 것
    	// getChartData메소드를 호출하면
        //db에서 리스트 받아오고, 받아온걸로 json형식으로 만들어서 리턴을 해주게 된다.
    	//List<CartDTO> items = cartService.cartMoney();
    	//Map<String, Object> items = service.weeklyrevenue(); //이게 문젠가?
        List<Line> items = service.topthreestores(); //it works
    	//System.out.println(items.toString());
        //리턴할 json 객체
        JSONObject data = new JSONObject(); //{}
        
        //json의 칼럼 객체
        JSONObject col1 = new JSONObject();
        JSONObject col2 = new JSONObject();
        
        //json 배열 객체, 배열에 저장할때는 JSONArray()를 사용
        JSONArray title = new JSONArray();
        col1.put("label","스토어명"); //col1에 자료를 저장 ("필드이름","자료형")
        col1.put("type", "string");
        col2.put("label", "평점 평균");
        col2.put("type", "number");
        
        //테이블행에 컬럼 추가
        title.add(col1);
        title.add(col2);
        
        //json 객체에 타이틀행 추가
        data.put("cols", title);//제이슨을 넘김
        //이런형식으로 추가가된다. {"cols" : [{"label" : 아이디","type":"string"}
        //,{"label" : "금액", "type" : "number"}]}
        
        JSONArray body = new JSONArray(); //json 배열을 사용하기 위해 객체를 생성
        for (Line dto : items) { //items에 저장된 값을 dto로 반복문을 돌려서 하나씩 저장한다.
            
            JSONObject com_name = new JSONObject(); //json오브젝트 객체를 생성
            com_name.put("v", dto.getCom_name()); //name변수에 dto에 저장된 주문일을 v라고 저장한다.
            
            JSONObject amount = new JSONObject(); //json오브젝트 객체를 생성
            amount.put("v", dto.getEvaluation()); //name변수에 dto에 저장된 금액을 v라고 저장한다.
            
            JSONArray row = new JSONArray(); //json 배열 객체 생성 (위에서 저장한 변수를 칼럼에 저장하기위해)
            row.add(com_name); //name을 row에 저장 (테이블의 행)
            row.add(amount); //name을 row에 저장 (테이블의 행)
            
            JSONObject cell = new JSONObject(); 
            cell.put("c", row); //cell 2개를 합쳐서 "c"라는 이름으로 추가
            body.add(cell); //레코드 1개 추가
                
        }
        data.put("rows", body); //data에 body를 저장하고 이름을 rows라고 한다.
        
        return data; //이 데이터가 넘어가면 json형식으로 넘어가게되서 json이 만들어지게 된다.
    }
    
  //[admin] charts index 1 스타일픽 회원 수 0820
    @Override
    public JSONObject getChartData6() {//제이슨 오브젝트를 리턴하는 것
    	// getChartData메소드를 호출하면
        //db에서 리스트 받아오고, 받아온걸로 json형식으로 만들어서 리턴을 해주게 된다.
    	//List<CartDTO> items = cartService.cartMoney();
    	//Map<String, Object> items = service.weeklyrevenue(); //이게 문젠가?
        List<User> items = service.totnumofusers(); //it works
    	//System.out.println(items.toString());
        //리턴할 json 객체
        JSONObject data = new JSONObject(); //{}
        
        //json의 칼럼 객체
        JSONObject col1 = new JSONObject();
        JSONObject col2 = new JSONObject();
        
        //json 배열 객체, 배열에 저장할때는 JSONArray()를 사용
        JSONArray title = new JSONArray();
        col1.put("label","회원분류"); //col1에 자료를 저장 ("필드이름","자료형")
        col1.put("type", "string");
        col2.put("label", "회원 수");
        col2.put("type", "number");
        
        //테이블행에 컬럼 추가
        title.add(col1);
        title.add(col2);
        
        //json 객체에 타이틀행 추가
        data.put("cols", title);//제이슨을 넘김
        //이런형식으로 추가가된다. {"cols" : [{"label" : 월","type":"number"}
        //,{"label" : "금액", "type" : "number"}]}
        
        JSONArray body = new JSONArray(); //json 배열을 사용하기 위해 객체를 생성
        for (User dto : items) { //items에 저장된 값을 dto로 반복문을 돌려서 하나씩 저장한다.
            
            JSONObject seller = new JSONObject(); //json오브젝트 객체를 생성
            seller.put("v", dto.getSellerinString()); //name변수에 dto에 저장된 주문일을 v라고 저장한다.
            
            JSONObject num = new JSONObject(); //json오브젝트 객체를 생성
            num.put("v", dto.getNum()); //name변수에 dto에 저장된 금액을 v라고 저장한다.
            
            JSONArray row = new JSONArray(); //json 배열 객체 생성 (위에서 저장한 변수를 칼럼에 저장하기위해)
            row.add(seller); //name을 row에 저장 (테이블의 행)
            row.add(num); //name을 row에 저장 (테이블의 행)
            
            JSONObject cell = new JSONObject(); 
            cell.put("c", row); //cell 2개를 합쳐서 "c"라는 이름으로 추가
            body.add(cell); //레코드 1개 추가
                
        }
        data.put("rows", body); //data에 body를 저장하고 이름을 rows라고 한다.
        
        return data; //이 데이터가 넘어가면 json형식으로 넘어가게되서 json이 만들어지게 된다.
    }
    
    //[admin] charts index 3 Yearly : 연 매출 현황
    @Override
    public JSONObject getChartData7() {//제이슨 오브젝트를 리턴하는 것
    	// getChartData메소드를 호출하면
        //db에서 리스트 받아오고, 받아온걸로 json형식으로 만들어서 리턴을 해주게 된다.
    	//List<CartDTO> items = cartService.cartMoney();
    	//Map<String, Object> items = service.weeklyrevenue(); //이게 문젠가?
        List<Buy> items = service.yearlyrevenue(); //it works
    	//System.out.println(items.toString());
        //리턴할 json 객체
        JSONObject data = new JSONObject(); //{}
        
        //json의 칼럼 객체
        JSONObject col1 = new JSONObject();
        JSONObject col2 = new JSONObject();
        
        //json 배열 객체, 배열에 저장할때는 JSONArray()를 사용
        JSONArray title = new JSONArray();
        col1.put("label","월"); //col1에 자료를 저장 ("필드이름","자료형")
        col1.put("type", "string");
        col2.put("label", "금액");
        col2.put("type", "number");
        
        //테이블행에 컬럼 추가
        title.add(col1);
        title.add(col2);
        
        //json 객체에 타이틀행 추가
        data.put("cols", title);//제이슨을 넘김
        //이런형식으로 추가가된다. {"cols" : [{"label" : 월","type":"number"}
        //,{"label" : "금액", "type" : "number"}]}
        
        JSONArray body = new JSONArray(); //json 배열을 사용하기 위해 객체를 생성
        for (Buy dto : items) { //items에 저장된 값을 dto로 반복문을 돌려서 하나씩 저장한다.
            
            JSONObject month = new JSONObject(); //json오브젝트 객체를 생성
            month.put("v", dto.getMonth()); //name변수에 dto에 저장된 주문일을 v라고 저장한다.
            
            JSONObject amount = new JSONObject(); //json오브젝트 객체를 생성
            amount.put("v", dto.getAmount()); //name변수에 dto에 저장된 금액을 v라고 저장한다.
            
            JSONArray row = new JSONArray(); //json 배열 객체 생성 (위에서 저장한 변수를 칼럼에 저장하기위해)
            row.add(month); //name을 row에 저장 (테이블의 행)
            row.add(amount); //name을 row에 저장 (테이블의 행)
            
            JSONObject cell = new JSONObject(); 
            cell.put("c", row); //cell 2개를 합쳐서 "c"라는 이름으로 추가
            body.add(cell); //레코드 1개 추가
                
        }
        data.put("rows", body); //data에 body를 저장하고 이름을 rows라고 한다.
        
        return data; //이 데이터가 넘어가면 json형식으로 넘어가게되서 json이 만들어지게 된다.
    }
    
    //[admin] charts index 4-1 지역별 매출 평균 boxplot
    @Override
    public JSONObject getChartData8() {//제이슨 오브젝트를 리턴하는 것
    	// getChartData메소드를 호출하면
        //db에서 리스트 받아오고, 받아온걸로 json형식으로 만들어서 리턴을 해주게 된다.
    	//List<CartDTO> items = cartService.cartMoney();
    	//Map<String, Object> items = service.weeklyrevenue(); //이게 문젠가?
        List<Buy> items = service.boxplot(); //it works
    	//System.out.println(items.toString());
        //리턴할 json 객체
        JSONObject data = new JSONObject(); //{}
        
        //json의 칼럼 객체
        JSONObject col1 = new JSONObject();
        JSONObject col2 = new JSONObject();
        
        //json 배열 객체, 배열에 저장할때는 JSONArray()를 사용
        JSONArray title = new JSONArray();
        col1.put("label","지역구"); //col1에 자료를 저장 ("필드이름","자료형")
        col1.put("type", "string");
        col2.put("label", "금액");
        col2.put("type", "number");
        
        //테이블행에 컬럼 추가
        title.add(col1);
        title.add(col2);
        
        //json 객체에 타이틀행 추가
        data.put("cols", title);//제이슨을 넘김
        //이런형식으로 추가가된다. {"cols" : [{"label" : 지역구","type":"string"}
        //,{"label" : "금액", "type" : "number"}]}

        List<Integer> overlap = new ArrayList<Integer>();
        JSONArray body = new JSONArray(); //json 배열을 사용하기 위해 객체를 생성
        for (Buy dto : items) { //items에 저장된 값을 dto로 반복문을 돌려서 하나씩 저장한다.
            /*
			{"rows":
			[
			{"c":[{"v":"서울시 강서"},{"v":85000}]},
			{"c":[{"v":"서울시 강서"},{"v":15000}]},
			{"c":[{"v":"서울시 강서"},{"v":50000}]},
			{"c":[{"v":"서울시 금천"},{"v":70000}]},
			{"c":[{"v":"서울시 성동"},{"v":100000}]},
			{"c":[{"v":"서울시 성동"},{"v":2500}]},
			{"c":[{"v":"서울시 양천"},{"v":40000}]},
			{"c":[{"v":"서울시 양천"},{"v":49000}]},
			{"c":[{"v":"서울시 양천"},{"v":35000}]},
			{"c":[{"v":"서울시 양천"},{"v":30000}]},
			{"c":[{"v":"서울시 양천"},{"v":10000}]},
			{"c":[{"v":"안산시 단원"},{"v":2000}]}],
			"cols":[{"label":"지역구","type":"string"},{"label":"금액","type":"number"}]}
             */
            JSONObject address = new JSONObject(); //json오브젝트 객체를 생성
            address.put("v", dto.getAddress()); //name변수에 dto에 저장된 주문일을 v라고 저장한다.
            
            //================================================================================
            /*
            int count=0;	//중복일경우 중복된 지점을 체크하기 위한 초기화
            for (Object object : body) {
            	String bodyaddress = object.toString().substring(12);				//주소   ex) 안산시 단원
				bodyaddress = bodyaddress.substring(0,bodyaddress.indexOf("\""));
				if(bodyaddress.equals(dto.getAddress())) {							//현재 추가하고있는 주소가 이미 있다면
					String bodyamount=object.toString().substring(object.toString().indexOf("\"",23)+2);  //body의 amount값을 가져올수 있으면 안이래도되는데..
					bodyamount=bodyamount.substring(0,bodyamount.indexOf("}"));		//이 두줄은 amount값을 가져옴
					
					dto.setAmount((dto.getAmount()+Integer.parseInt(bodyamount)));	//기존에 있던 amount와 현재 amount를 더함
					overlap.add(count);												//body[count]는 중복된 컬럼이므로 후에 삭제하기위해 저장
				}
				count++;
			}
			*/
            //================================================================================
            
            JSONObject amount = new JSONObject(); //json오브젝트 객체를 생성
            amount.put("v", dto.getAmount()); //name변수에 dto에 저장된 금액을 v라고 저장한다.
            
            JSONArray row = new JSONArray(); //json 배열 객체 생성 (위에서 저장한 변수를 칼럼에 저장하기위해)
            row.add(address); //name을 row에 저장 (테이블의 행)
            row.add(amount); //name을 row에 저장 (테이블의 행)
            
           
            JSONObject cell = new JSONObject();
            cell.put("c", row); //cell 2개를 합쳐서 "c"라는 이름으로 추가
            body.add(cell); //레코드 1개 추가
                
        }
        //Chyeon , 중복된 array 제거
        /*
        int count = 0;
        for (int over : overlap) {
			body.remove(over-count); //한번삭제하면 뒤에있는 값이 땡겨지므로 1씩 빼야한다.
			count++;
		}
		*/
        
        data.put("rows", body); //data에 body를 저장하고 이름을 rows라고 한다.
        return data; //이 데이터가 넘어가면 json형식으로 넘어가게되서 json이 만들어지게 된다.
    }
    
    //[admin] charts index 5 구매건 기준 매출 산점도
    @Override
    public JSONObject getChartData10() {//제이슨 오브젝트를 리턴하는 것
    	// getChartData메소드를 호출하면
        //db에서 리스트 받아오고, 받아온걸로 json형식으로 만들어서 리턴을 해주게 된다.
    	//List<CartDTO> items = cartService.cartMoney();
    	//Map<String, Object> items = service.weeklyrevenue(); //이게 문젠가?
        List<Buy> items = service.scatterplot(); //it works
    	//System.out.println(items.toString());
        //리턴할 json 객체
        JSONObject data = new JSONObject(); //{}
        
        //json의 칼럼 객체
        JSONObject col1 = new JSONObject();
        JSONObject col2 = new JSONObject();
        
        //json 배열 객체, 배열에 저장할때는 JSONArray()를 사용
        JSONArray title = new JSONArray();
        col1.put("label","가입연월"); //col1에 자료를 저장 ("필드이름","자료형")
        col1.put("type", "string");
        col2.put("label", "구매 금액");
        col2.put("type", "number");
        
        //테이블행에 컬럼 추가
        title.add(col1);
        title.add(col2);
        
        
        //json 객체에 타이틀행 추가
        data.put("cols", title);//제이슨을 넘김
        //이런형식으로 추가가된다. {"cols" : [{"label" : 월","type":"number"}
        //,{"label" : "금액", "type" : "number"}]}
        
        //{"rows":[{"c":[{"v":"2020-07"},{"v":50000}]},{"c":[{"v":"2020-07"},{"v":110000}]},{"c":[{"v":"2020-07"},{"v":30000}]}]"cols":[{"label":"가입연월","type":"string"},{"label":"구매 금액","type":"number"}]}
        
        JSONArray body = new JSONArray(); //json 배열을 사용하기 위해 객체를 생성
        for (Buy dto : items) { //items에 저장된 값을 dto로 반복문을 돌려서 하나씩 저장한다.
            
            JSONObject regdate = new JSONObject(); //json오브젝트 객체를 생성
            //System.out.println("-=======");
            //System.out.println( dto.getRegdateinString());
            regdate.put("v", dto.getRegdateinString()); //name변수에 dto에 저장된 주문일을 v라고 저장한다.
            
            JSONObject amount = new JSONObject(); //json오브젝트 객체를 생성
            amount.put("v", dto.getAmount()); //name변수에 dto에 저장된 금액을 v라고 저장한다.
            
            JSONArray row = new JSONArray(); //json 배열 객체 생성 (위에서 저장한 변수를 칼럼에 저장하기위해)
            row.add(regdate); //name을 row에 저장 (테이블의 행)
            row.add(amount); //name을 row에 저장 (테이블의 행)
            
            JSONObject cell = new JSONObject(); 
            cell.put("c", row); //cell 2개를 합쳐서 "c"라는 이름으로 추가
            body.add(cell); //레코드 1개 추가
                
        }
        data.put("rows", body); //data에 body를 저장하고 이름을 rows라고 한다.
        
        return data; //이 데이터가 넘어가면 json형식으로 넘어가게되서 json이 만들어지게 된다.
    }
    
    //[admin] charts index 6-1 카테고리별 판매 현황(월)
    @Override
    public JSONObject getChartData11() {//제이슨 오브젝트를 리턴하는 것
    	// getChartData메소드를 호출하면
        //db에서 리스트 받아오고, 받아온걸로 json형식으로 만들어서 리턴을 해주게 된다.
    	//List<CartDTO> items = cartService.cartMoney();
    	//Map<String, Object> items = service.weeklyrevenue(); //이게 문젠가?
        List<Buy> items = service.salesbycategories(); //it works
    	//System.out.println(items.toString());
        //리턴할 json 객체
        JSONObject data = new JSONObject(); //{}
        
        //json의 칼럼 객체
        JSONObject col1 = new JSONObject();
        JSONObject col2 = new JSONObject();
        
        //json 배열 객체, 배열에 저장할때는 JSONArray()를 사용
        JSONArray title = new JSONArray();
        col1.put("label","카테고리"); //col1에 자료를 저장 ("필드이름","자료형")
        col1.put("type", "string");
        col2.put("label", "구매 금액");
        col2.put("type", "number");
        
        //테이블행에 컬럼 추가
        title.add(col1);
        title.add(col2);
        
        //json 객체에 타이틀행 추가
        data.put("cols", title);//제이슨을 넘김
        //이런형식으로 추가가된다. {"cols" : [{"label" : 월","type":"number"}
        //,{"label" : "금액", "type" : "number"}]}
        
        JSONArray body = new JSONArray(); //json 배열을 사용하기 위해 객체를 생성
        for (Buy dto : items) { //items에 저장된 값을 dto로 반복문을 돌려서 하나씩 저장한다.
            
            JSONObject category = new JSONObject(); //json오브젝트 객체를 생성
            category.put("v", dto.getCategoryinString()); //name변수에 dto에 저장된 주문일을 v라고 저장한다.
            
            JSONObject amount = new JSONObject(); //json오브젝트 객체를 생성
            amount.put("v", dto.getAmount()); //name변수에 dto에 저장된 금액을 v라고 저장한다.
            
            JSONArray row = new JSONArray(); //json 배열 객체 생성 (위에서 저장한 변수를 칼럼에 저장하기위해)
            row.add(category); //name을 row에 저장 (테이블의 행)
            row.add(amount); //name을 row에 저장 (테이블의 행)
            
            JSONObject cell = new JSONObject(); 
            cell.put("c", row); //cell 2개를 합쳐서 "c"라는 이름으로 추가
            body.add(cell); //레코드 1개 추가
                
        }
        data.put("rows", body); //data에 body를 저장하고 이름을 rows라고 한다.
        
        return data; //이 데이터가 넘어가면 json형식으로 넘어가게되서 json이 만들어지게 된다.
    }
    
    //[admin] charts index 7-1 스토어 매출 점유율 0827
    @Override
    public JSONObject getChartData13() {//제이슨 오브젝트를 리턴하는 것
    	// getChartData메소드를 호출하면
        //db에서 리스트 받아오고, 받아온걸로 json형식으로 만들어서 리턴을 해주게 된다.
    	//List<CartDTO> items = cartService.cartMoney();
    	//Map<String, Object> items = service.weeklyrevenue(); //이게 문젠가?
        List<Buy> items = service.storeshare(); //it works
    	//System.out.println(items.toString());
        //리턴할 json 객체
        JSONObject data = new JSONObject(); //{}
        
        //json의 칼럼 객체
        JSONObject col1 = new JSONObject();
        JSONObject col2 = new JSONObject();
        
        //json 배열 객체, 배열에 저장할때는 JSONArray()를 사용
        JSONArray title = new JSONArray();
        col1.put("label","스토어명"); //col1에 자료를 저장 ("필드이름","자료형")
        col1.put("type", "string");
        col2.put("label", "판매 금액");
        col2.put("type", "number");
        
        //테이블행에 컬럼 추가
        title.add(col1);
        title.add(col2);
        
        //json 객체에 타이틀행 추가
        data.put("cols", title);//제이슨을 넘김
        //이런형식으로 추가가된다. {"cols" : [{"label" : 월","type":"number"}
        //,{"label" : "금액", "type" : "number"}]}
        
        JSONArray body = new JSONArray(); //json 배열을 사용하기 위해 객체를 생성
        for (Buy dto : items) { //items에 저장된 값을 dto로 반복문을 돌려서 하나씩 저장한다.
            
            JSONObject category = new JSONObject(); //json오브젝트 객체를 생성
            category.put("v", dto.getCom_name()); //name변수에 dto에 저장된 주문일을 v라고 저장한다.
            
            JSONObject amount = new JSONObject(); //json오브젝트 객체를 생성
            amount.put("v", dto.getAmount()); //name변수에 dto에 저장된 금액을 v라고 저장한다.
            
            JSONArray row = new JSONArray(); //json 배열 객체 생성 (위에서 저장한 변수를 칼럼에 저장하기위해)
            row.add(category); //name을 row에 저장 (테이블의 행)
            row.add(amount); //name을 row에 저장 (테이블의 행)
            
            JSONObject cell = new JSONObject(); 
            cell.put("c", row); //cell 2개를 합쳐서 "c"라는 이름으로 추가
            body.add(cell); //레코드 1개 추가
                
        }
        data.put("rows", body); //data에 body를 저장하고 이름을 rows라고 한다.
        
        return data; //이 데이터가 넘어가면 json형식으로 넘어가게되서 json이 만들어지게 된다.
    }
    
    
    
    //[admin] charts index 7-2 상위 10개 스토어 (월 매출 기준)
    @Override
    public JSONObject getChartData14() {//제이슨 오브젝트를 리턴하는 것
    	// getChartData메소드를 호출하면
        //db에서 리스트 받아오고, 받아온걸로 json형식으로 만들어서 리턴을 해주게 된다.
    	//List<CartDTO> items = cartService.cartMoney();
    	//Map<String, Object> items = service.weeklyrevenue(); //이게 문젠가?
        List<Buy> items = service.toptenstores(); //it works
    	//System.out.println(items.toString());
        //리턴할 json 객체
        JSONObject data = new JSONObject(); //{}
        
        //json의 칼럼 객체
        JSONObject col1 = new JSONObject();
        JSONObject col2 = new JSONObject();
        
        //json 배열 객체, 배열에 저장할때는 JSONArray()를 사용
        JSONArray title = new JSONArray();
        col1.put("label","회사명"); //col1에 자료를 저장 ("필드이름","자료형")
        col1.put("type", "string");
        col2.put("label", "매출 총액(월)");
        col2.put("type", "number");
        
        //테이블행에 컬럼 추가
        title.add(col1);
        title.add(col2);
        
        //json 객체에 타이틀행 추가
        data.put("cols", title);//제이슨을 넘김
        //이런형식으로 추가가된다. {"cols" : [{"label" : 월","type":"number"}
        //,{"label" : "금액", "type" : "number"}]}
        
        JSONArray body = new JSONArray(); //json 배열을 사용하기 위해 객체를 생성
        for (Buy dto : items) { //items에 저장된 값을 dto로 반복문을 돌려서 하나씩 저장한다.
            
            JSONObject com_name = new JSONObject(); //json오브젝트 객체를 생성
            com_name.put("v", dto.getCom_name()); //name변수에 dto에 저장된 주문일을 v라고 저장한다.
            
            JSONObject amount = new JSONObject(); //json오브젝트 객체를 생성
            amount.put("v", dto.getAmount()); //name변수에 dto에 저장된 금액을 v라고 저장한다.
            
            JSONArray row = new JSONArray(); //json 배열 객체 생성 (위에서 저장한 변수를 칼럼에 저장하기위해)
            row.add(com_name); //name을 row에 저장 (테이블의 행)
            row.add(amount); //name을 row에 저장 (테이블의 행)
            
            JSONObject cell = new JSONObject(); 
            cell.put("c", row); //cell 2개를 합쳐서 "c"라는 이름으로 추가
            body.add(cell); //레코드 1개 추가
                
        }
        data.put("rows", body); //data에 body를 저장하고 이름을 rows라고 한다.
        
        return data; //이 데이터가 넘어가면 json형식으로 넘어가게되서 json이 만들어지게 된다.
    }
    
}
