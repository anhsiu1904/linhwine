<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<body>
	<!-- Modal cập nhật thông tin -->
	<div class="row">
	<h5 class="modal-title mt-5 text-center" id="exampleModalLabel">
						<b>Cập nhật thông tin tài khoản</b>
					</h5>
				
					<div class="col-md-3"></div>
					<div class="col-md-6">
					<form:form class="form-sample" method="POST" modelAttribute="changeUser" action="${changeUser.id}">
						<div class="form-group ">
							<label style="line-height: 2">Họ tên khách hàng*:</label><br>
							 <form:input
								class="form-control" path="hoten" name="name" required="required" type="text"
								value="${changeUser.hoten}" />
						</div>
						<div class="form-group ">
							<label style="line-height: 2">Số điện thoại*:</label><br> 
								 <form:input
								class="form-control" path="sdt" name="phone" type="text" required="required"
								value="${changeUser.sdt}" />
						</div>
						<div class="form-group">
							<label style="line-height: 2">Địa chỉ*:</label><br> <label
								id="addressWarning" style="color: red"></label>
							<form:textarea rows="3" cols="1" class="form-control" path="diachi" value="${changeUser.diachi}" required="required"></form:textarea>
						</div>
						
				</div>
				<div class="center" style="margin-left:550px;margin-bottom:10px;">
					<a href='<c:url value="/thong-tin-tai-khoan"/>' class="btn btn-secondary" >Hủy</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a 
						><input class="mt-3" style="border-radius:5px;" type="submit" value="Cập nhật"></a>
				</div>
					</div>
					<div class="col-md-3"></div>
				</div>
		</form:form>
	
	<!-- Modal cập nhật thông tin -->
</body>
