<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/WEB-INF/view/admin/widgets.jsp  --%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<meta charset="UTF-8">
<title>Administrator - Widgets</title>
<!-- <script src="${path}/assets/board/js/jquery-3.3.1.min.js"></script> -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	//로딩이 완료되면 drawChart 함수를 호출
	google.setOnLoadCallback(drawRankingChart1); //라이브러리를 불러오는 작업이 완료되었으면 drawChart작업을 실행하라는 뜻.
	google.setOnLoadCallback(drawRankingChart2); //라이브러리를 불러오는 작업이 완료되었으면 drawChart작업을 실행하라는 뜻.
	google.setOnLoadCallback(drawRankingChart3); //라이브러리를 불러오는 작업이 완료되었으면 drawChart작업을 실행하라는 뜻.
	
	function getRandomColor() {
	    var letters = '0123456789ABCDEF'.split('');
	    var color = '#';
	    for (var i = 0; i < 6; i++ ) {
	        color += letters[Math.floor(Math.random() * 16)];
	    }
	    return color;
	}
	
	
	//[admin] widgets index 2-1 이번 달 최다 구매 회원 랭킹
	function drawRankingChart1() {
		var jsonData = $.ajax({
			url : "${path}/ajax/monthlyheavyusers.shop",
        	//컨트롤러로 이동해 (specified url을) 맵핑해서 제이슨을 동적으로
            //직접만들어 그 만든 json을 직접 보낸다.
        	dataType : "json",
        	async : false,
		}).responseText; //제이슨파일을 text파일로 읽어들인다는 뜻
		console.log(jsonData);
		 //데이터테이블 생성
        //var data = new google.visualization.arrayToDataTable(jsonData); //이거아님
		 var data = new google.visualization.DataTable(jsonData); //jackson 에서 옮기려면 이거로만써야함
        //제이슨 형식을 구글의 테이블 형식으로 바꿔주기 위해서 집어넣음
        //차트를 출력할 div
        //LineChart, ColumnChart, PieChart에 따라서 차트의 형식이 바뀐다.
        var chart = new google.visualization.BarChart(document.getElementById('chart_div_widgets1'));
       //차트 객체.draw(데이터 테이블, 옵션) //막대그래프
       //chart.draw(data, options);
       
      //데이터를 가지고 (타이틀, 높이, 너비) 차트를 그린다.
        var options = {
        		title : "이번 달 최다 구매 회원 순위",
                //width : 500,
                //height : 300
                chartArea: {width: '50%'},
                hAxis: {
                  title: '구매 금액(원)',
                  minValue: 0
                },
                vAxis: {
                  title: '아이디'
                }
              };
            options.series={};
            for(var i = 0;i < data.getNumberOfRows();i++){
                options.series[i]={color:getRandomColor()}
            }
             chart.draw(data, options);
	}
	
	//[admin] widgets index 2-2 올해 최다 구매 회원 랭킹
	function drawRankingChart2() {
		var jsonData = $.ajax({
			url : "${path}/ajax/yearlyheavyusers.shop",
        	//컨트롤러로 이동해 (specified url을) 맵핑해서 제이슨을 동적으로
            //직접만들어 그 만든 json을 직접 보낸다.
        	dataType : "json",
        	async : false,
		}).responseText; //제이슨파일을 text파일로 읽어들인다는 뜻
		console.log(jsonData);
		 //데이터테이블 생성
        //var data = new google.visualization.arrayToDataTable(jsonData); //이거아님
		 var data = new google.visualization.DataTable(jsonData); //jackson 에서 옮기려면 이거로만써야함
        //제이슨 형식을 구글의 테이블 형식으로 바꿔주기 위해서 집어넣음
        //차트를 출력할 div
        //LineChart, ColumnChart, PieChart에 따라서 차트의 형식이 바뀐다.
        var chart = new google.visualization.BarChart(document.getElementById('chart_div_widgets2'));
       //차트 객체.draw(데이터 테이블, 옵션) //막대그래프
       //chart.draw(data, options);
       
      //데이터를 가지고 (타이틀, 높이, 너비) 차트를 그린다.
        var options = {
        		title : "올해의 최다 구매 회원 순위",
                //width : 500,
                //height : 300
                chartArea: {width: '50%'},
                hAxis: {
                  title: '구매 금액(원)',
                  minValue: 0
                },
                vAxis: {
                  title: '아이디'
                }
              };
            options.series={};
            for(var i = 0;i < data.getNumberOfRows();i++){
                options.series[i]={color:getRandomColor()}
            }
             chart.draw(data, options);
      

	}

	//[admin] widgets index 3-1 우수 입점 스토어 차트
	function drawRankingChart3() {
		var jsonData = $.ajax({
			url : "${path}/ajax/topthreestores.shop",
        	//컨트롤러로 이동해 (specified url을) 맵핑해서 제이슨을 동적으로
            //직접만들어 그 만든 json을 직접 보낸다.
        	dataType : "json",
        	async : false,
		}).responseText; //제이슨파일을 text파일로 읽어들인다는 뜻
		console.log(jsonData);
		 //데이터테이블 생성
        //var data = new google.visualization.arrayToDataTable(jsonData); //이거아님
		 var data = new google.visualization.DataTable(jsonData); //jackson 에서 옮기려면 이거로만써야함
        //제이슨 형식을 구글의 테이블 형식으로 바꿔주기 위해서 집어넣음
        //차트를 출력할 div
        //LineChart, ColumnChart, PieChart에 따라서 차트의 형식이 바뀐다.
        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div_widgets3')); //선 그래프
       //차트 객체.draw(데이터 테이블, 옵션) //막대그래프
       //chart.draw(data, options);
       
      //데이터를 가지고 (타이틀, 높이, 너비) 차트를 그린다.
      
      var options = {
          title: '우수입점스토어 (최근 4주 기준)',
          hAxis: {
              title: '별점 평균',
              minValue: 0
            },
            vAxis: {
              title: '스토어명'
            },
          chartArea: {width: '50%'}
        };
      options.series={};
      for(var i = 0;i < data.getNumberOfRows();i++){
          options.series[i]={color:getRandomColor()}
      }
       chart.draw(data, options);

	}
	
	
});//onload function
</script>

<script type="text/javascript">
google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawMultSeries);

function drawMultSeries() {
      var data = google.visualization.arrayToDataTable([
        ['City', '2010 Population', '2000 Population'],
        ['New York City, NY', 8175000, 8008000],
        ['Los Angeles, CA', 3792000, 3694000],
        ['Chicago, IL', 2695000, 2896000],
        ['Houston, TX', 2099000, 1953000],
        ['Philadelphia, PA', 1526000, 1517000]
      ]);

      var options = {
        title: 'Population of Largest U.S. Cities',
        chartArea: {width: '50%'},
        hAxis: {
          title: 'Total Population',
          minValue: 0
        },
        vAxis: {
          title: 'City'
        }
      };
      var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
      chart.draw(data, options);
    }
</script>
</head>
<body>
	<div class="left-div" style="white-space:nowrap; width:10%; border-right:1px solid gray; float:left; text-align: center;">
			<ul>
				<li  id="admin_menu"><a href="../admin/dashboard.shop">대시보드</a></li><br>
				<li  id="admin_menu"><a href="../admin/widgets.shop" style="color:skyblue;">위젯</a></li><br>
				<li  id="admin_menu"><a href="../admin/charts.shop">차트</a></li><br>
				<li  id="admin_menu"><a href="../admin/list.shop">유저</a></li><br>
				<li  id="admin_menu"><a href="#">스토어 관리</a></li><br>
				<li  id="admin_menu"><a href="#">매출 관리</a></li><br>
				<li  id="admin_menu"><a href="../board/qna.shop">고객센터</a></li>
			</ul>
	</div>
	<!-- 우측 div : 메인 컨텐츠-->
	<div class="right-div" style="width: 80%; margin-left: 3%;  padding: 1%; float:left; background-color: '#FAFAFA';">
		<h3>Widgets</h3><br>

		<h5 style="text-align: center">Catch up with the Trend in Stylepick</h5>
		<br>
		<!-- 1. 최근 기록 -->
		<div class="outer_frame">
			<!-- Daily Sales Report -->
			<div class="double_frame" style="">
				Daily Sales Report	
				<!-- Daily Sales Report Table -->
				<table class="admin_table">
					<tr class="admin_table">
						<th class="admin_table_th">오더 번호</th><th class="admin_table_th">구매일</th><th class="admin_table_th">아이디</th><th class="admin_table_th">구매 금액</th>
					</tr>
					<c:forEach var="sales" items="${saleslist}">
						<tr class="admin_table">
							<td class="admin_table">${sales.order_no}</td>
							<td class="admin_table"><fmt:formatDate value="${sales.orderdate}" pattern="yyyy-MM-dd HH:mm" /></td>
							<td class="admin_table">${sales.userid}</td>
							<td class="admin_table"><fmt:formatNumber value="${sales.amount}" pattern="#,###" /> KRW</td>
						</tr>
					</c:forEach>
				</table>
				<!-- Daily Sales Report Table의 끝-->
			</div>
			<!--Recently Joined Users -->
			<div class="double_frame" style="">
				Recently Joined Users
				<!-- Recently Joined Users Table -->
				<table class="admin_table">
					<tr class="admin_table">
						<th class="admin_table_th">회원 번호</th><th class="admin_table_th">가입일</th><th class="admin_table_th">아이디</th><th class="admin_table_th">성별</th><th class="admin_table_th">나이</th>
					</tr>
					<c:forEach var="users" items="${userslist}">
						<tr class="admin_table">
							<td class="admin_table">${users.no}</td>
							<td class="admin_table"><fmt:formatDate value="${users.regdate}" pattern="yyyy-MM-dd HH:mm" /></td>
							<td class="admin_table">${users.userid}</td>
							<td class="admin_table">
								<c:choose>
									<c:when test="${users.gender eq '1'}">남자</c:when>
									<c:when test="${users.gender eq '2'}">여자</c:when>
									<c:otherwise>-</c:otherwise>
								</c:choose>
							</td>
							<td class="admin_table">
								<c:choose>
									<c:when test="${users.age eq '0'}">-</c:when>
									<c:when test="${users.age > 0}">${users.age}</c:when>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</table>
				<!-- Recently Joined Users Table의 끝-->
			</div>
			<br>
		</div>
		<br><br>
		
		<!-- 2. 스픽 구매랭킹 -->
		<div id="mint_square"></div>
		<p style="font-weight: bold;">스타일픽 구매 RANK</p>
		<div class="outer_frame">
			<!-- 이번 달 스픽에서 가장 구매를 많이 한 회원 -->
			<%
			Date today = new Date();         
			SimpleDateFormat date = new SimpleDateFormat("yyyy년MM월");
			SimpleDateFormat date2 = new SimpleDateFormat("yyyy년");
			String toDay = date.format(today);
			String thisyear = date2.format(today);
			 %>
			<div class="double_frame" style="">
				<%=toDay%> 스타일픽 최다 구매 회원 리스트 TOP 10
				<div id="chart_div_widgets1"></div>
			</div>
			<!--올해 스픽에서 가장 구매를 많이 한 회원 -->
			<div class="double_frame" style="">
				<%=thisyear%> 스타일픽 최다 구매 회원 리스트 TOP 10
				<div id="chart_div_widgets2"></div>
			</div>
			<br>
		</div>
		
		<!-- 3. 우수 입점 스토어 -->
		<div id="mint_square"></div>
		<p style="font-weight: bold;">우수 입점 스토어 (별점 기준)</p>
		<div class="outer_frame">
			<!-- 별점 추이 차트 -->
			<div class="double_frame" style="">
				<div id="chart_div_widgets3"></div>
			</div>
			<!--우수 입점스토어 상위 3개 업체 -->
			<!-- /stylepick/src/main/webapp/assets/img/pinkstore.png -->
			<div class="double_frame" style="">
				<c:forEach var="ev" items="${evaluation}" varStatus="status">				
					<table>
						<tr>
							<td rowspan="2" style="padding-right: 20px;">
								<input type="text" value="${status.index+1}" class="input_round" style="float: left;"/>
							</td>
							<td rowspan="2" style="padding-right: 20px;">
								<img class="profile_image" src="../assets/img/pinkstore.png" style="width:50px; height: auto; float: left;">
							</td>
							<td>  <b><i>' ${ev.com_name} '</i></b></td>
						</tr>
						<tr>
							<td style="font-size: small;">최근 4주 스토어 별점평균 <b>${ev.evaluation}</b> / 5.0점</td>
						</tr>
					</table>
					<br>
				</c:forEach>
			</div>
			<br>
		</div>
		
	</div>
	<!-- right_div -->
<br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>