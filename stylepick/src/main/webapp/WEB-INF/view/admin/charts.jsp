<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/WEB-INF/view/admin/widgets.jsp  --%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<meta charset="UTF-8">
<title>Administrator - Charts</title>
<script src="${path}/assets/board/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
	function graph_open(url) {
		var op = "width=800,height=800,scrollbars=yes,left=50,top=150";
		window.open(url+".shop","graph",op);
	}
</script>
<script type="text/javascript" src="http://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- 구글 차트 호출을 위한 js 파일 -->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script>
//구글 차트 라이브러리 로딩
$(function() {
//google객체는 위쪽 google src안에 들어있음
google.load('visualization','1',{
    'packages' : ['corechart']
});
google.charts.load('current', {'packages':['treemap']});
//로딩이 완료되면 drawChart 함수를 호출
google.setOnLoadCallback(drawChart1); //라이브러리를 불러오는 작업이 완료되었으면 drawChart작업을 실행하라는 뜻.
google.setOnLoadCallback(drawChart2);
google.setOnLoadCallback(drawChart3);
google.setOnLoadCallback(drawChart4);
//google.setOnLoadCallback(drawChart5);
google.setOnLoadCallback(drawChart6);
google.setOnLoadCallback(drawChart7);
google.setOnLoadCallback(drawChart8);
google.setOnLoadCallback(drawChart9);
google.setOnLoadCallback(drawChart10);

function getRandomColor() {
    var letters = '0123456789ABCDEF'.split('');
    var color = '#';
    for (var i = 0; i < 6; i++ ) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}

//charts index 1 스타일픽 회원 수 0818
	function drawChart1() {
	    var jsonData = $.ajax({
	    	url : "${path}/ajax/totnumofusers.shop",
	    	//chart01에서는 json의 주소를 직접 적었지만 이 페이지에서는 컨트롤러로 이동해 맵핑해서 제이슨을 동적으로
	        //직접만들어 그 만든 json을 직접 보낸다.
	    	dataType : "json",
	    	async : false,
	    }).responseText; //제이슨파일을 text파일로 읽어들인다는 뜻
	    console.log(jsonData);
	    //데이터테이블 생성
	    var data = new google.visualization.DataTable(jsonData);
	    //제이슨 형식을 구글의 테이블 형식으로 바꿔주기 위해서 집어넣음
	    //차트를 출력할 div
	    //LineChart, ColumnChart, PieChart에 따라서 차트의 형식이 바뀐다.
	    
	    //var chart = new google.visualization.PieChart(
	            //document.getElementByld('chart_div')); //원형 그래프
	    
	    //var chart = new google.visualization.LineChart(document.getElementById('chart_div2')); //선 그래프
	    var chart = new google.visualization.ColumnChart(document.getElementById('chart_div1'));
	            //차트 객체.draw(데이터 테이블, 옵션) //막대그래프
	            
	            //cuveType : "function" => 곡선처리
	            
	            //데이터를 가지고 (타이틀, 높이, 너비) 차트를 그린다.
			    var options = {
			    		title : "스타일픽 회원",
		                //curveType : "function", //curveType는 차트의 모양이 곡선으로 바뀐다는 뜻
		                width : 500,
		                height : 300
		              };
		            options.series={};
		            for(var i = 0;i < data.getNumberOfRows();i++){
		                options.series[i]={color:getRandomColor()}
		            }
		             chart.draw(data, options);

	}

	//charts index 2 Weekly : 일자별 매출 현황 0818
    function drawChart2() {
        var jsonData = $.ajax({
        	url : "${path}/ajax/weeklyrevenue.shop",
        	//chart01에서는 json의 주소를 직접 적었지만 이 페이지에서는 컨트롤러로 이동해 맵핑해서 제이슨을 동적으로
            //직접만들어 그 만든 json을 직접 보낸다.

        	//chart01에서 쓰던 방식 url : "${path}/json/sampleData.json",
            //json에 sampleData.json파일을 불러온다.
            //확장자가 json이면 url 맵핑을 꼭 해주어야 한다. 안해주면 자바파일인줄 알고 404에러가 발생한다.
            //그렇기 때문에 servlet-context파일에서 리소스를 맵핑해준다
        	dataType : "json",
        	async : false,
        }).responseText; //제이슨파일을 text파일로 읽어들인다는 뜻
        console.log(jsonData);
        //데이터테이블 생성
        var data = new google.visualization.DataTable(jsonData);
        //제이슨 형식을 구글의 테이블 형식으로 바꿔주기 위해서 집어넣음
        //차트를 출력할 div
        //LineChart, ColumnChart, PieChart에 따라서 차트의 형식이 바뀐다.
        
        //var chart = new google.visualization.PieChart(
                //document.getElementByld('chart_div')); //원형 그래프
        
        var chart = new google.visualization.LineChart(document.getElementById('chart_div2')); //선 그래프
        //var chart
        //  = new google.visualization.ColumnChart(document.getElementById('chart_div'));
                //차트 객체.draw(데이터 테이블, 옵션) //막대그래프
                
                //cuveType : "function" => 곡선처리
                
                //데이터를 가지고 (타이틀, 높이, 너비) 차트를 그린다.     
                var options = {
                		title : "주간 매출(최근 7일)",
                        //curveType : "function", //curveType는 차트의 모양이 곡선으로 바뀐다는 뜻
                        width : 900,
                        height : 300
		              };
		            options.series={};
		            for(var i = 0;i < data.getNumberOfRows();i++){
		                options.series[i]={color:getRandomColor()}
		            }
		             chart.draw(data, options);
    }
	//charts index 3 Yearly : 연 매출 현황 0818
    function drawChart3() {
        var jsonData = $.ajax({
        	url : "${path}/ajax/yearlyrevenue.shop",
        	//chart01에서는 json의 주소를 직접 적었지만 이 페이지에서는 컨트롤러로 이동해 맵핑해서 제이슨을 동적으로
            //직접만들어 그 만든 json을 직접 보낸다.
        	dataType : "json",
        	async : false,
        }).responseText; //제이슨파일을 text파일로 읽어들인다는 뜻
        console.log(jsonData);
        //데이터테이블 생성
        var data = new google.visualization.DataTable(jsonData);
        //제이슨 형식을 구글의 테이블 형식으로 바꿔주기 위해서 집어넣음
        //차트를 출력할 div
        //LineChart, ColumnChart, PieChart에 따라서 차트의 형식이 바뀐다.
        
        //var chart = new google.visualization.PieChart(
                //document.getElementByld('chart_div')); //원형 그래프
        
        var chart = new google.visualization.LineChart(document.getElementById('chart_div3')); //선 그래프
        //var chart
        //  = new google.visualization.ColumnChart(document.getElementById('chart_div'));
                //차트 객체.draw(데이터 테이블, 옵션) //막대그래프
                
                //cuveType : "function" => 곡선처리
                
                //데이터를 가지고 (타이틀, 높이, 너비) 차트를 그린다.
		        var options = {
		        		title : "연 매출(1년)",
	                    //curveType : "function", //curveType는 차트의 모양이 곡선으로 바뀐다는 뜻
	                    width : 900,
	                    height : 300
		              };
		            options.series={};
		            for(var i = 0;i < data.getNumberOfRows();i++){
		                options.series[i]={color:getRandomColor()}
		            }
		             chart.draw(data, options);

    }
    //charts index 4-1 지역별 매출 평균 boxplot
    function drawChart4() {
        var jsonData = $.ajax({
        	url : "${path}/ajax/boxplot.shop",
        	//chart01에서는 json의 주소를 직접 적었지만 이 페이지에서는 컨트롤러로 이동해 맵핑해서 제이슨을 동적으로
            //직접만들어 그 만든 json을 직접 보낸다.
        	dataType : "json",
        	async : false,
        }).responseText; //제이슨파일을 text파일로 읽어들인다는 뜻
        console.log(jsonData);        
        
        //데이터테이블 생성
        var data = new google.visualization.DataTable(jsonData);
        //제이슨 형식을 구글의 테이블 형식으로 바꿔주기 위해서 집어넣음
        
        var data = google.visualization.arrayToDataTable([
               ['광주 서구', 45000, 22000, 10000, 40000],
               ['서울시 강서', 30000, 38000, 55000, 66000],
               ['서울시 금천', 50000, 50500, 77000, 80000],
               ['서울시 성동', 77000, 77000, 66000, 50000],
               ['서울시 양천', 68000, 66000, 22000, 15000]
               // Treat first row as data as well.
            ], true);
        
        
        //차트를 출력할 div
        //LineChart, ColumnChart, PieChart에 따라서 차트의 형식이 바뀐다.
        
        var chart = new google.visualization.CandlestickChart(document.getElementById('chart_div4'));
        //var chart = new google.visualization.PieChart(document.getElementByld('chart_div')); //원형 그래프
        // var chart = new google.visualization.ScatterChart(document.getElementById('chart_div6')); //scatter plot
        //var chart = new google.visualization.LineChart(document.getElementById('chart_div5')); //선 그래프
        //var chart = new google.visualization.ColumnChart(document.getElementById('chart_div')); //막대그래프
        //차트 객체.draw(데이터 테이블, 옵션)
        //cuveType : "function" => 곡선처리
                
                //데이터를 가지고 (타이틀, 높이, 너비) 차트를 그린다.
                var options = {
                		 title : "지역구 별 매출 boxplot",
                         //curveType : "function", //curveType는 차트의 모양이 곡선으로 바뀐다는 뜻
                         width : 900,
                         height : 300,
                         seriesType: 'candlesticks',
                         hAxis: {title: '지역구'},
                         vAxis: {title: '구매 금액'}
                         //series: {2: {type: "line"}}
                         //hAxis: {title: '가입연월', minValue: 0}, // maxValue: 15
                         //vAxis: {title: '구매 금액', minValue: 0},
                         //legend: 'none',
		              };
		            options.series={};
		            for(var i = 0;i < data.getNumberOfRows();i++){
		                options.series[i]={color:getRandomColor()}
		            }
		             chart.draw(data, options); 	
    }
    
    //charts index 4-2 지역별 매출 평균 >later drawChart5
    
    //charts index 5 구매건 기준 매출 산점도
    function drawChart6() {
        var jsonData = $.ajax({
        	url : "${path}/ajax/scatterplot.shop",
        	//chart01에서는 json의 주소를 직접 적었지만 이 페이지에서는 컨트롤러로 이동해 맵핑해서 제이슨을 동적으로
            //직접만들어 그 만든 json을 직접 보낸다.
        	dataType : "json",
        	async : false,
        }).responseText; //제이슨파일을 text파일로 읽어들인다는 뜻
        console.log(jsonData);        
        
        //데이터테이블 생성
        var data = new google.visualization.DataTable(jsonData);
        //제이슨 형식을 구글의 테이블 형식으로 바꿔주기 위해서 집어넣음
        //차트를 출력할 div
        //LineChart, ColumnChart, PieChart에 따라서 차트의 형식이 바뀐다.
        /*
        var data = google.visualization.arrayToDataTable([
          ['Age', 'Weight'],
          [ 8,      12],
          [ 4,      5.5],
          [ 11,     14],
          [ 4,      5],
          [ 3,      3.5],
          [ 6.5,    7]
        ]);
        */
        
        //var chart = new google.visualization.PieChart(document.getElementByld('chart_div')); //원형 그래프
        var chart = new google.visualization.ScatterChart(document.getElementById('chart_div6')); //scatter plot
        //var chart = new google.visualization.LineChart(document.getElementById('chart_div5')); //선 그래프
        //var chart = new google.visualization.ColumnChart(document.getElementById('chart_div')); //막대그래프
        //차트 객체.draw(데이터 테이블, 옵션)
        //cuveType : "function" => 곡선처리
                
                //데이터를 가지고 (타이틀, 높이, 너비) 차트를 그린다.
                var options = {
                		title : "가입연월 대비 구매금액",
                        //curveType : "function", //curveType는 차트의 모양이 곡선으로 바뀐다는 뜻
                        width : 900,
                        height : 300,
                        hAxis: {title: '가입연월', minValue: 0}, // maxValue: 15
                        vAxis: {title: '구매 금액', minValue: 0},
                        legend: 'none',
		              };
		            options.series={};
		            for(var i = 0;i < data.getNumberOfRows();i++){
		                options.series[i]={color:getRandomColor()}
		            }
		             chart.draw(data, options);
    }
    
  	//charts index 6-1 카테고리별 판매 현황(월)
    function drawChart7() {
        var jsonData = $.ajax({
        	url : "${path}/ajax/salesbycategories.shop",
        	//chart01에서는 json의 주소를 직접 적었지만 이 페이지에서는 컨트롤러로 이동해 맵핑해서 제이슨을 동적으로
            //직접만들어 그 만든 json을 직접 보낸다.
        	dataType : "json",
        	async : false,
        }).responseText; //제이슨파일을 text파일로 읽어들인다는 뜻
        console.log(jsonData);
        //데이터테이블 생성
        var data = new google.visualization.DataTable(jsonData);
        //제이슨 형식을 구글의 테이블 형식으로 바꿔주기 위해서 집어넣음
        //차트를 출력할 div
        //LineChart, ColumnChart, PieChart에 따라서 차트의 형식이 바뀐다.
        
        var chart = new google.visualization.PieChart(document.getElementById('chart_div7')); //pie plot
        //var chart = new google.visualization.ScatterChart(document.getElementById('chart_div7')); //scatter plot
        //var chart = new google.visualization.LineChart(document.getElementById('chart_div5')); //선 그래프
        //var chart = new google.visualization.ColumnChart(document.getElementById('chart_div')); //막대그래프
        //차트 객체.draw(데이터 테이블, 옵션)
        //cuveType : "function" => 곡선처리
                
                //데이터를 가지고 (타이틀, 높이, 너비) 차트를 그린다.
       var options = {
          title: '이달의 구매 카테고리 비율',
          //is3D: true,
          width:300,
          height:300
        };
       chart.draw(data, options);

    }
  	
  	//charts index 6-2 카테고리별 판매 현황(월)
    function drawChart8() {
        var jsonData = $.ajax({
        	url : "${path}/ajax/salesbycategories.shop", //안만듦
        	//chart01에서는 json의 주소를 직접 적었지만 이 페이지에서는 컨트롤러로 이동해 맵핑해서 제이슨을 동적으로
            //직접만들어 그 만든 json을 직접 보낸다.
        	dataType : "json",
        	async : false,
        }).responseText; //제이슨파일을 text파일로 읽어들인다는 뜻
        console.log(jsonData);
        //데이터테이블 생성
        var data = new google.visualization.DataTable(jsonData);
        //제이슨 형식을 구글의 테이블 형식으로 바꿔주기 위해서 집어넣음
        //차트를 출력할 div
        //LineChart, ColumnChart, PieChart에 따라서 차트의 형식이 바뀐다.
        
        var data = google.visualization.arrayToDataTable([
	        ['Genre', 'Fantasy & Sci Fi', 'Romance', 'Mystery/Crime', 'General',
	         'Western', 'Literature', { role: 'annotation' } ],
	        ['2010', 10, 24, 20, 32, 18, 5, ''],
	        ['2020', 16, 22, 23, 30, 16, 9, ''],
	        ['2030', 28, 19, 29, 30, 12, 13, '']
      	]);
        
        //var chart = new google.visualization.PieChart(document.getElementById('chart_div')); //pie plot
        //var chart = new google.visualization.ScatterChart(document.getElementById('chart_div')); //scatter plot
        //var chart = new google.visualization.LineChart(document.getElementById('chart_div')); //선 그래프
        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div8')); //막대그래프
        //차트 객체.draw(데이터 테이블, 옵션)
        //cuveType : "function" => 곡선처리
                
                //데이터를 가지고 (타이틀, 높이, 너비) 차트를 그린다.
       var options = {
          title: '월별 구매금액(카테고리 구분)',
          width:300,
          height:300,
          bar: { groupWidth: '75%' },
          isStacked: true
        };
       chart.draw(data, options);

    }
  	
  	//charts index 7-1 스토어 매출 점유율
    function drawChart9() {
        var jsonData = $.ajax({
        	url : "${path}/ajax/storeshare.shop", //안만듦
        	//chart01에서는 json의 주소를 직접 적었지만 이 페이지에서는 컨트롤러로 이동해 맵핑해서 제이슨을 동적으로
            //직접만들어 그 만든 json을 직접 보낸다.
        	dataType : "json",
        	async : false,
        }).responseText; //제이슨파일을 text파일로 읽어들인다는 뜻
        console.log(jsonData);
        //데이터테이블 생성
        var data = new google.visualization.DataTable(jsonData);
        //제이슨 형식을 구글의 테이블 형식으로 바꿔주기 위해서 집어넣음
        //차트를 출력할 div
        //LineChart, ColumnChart, PieChart에 따라서 차트의 형식이 바뀐다.
        
        var chart = new google.visualization.PieChart(document.getElementById('chart_div9')); //pie plot
        //var chart = new google.visualization.ScatterChart(document.getElementById('chart_div7')); //scatter plot
        //var chart = new google.visualization.LineChart(document.getElementById('chart_div5')); //선 그래프
        //var chart = new google.visualization.ColumnChart(document.getElementById('chart_div')); //막대그래프
        //차트 객체.draw(데이터 테이블, 옵션)
        //cuveType : "function" => 곡선처리
                
                //데이터를 가지고 (타이틀, 높이, 너비) 차트를 그린다.
       var options = {
          title: '스토어 매출 쉐어',
          //is3D: true,
          width:300,
          height:300
        };
       chart.draw(data, options);

    }
 	 //charts index 7-2 상위 10개 스토어 (월 매출 기준)
    function drawChart10() {
        var jsonData = $.ajax({
        	url : "${path}/ajax/toptenstores.shop",
        	//chart01에서는 json의 주소를 직접 적었지만 이 페이지에서는 컨트롤러로 이동해 맵핑해서 제이슨을 동적으로
            //직접만들어 그 만든 json을 직접 보낸다.
        	dataType : "json",
        	async : false,
        }).responseText; //제이슨파일을 text파일로 읽어들인다는 뜻
        console.log(jsonData);
        //데이터테이블 생성
        var data = new google.visualization.DataTable(jsonData);
        //제이슨 형식을 구글의 테이블 형식으로 바꿔주기 위해서 집어넣음
        //차트를 출력할 div
        //LineChart, ColumnChart, PieChart에 따라서 차트의 형식이 바뀐다.
        
       	//var chart = new google.visualization.PieChart(document.getElementById('chart_div7')); //pie plot
        //var chart = new google.visualization.ScatterChart(document.getElementById('chart_div7')); //scatter plot
        //var chart = new google.visualization.LineChart(document.getElementById('chart_div5')); //선 그래프
        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div10')); //막대그래프
        //차트 객체.draw(데이터 테이블, 옵션)
        //cuveType : "function" => 곡선처리
                
      //데이터를 가지고 (타이틀, 높이, 너비) 차트를 그린다.
        var options = {
        		 title: '상위 10개 스토어 (월 매출 기준)',
                 width:300,
                 height:300
              };
            options.series={};
            for(var i = 0;i < data.getNumberOfRows();i++){
                options.series[i]={color:getRandomColor()}
            }
             chart.draw(data, options);
    }


});
</script>


</head>
<body>
	<div class="left-div" style="white-space:nowrap; width:10%; border-right:1px solid gray; float:left; text-align: center;">
			<ul>
				<li  id="admin_menu"><a href="../admin/dashboard.shop">대시보드</a></li><br>
				<li  id="admin_menu"><a href="../admin/widgets.shop">위젯</a></li><br>
				<li  id="admin_menu"><a href="../admin/charts.shop" style="color:skyblue;">차트</a></li><br>
				<li  id="admin_menu"><a href="../admin/list.shop">유저</a></li><br>
				<li  id="admin_menu"><a href="../admin/storelist.shop">스토어 관리</a></li><br>
				<li  id="admin_menu"><a href="../admin/salesmgr.shop">매출 관리</a></li><br>
				<li  id="admin_menu"><a href="../board/qna.shop">고객센터</a></li>
			</ul>
	</div>
	<!-- 우측 div : 메인 컨텐츠-->
	<div class="right-div" style="width: 80%; margin-left: 3%;  padding: 1%; float:left; background-color: '#FAFAFA';">
		<h3>Charts</h3><br>
		
		<h4 style="text-align: center; margin-bottom: 50px;">Stylepick Sales Report</h4>
		<br>
		
		<h5 style="font-weight: bold; font-size: large; margin-bottom: 30px;">1. 회원 및 매출 현황</h5>
		<div>
			<div id="mint_square"></div> 회원현황
			<br>
			<div id="chart_div1"></div>
		</div>
		<br>
		<div>
			<div id="mint_square"></div> Weekly : 일자별 매출 현황
			<br>
			<div id="chart_div2"></div>
		</div>
		<br>
		<div>
			<div id="mint_square"></div> Yearly : 월별 매출 현황
			<br>
			<div id="chart_div3"></div>
		</div>
		<br>
		
		<h5 style="font-weight: bold; font-size: large; margin: 30px 0 30px 0;">2. 매출 구분 상세</h5>
		<div>
			<div id="mint_square"></div> 지역별 매출 평균
			<br>
			<div id="chart_div4"></div>
			<div id="chart_div5"></div>
		</div>
		<br>
		<div>
			<div id="mint_square"></div> 가입일자 기준 매출 (최근 1년)
			<br>
			<div id="chart_div6"></div>
		</div>
		<br>
		<div>
			<div id="mint_square"></div> 카테고리 별 판매 현황(월)
			<br>
			<div style="width: 1200px; overflow: hidden;">
				<div id="chart_div7" style="float: left;"></div>
				<!-- <div id="chart_div8" style="float: left;"></div> -->
			</div>
		</div>
		<br>
		<div>
			<div id="mint_square"></div> 스토어 매출 점유율
			<br>
			<div style="width: 1200px; overflow: hidden;">
				 
				<div id="chart_div9" style="float: left;"></div>
				<div id="chart_div10" style="float: left;"></div>
			</div>
		</div>
		<br>
		
	</div>
	<!-- right_div -->
<br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>