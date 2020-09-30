<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /webapp/dataexpo/dataexpo2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공사별 데이터 분석</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="http://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
</head>
<body>
<h3>항공사별 항공기 지연 데이터 분석</h3>
<form action="${pageContext.request.contextPath}/CarrServlet" method="post" name="f">
	<select name="year">
		<c:forEach var="y" begin="1987" end="1988">
			<option <c:if test="${param.year == y}">selected</c:if>>${y}</option>
		</c:forEach>
	</select>
	<input type="radio" name="kbn" value="a" checked="checked">도착지연&nbsp;
	<input type="radio" name="kbn" value="d" <c:if test="${param.kbn=='d'}">checked="checked"</c:if>>출발지연&nbsp;
	<input type="radio" name="graph" value="bar" checked="checked">막대그래프&nbsp;
	<input type="radio" name="graph" value="pie" <c:if test="${param.graph=='pie'}">checked="checked"</c:if>>파이그래프&nbsp;
	
	<input type="submit" value="분석">
</form>

<!-- servlet에서 1987, 1988이 있는지 여부를 file이라는 변수를 통해 보내준다. -->
<c:if test="${!empty file}">
	<div id="canvas-holder" style="width:50%; height:300px;">
		<canvas id="chart" width="100%" height="100%"></canvas>
	</div>
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
						label: "${file}${(param.kbn=='a')?'도착':'출발'}지연정보",
						data: [<c:forEach items="${map}" var="m">"${m.value}",</c:forEach>],
						backgroundColor : [<c:forEach items="${map}" var="m">randomColor(1),</c:forEach>]
					}],//datasets
					labels: [<c:forEach items="${map}" var="m">"${m.key}",</c:forEach>] //항공사명이 키값으로 들어온다.
				},//data
				options : {responsive : true}
		};//config
		window.onload = function() {
			var ctx = document.getElementById("chart").getContext("2d");
			new Chart(ctx,config); //차트를 생성하는 커맨드=ctx, 차트환경설정=config
		}
	</script>
</c:if>

</body>
</html>