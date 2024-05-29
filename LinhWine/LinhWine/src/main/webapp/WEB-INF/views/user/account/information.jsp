<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>
	<main id="main" class="container">
	<div class="container">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<br>
				<p style="font-size: 20px">
					<b>Thông tin tài khoản:</b>
				</p>
				<br>
				
				<div class="row">
				
					<div class="col-md-3"></div>
					<div class="col-md-6">
					<h5 style="line-height: 2;">
							<span >Tên đăng nhập: </span>${UserLogin.tendn}</h5>
						<h5 style="line-height: 2;">
							<span >Họ tên: </span> ${UserLogin.hoten}</h5>
						<h5 style="line-height: 2;">
							<span>Số điện thoại: </span>${UserLogin.sdt}</h5>
						
						<h5 style="line-height: 2;">
							<span> Địa chỉ: </span>${UserLogin.diachi}</h5>
						<br> <a class="btn btn-primary" href="<c:url value="/doi-thong-tin/${UserLogin.id }" />">Cập nhật thông tin cá nhân</a>
						&nbsp; &nbsp; &nbsp; <a class="btn btn-danger" href="<c:url value="/doi-mat-khau" />">Đổi mật khẩu</a> <br> <br>
					</div>
					<div class="col-md-3"></div>
				</div>
				<h3>
					<b>Lịch sử mua hàng:</b>
				</h3>
				<br>
				<table class="table-cart-checkout mytable">
					<tr>
						<th>Mã đơn hàng</th>
						<th>Ngày mua</th>
						
						<th>Ngày nhận hàng</th>
						<th>Sản phẩm</th>
						<th>Tổng tiền</th>
						<th>Trạng thái đơn hàng</th>
					</tr>
					
					<c:forEach var="item" items="${billByName}" >
						<tr style="text-align: center;">
							<td>${item.id}</td>
							<td>${item.ngay_tao}</td>

							

							<td>${item.ngay_cap_nhat}</td>

							
							<td>
								<c:forEach var="bill" items="${listBillDetail }">
									<c:if test="${bill.id_bills == item.id }">
										<c:forEach var="sp" items="${allProducts }">
											<c:if test="${bill.id_product == sp.id_product }">
												<p> ${sp.tensp } x  ${bill.quanty }</p>
											</c:if>
										</c:forEach>
										
									</c:if>
								</c:forEach>
								
							</td>

							<td class="tongGiaTri"><fmt:formatNumber type="number" maxIntegerDigits="9"
																	value="${item.total}" /> vnd</td>
							<td>${item.trang_thai}</td>
						</tr>
					</c:forEach>
					
				</table>

			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
	
	
	
	

	
	<br>
	</main>
</body>
