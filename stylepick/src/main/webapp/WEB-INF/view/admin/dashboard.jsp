<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/WEB-INF/view/admin/dashboard.jsp  --%>
<%@ include file="/header/main.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Administrator - Dashboard</title>
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
google.charts.load('current', {'packages':['timeline']});
//로딩이 완료되면 drawChart 함수를 호출
google.setOnLoadCallback(drawChart); //라이브러리를 불러오는 작업이 완료되었으면 drawChart작업을 실행하라는 뜻.
google.setOnLoadCallback(drawChart2); //2nd chart
google.charts.setOnLoadCallback(drawChart3);//3rd chart
google.charts.setOnLoadCallback(drawChart4);//3th chart

function getRandomColor() {
    var letters = '0123456789ABCDEF'.split('');
    var color = '#';
    for (var i = 0; i < 6; i++ ) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}

    function drawChart() {
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
        
        var chart = new google.visualization.LineChart(document.getElementById('chart_div1')); //선 그래프
        //var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
                //차트 객체.draw(데이터 테이블, 옵션) //막대그래프
                
                //cuveType : "function" => 곡선처리
                
                //데이터를 가지고 (타이틀, 높이, 너비) 차트를 그린다.
		        var options = {
		        		title : "주간 매출",
	                    //curveType : "function", //curveType는 차트의 모양이 곡선으로 바뀐다는 뜻
	                    width : 600,
	                    height : 300
		              };
		            options.series={};
		            for(var i = 0;i < data.getNumberOfRows();i++){
		                options.series[i]={color:getRandomColor()}
		            }
		             chart.draw(data, options);
    }
    function drawChart2() {
        var jsonData = $.ajax({
        	url : "${path}/ajax/monthlyrevenue.shop",
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
        
        var chart = new google.visualization.LineChart(document.getElementById('chart_div2')); //선 그래프
        //var chart
        //  = new google.visualization.ColumnChart(document.getElementById('chart_div'));
                //차트 객체.draw(데이터 테이블, 옵션) //막대그래프
                
                //cuveType : "function" => 곡선처리
                
                //데이터를 가지고 (타이틀, 높이, 너비) 차트를 그린다.
                var options = {
                		title : "최근 4주 매출",
                        //curveType : "function", //curveType는 차트의 모양이 곡선으로 바뀐다는 뜻
                        width : 600,
                        height : 300
		              };
		            options.series={};
		            for(var i = 0;i < data.getNumberOfRows();i++){
		                options.series[i]={color:getRandomColor()}
		            }
		             chart.draw(data, options);
    }
    
    function drawChart3() {
        var container = document.getElementById('timeline');
        var chart = new google.visualization.Timeline(container);
        var dataTable = new google.visualization.DataTable();

        dataTable.addColumn({ type: 'string', id: 'President' });
        dataTable.addColumn({ type: 'date', id: 'Start' });
        dataTable.addColumn({ type: 'date', id: 'End' });
        dataTable.addRows([
          [ '여름바캉스 기획전', new Date(2020, 7, 20), new Date(2020, 8, 3) ],
          [ '스픽 친구초대 10% 할인 이벤트',     new Date(2020, 8, 1),  new Date(2020, 9, 31) ],
          [ '디자이너 편집샵 입점 기념 할인',      new Date(2020, 8, 9),  new Date(2020, 9, 9) ],
          [ '늦봄/초가을 아우터 신상 기획전',      new Date(2020, 8, 15),  new Date(2020, 9, 31) ],
          [ '간절기 특집 트렌드 언더 더블할인', 		new Date(2020, 9, 1),  new Date(2020, 10, 10) ]]);

        chart.draw(dataTable);
      }
    
    
    function drawChart4() {
        var data = google.visualization.arrayToDataTable([
          ['모자', '아우터', '원피스', '상의', '하의', '가방', '신발','시계'],
          ['2020/08',  3650,      4380,         5220,             6980,           4500,      6460,  5000],
          ['2020/09',  3350,      4200,        5990,             5680,          6880,      6820, 		4600],
          ['2020/10',  3570,      6670,        5870,             7070,           3970,      6230,  	6000],
          ['2020/11',  3390,      5100,        6150,             5680,           5150,      6940,  	7000],
          ['2020/12',  4360,      4910,         8290,             9500,          6900,      6200,  	9500]
        ]);

        var options = {
          //title : '하반기 스픽 카테고리별 매출 KPI (월 기준)',
          vAxis: {title: 'Revenue(천원)'},
          hAxis: {title: 'Month'},
          seriesType: 'bars',
          //series: {5: {type: 'line'}}
        };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div4'));
        chart.draw(data, options);
      }

});
</script>



</head>
<body>
	<div class="left-div" style="white-space:nowrap; width:10%; border-right:1px solid gray; float:left; text-align: center;">
			<ul>
				<li  id="admin_menu"><a href="../admin/dashboard.shop" style="color:skyblue;">대시보드</a></li><br>
				<li  id="admin_menu"><a href="../admin/widgets.shop">위젯</a></li><br>
				<li  id="admin_menu"><a href="../admin/charts.shop">차트</a></li><br>
				<li  id="admin_menu"><a href="../admin/list.shop">유저</a></li><br>
				<li  id="admin_menu"><a href="../admin/storelist.shop">스토어 관리</a></li><br>
				<li  id="admin_menu"><a href="../admin/salesmgr.shop">매출 관리</a></li><br>
				<li  id="admin_menu"><a href="../board/qna.shop">고객센터</a></li>
			</ul>
	</div>
	<!-- 우측 div : 메인 컨텐츠-->
	<div class="right-div" style="width: 80%; margin-left: 3%;  padding: 1%; float:left; background-color: '#FAFAFA';">
		<h3>DashBoard</h3><br>
		
		<!-- 1. 지표 요약 -->
		<div class="outer_frame" style="margin-bottom: 50px;">
			<div class="quarter_frame skyblue">
				<fmt:formatNumber value="${salesofthismonth}" pattern="#,###" /> 원
				<p class="smaller_size">이번 달 매출</p>
			</div>
			<div class="quarter_frame green">
				<fmt:formatNumber value="${newusers}" pattern="#,###" />명
				<p class="smaller_size">이번달 신규회원</p>
			</div>
			<div class="quarter_frame yellow">
				<fmt:formatNumber value="${numofusers}" pattern="#,###" />명
				<p class="smaller_size">스타일픽 전체 회원</p>
			</div>
			<div class="quarter_frame red">
				<div>
					<span style="font-size: xx-small; font-weight: normal;">누적 매출</span>  <fmt:formatNumber value="${totalrevenue}" pattern="#,###" /> KRW
				</div>
				<div>
					<span style="font-size: xx-small;font-weight: normal;">누적 리뷰</span>   <fmt:formatNumber value="${numofreviews}" pattern="#,###" /> Reviews
				</div>
			</div>
			
		</div>
		<!-- outer_frame -->
		<br><br>
		
		<!-- 1. 매출 요약 -->
		<div class="outer_frame" style="margin-bottom: 30px;">
			
			<!-- 주간매출 바그래프 -->
			<div class="double_frame">
				<h5 style="font-size: medium;">스타일픽 주 매출 집계(일기준)</h5>
				<!--Table and divs that hold the pie charts-->
			    <!-- <div id="numGraph1_div" style="border: 1px solid #ccc"></div> -->
			    <div id="chart_div1"></div>
			</div>
			
			<!-- 최근 4주간 매출 추이 그래프 -->
			<div class="double_frame">
			<h5 style="font-size: medium;">스타일픽 최근 4주 매출 (주기준)</h5>
			<div id="chart_div2"></div>
			<!-- <div id="numGraph2_div" style="border: 1px solid #ccc"></div> -->
			</div>
			<!-- 최근 4주간 매출 추이 그래프의 끝 -->
			<br><br><br><br>
		</div> <!-- outer_frame -->
		<div id="mint_square"></div> 스타일픽 패션 기획전 일정<br>
		<div style="padding : 5%;">
			<div id="timeline" style="height: 270px; width: 95%;"></div>
		</div>
		<div id="mint_square"></div>하반기 카테고리별 매출 KPI (월 기준)<br>
		<div id="chart_div4" style="height : 500px; width: 95%;"></div>
	<!-- right_div -->
<br><br><br><br><br><br><br><br><br><br><br><br>
		
</body>
</html>

 <!-- 차트 새로고침 버튼 -->
<!--  <button id="btn" type="button" onclick="drawChart()">refresh</button> --> 
