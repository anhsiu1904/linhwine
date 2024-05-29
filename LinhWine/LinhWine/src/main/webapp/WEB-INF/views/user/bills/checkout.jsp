<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>
<main id="main" class="container">
	<div class="container">
		<form:form method="POST" action="checkout" modelAttribute="bills">
		<div class = "row">
		<br><br>
			<c:if test="${not empty LoginInfo }">
			<div class="col-md-1"></div>
			<div class="col-md-4">
				<br>
				<p class="border-p" style="line-height:1.5;"><b>Thông tin nhận hàng</b></p>
			
				<p style="line-height:2;" >Họ tên người nhận hàng *</p>
				<form:input size="27" type="text"  placeholder="Họ tên" path="hoten" required="required" />
				
				<p style="line-height:2;">Số điện thoại *</p>
				<form:input size="27" type="text"  placeholder="Nhập số điện thoại" path="sdt" required="required" />
				
				
				<p style="line-height:2;">Địa chỉ(số nhà, đường, tỉnh thành) *</p>
				<form:textarea rows="3" cols="29" placeholder="Nhập địa chỉ" path="diachi" required="required"></form:textarea>
				<p style="line-height:2;">Ghi chú</p>
				<form:textarea rows="3" cols="29" path="note" ></form:textarea>
	
				<br><br>
				
			</div>
			
			<div class="col-md-6">
				<br>
				<p class="border-p" style="line-height:1.5;"><b>Giỏ hàng</b></p>
				<br>
				
					<table class="table-cart-checkout mytable">
						 <tr>
							    <th>Ảnh</th>
							    <th>Tên sản phẩm</th>
							    <th>Đơn giá</th>
							    <th>Tổng</th>
						</tr>
						<c:forEach items="${Cart}" var="item" >
					
						 <tr style="text-align: center;">
							    <td>
							    	<img width="100px" height="100px" src="<c:url value="assets/user/img/${item.value.product.anh }" />"" alt="not found img" class="img-reponsive fix-size-img">
							    </td>
							    <td style="color:green">
							    ${item.value.product.tensp}
							    </td>
							    
							    <td class="donGia" >
							    	<div class="check " style ="display: inline-block; "><fmt:formatNumber type="number" maxIntegerDigits="9"
																	value="${item.value.product.gia - (item.value.product.gia * item.value.product.giam_gia/100) }" /> vnd </div> 
							    	<div style="display: inline-block; "> x ${item.value.quanty}</div>
							    </td>
							    
							    <td>
							    	<div class="total"><fmt:formatNumber type="number" maxIntegerDigits="9"
																	value="${item.value.totalPrice}" /> vnd</div> 
							    </td>
						</tr>
						</c:forEach>
						
					</table>
				
				
				<br>
				<p>Tổng giá trị đơn hàng:   <fmt:formatNumber type="number" maxIntegerDigits="9"
																	value="${TotalPriceCart }" /> vnd</p>
				<br>
				 &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;
				<a href="<c:url value="/gio-hang" />" style="width:200px; height:50px;padding-top:10px;" class="btn btn-primary">Quay lại giỏ hàng</a>
				 &nbsp;  &nbsp;  &nbsp;  &nbsp;
				 
				<button style="width:200px; height:50px;" class="btn btn-primary mt-3" type="submit" >Gửi đơn hàng</button>
				<br><br>
			
			</div>
			</c:if>
			<c:if test="${empty LoginInfo }">
				<div class="col-md-1"></div>
				<div class="col-md-4">
				<br>
				<p class="border-p" style="line-height:1.5;"><b>Thông tin nhận hàng</b></p>
			
				<p style="line-height:2;" >Họ tên người nhận hàng *</p>
				<form:input size="27" type="text"  placeholder="Họ tên" path="hoten" required="required" />
				
				<p style="line-height:2;">Số điện thoại *</p>
				<form:input size="27" type="text"  placeholder="Nhập sô điện thoại" path="sdt" required="required" />
				
				
				<p style="line-height:2;">Địa chỉ(số nhà, đường, tỉnh thành) *</p>
				<form:textarea rows="3" cols="29"  placeholder="Nhập địa chỉ" path="diachi" required="required"></form:textarea>
				<p style="line-height:2;">Ghi chú</p>
				<form:textarea rows="3" cols="29"  placeholder="Note" path="note" ></form:textarea>
	
				<br><br>
				
			</div>
			
			<div class="col-md-6">
				<br>
				<p class="border-p" style="line-height:1.5;"><b>Giỏ hàng</b></p>
				<br>
				
					<table class="table-cart-checkout mytable">
						 <tr>
							    <th>Ảnh</th>
							    <th>Tên sản phẩm</th>
							    <th>Đơn giá</th>
							    <th>Tổng</th>
						</tr>
						<c:forEach items="${Cart}" var="item" >
					
						 <tr style="text-align: center;">
							    <td>
							    	<img width="100px" height="100px" src="<c:url value="assets/user/img/${item.value.product.anh }" />" alt="not found img" class="img-reponsive fix-size-img">
							    </td>
							    <td style="color:green">
							    ${item.value.product.tensp}
							    </td>
							    
							    <td class="donGia" >
							    	<div class="check " style ="display: inline-block; "><fmt:formatNumber type="number" maxIntegerDigits="9"
																	value="${item.value.product.gia - (item.value.product.gia * item.value.product.giam_gia/100) }" /> vnd </div> 
							    	<div style="display: inline-block; "> x ${item.value.quanty}</div>
							    </td>
							    
							    <td>
							    	<div class="total"><fmt:formatNumber type="number" maxIntegerDigits="9"
																	value="${item.value.totalPrice}" /> vnd</div> 
							    </td>
						</tr>
						</c:forEach>
						
					</table>
				
				
				<br>
				<p>Tổng giá trị đơn hàng: <fmt:formatNumber type="number" maxIntegerDigits="9"
																	value="${TotalPriceCart }" /> vnd  </p>
				<br>
				 &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;
				<a href="<c:url value="/gio-hang" />" style="width:200px; height:50px;padding-top:10px;" class="btn btn-primary">Quay lại giỏ hàng</a>
				 &nbsp;  &nbsp;  &nbsp;  &nbsp;
				 
				<button style="width:200px; height:50px;" class="btn btn-primary mt-3" type="submit" >Gửi đơn hàng</button>
			
				<br><br>
			
			</div>
			</c:if>
		</div>
		</form:form>
		</div>
	</main>
</body>
