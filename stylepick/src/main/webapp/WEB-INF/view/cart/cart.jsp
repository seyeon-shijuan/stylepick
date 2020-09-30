<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%@ include file="/header/main.jsp" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="utf-8">
<style>
.table thead tr th {
	text-align: center;
    background: #e5ebf7;
    color: #1f2d3a;
    font-family: "Poppins", sans-serif;
}
.table {
	text-align: center;
}

.main-mapper {
    width: 60%;
    margin: 0 20%;
}

.section_padding {
	padding : 50px 0;
}

.title {
	margin-left : 15px;
	font-size: 36px;
    font-weight: bold;
    margin-bottom: 20px;
}
.ing {
font-size: 20px;
    float: right;
    margin-top: 20px;
}
</style>
</head>
<body>

  <!--================Cart Area =================-->
  <section class="cart_area section_padding">
  <div class="title">
장바구니
<span class="ing">장바구니>주문결제>주문완료</span>
<hr>
</div>
    <div class="container">
      <div class="cart_inner">
        <div class="table-responsive">
          <table class="table">
            <thead>
           		<tr>
                	<th scope="col" style="width:" colspan="2">상품</th>
                	<th scope="col">가격</th>
                	<th scope="col">갯수</th>
                	<th scope="col">총합</th>
                	<th></th>
                	<th></th>
              	</tr>
            </thead>
            <tbody>
            
            <c:set var="tot" value="${0}"/>
            <c:forEach items="${cart.itemSetList}" var="itemSet" varStatus="stat">
              <tr>
                <td style="width:45%;">
                  <div class="media">
                    <div class="d-flex" style="margin-left:25px;">
                    <img src="../item/img/${itemSet.item.pictureUrl}"  id="img" width="150" height="150"><br>
                    </div>
                      
                    <div class="media-body" style="inline-block">
                      <h4>${itemSet.item.item_name}</h4>
                    </div>
                </div>
                </td>
                <td>
                <div>
                <h6>option:${itemSet.item_option},</h6><h6>size:${itemSet.size}</h6> <!--옵션-->
                </div>
                </td>
                <td>
                  <h5>${itemSet.item.price }원</h5> <!-- 가격 -->
                </td>
                <td>
                 <div>
				${itemSet.quantity}개
                  </div>
                </td>
                
                <td>
                  <h5>
                
                  ${itemSet.quantity * itemSet.item.price }  </h5> 
             </td>
             <td>
             <c:set var="tot" value="${tot +(itemSet.quantity * itemSet.item.price)}" />
               <a href="cartDelete.shop?index=${stat.index }">취소</a>
             </td>
              </tr>
   </c:forEach>
              
              <tr>
                <td></td>
                <td></td>
                <td></td>
              
                <td>
                  <h5>결제 금액</h5>
                </td>
                <td>
                  <h5>${tot }원</h5>
                </td>
                <td></td>
              </tr>
            </tbody>
          </table>
          <div class="checkout_btn_inner float-right">
            <a class="btn_1" href="../item/list.shop">쇼핑 하기</a>
            <a class="btn_1 checkout_btn_1" href="../cart/checkout.shop">주문하기</a>
          </div>
        </div>
      </div>
      </div>
  </section>
  <!--================End Cart Area =================-->
<!-- JS here -->


</body>

</html>