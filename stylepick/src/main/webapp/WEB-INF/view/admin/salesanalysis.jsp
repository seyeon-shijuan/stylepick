<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타일픽 매출 대용량 분석</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="http://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
</head>
<body>

<div class="left-div" style="white-space:nowrap; width:10%; border-right:1px solid gray; float:left; text-align: center;">
			<ul>
				<li  id="admin_menu"><a href="../stylepick/admin/dashboard.shop">대시보드</a></li><br>
				<li  id="admin_menu"><a href="../stylepick/admin/widgets.shop">위젯</a></li><br>
				<li  id="admin_menu"><a href="../stylepick/admin/charts.shop">차트</a></li><br>
				<li  id="admin_menu"><a href="../stylepick/admin/list.shop">유저</a></li><br>
				<li  id="admin_menu"><a href="../stylepick/admin/storelist.shop">스토어 관리</a></li><br>
				<li  id="admin_menu"><a href="../stylepick/admin/salesmgr.shop" style="color:skyblue;">매출 관리</a></li><br>
				<li  id="admin_menu"><a href="../stylepick/board/qna.shop">고객센터</a></li>
			</ul>
	</div>
	<div class="right-div" style="width: 80%; margin-left: 3%;  padding: 1%; float:left;">
		<!-- <form action="mailForm.shop" method="post"> -->
			<h3>Sales Analysis - Charts</h3><br>
			<a href="../stylepick/admin/salesmgr.shop" style="text-align: right; margin-left: 85%; margin-bottom:30px; background: skyblue; color:white;">back</a><br><br><br>
			<h5 style="text-align: center;">' 스타일픽 매출 대용량 분석(건별) '</h5>
			<br>
			<p style="text-align: center; margin-bottom: 30px;"><img src="https://cdn.crowdpic.net/list-thumb/thumb_l_775E9063849AE734A72BCFF462FF9239.png" style="width:20px; height:auto;"></p>
	
<div style="margin-left: 20%;">
<form action="${pageContext.request.contextPath}/StylepickServlet" method="post" name="f">
   <select name="year" style="margin: 0 20px;">
      <option selected>2020</option>
   </select>
   <input type="radio" name="kbn" value="a" checked="checked">Category&nbsp;
   <input type="radio" name="kbn" value="b" <c:if test="${param.kbn=='b'}">checked="checked"</c:if>>Color of the product&nbsp;
   <input type="radio" name="graph" value="bar" checked="checked">Bar Chart&nbsp;
   <input type="radio" name="graph" value="pie" <c:if test="${param.graph=='pie'}">checked="checked"</c:if>>Pie Chart&nbsp;
   
   <input type="submit" value="Run">
</form>

<!-- servlet에서 2020이 있는지 여부를 file이라는 변수를 통해 보내준다. -->
<c:if test="${!empty file}">
   <div id="canvas-holder" style="width:50%; height:300px; float:left; margin-bottom:300px; margin-top:50px;">
      <canvas id="chart" width="100%" height="100%"></canvas>
      <br><br><br><br><br><br><br><br><br><br><br><br>
   </div>
   <br><br><br><br><br><br><br><br><br><br><br><br>
   <script type="text/javascript">
      var randomColorFactor = function() {
         return Math.round(Math.random() * 255);
      }
      var randomColor = function(opacity) {
         return "rgba("+randomColorFactor() + "," + randomColorFactor() + ","+ randomColorFactor() + "," + (opacity || "0.3") + ")";
      }
      rcolor = randomColor(1);
      var config = { // config 안에 type, data, options
            //type : 'bar',
            type : '${param.graph}', //여기가 수정됨
            data : { //data 안에 datasets, labels
               datasets : [{ //datasets 안에 label, data,backgroundColor
                  label: "${file}${(param.kbn=='a')?'카테고리':'색상'} 별 판매 카운트",
                  data: [<c:forEach items="${map}" var="m">"${m.value}",</c:forEach>],
                  backgroundColor : [<c:forEach items="${map}" var="m">randomColor(1),</c:forEach>]
               }],//datasets
               labels: [<c:forEach items="${map}" var="m">"${m.key}",</c:forEach>] //해당 값이 키값으로 들어온다.
            },//data
            options : {
            	responsive : true,
            	scales: {
            		yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
            	}
            }
      };//config
      window.onload = function() {
         var ctx = document.getElementById("chart").getContext("2d");
         new Chart(ctx,config); //차트를 생성하는 커맨드=ctx, 차트환경설정=config
      }
   </script>
</c:if>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>	
	</div>


</body>
</html>