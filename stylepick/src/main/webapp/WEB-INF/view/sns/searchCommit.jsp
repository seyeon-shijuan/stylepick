<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<script type="text/javascript">
	var tbl = opener.document.getElementById("Table2");
	var tr = tbl.getElementsByTagName("tr")[${index}]
	var td = tr.getElementsByTagName("td")[1]
	var detail = td.getElementsByTagName("input")[0].value = '${detail}'
	var itemno = td.getElementsByTagName("input")[1].value = ${item_no}
	var td1 = tr.getElementsByTagName("td")[0]
	var category = td.getElementsByTagName("option")[0].value = ${category}
	self.close();
</script>