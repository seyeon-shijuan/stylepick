<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>결제</title>
</head>
<body>
<script src="${pageContext.request.contextPath}/assets/board/js/jquery-3.3.1.min.js"></script>
<br><br>
<h2>결제 수단을 선택해주세요</h2>
<br>
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"
    data-client-id="u86j4ripEt8LRfPGzQ8"
    data-mode="production"
    data-merchant-user-key="123"
    data-merchant-pay-key="123"
    data-product-name="${param.name}"
    data-total-pay-amount="${param.total}"
    data-tax-scope-amount="${param.total}"
    data-tax-ex-scope-amount="0"
    data-return-url="${pageContext.request.contextPath}/cart/payresult.shop">
</script>
</body>
</html>
