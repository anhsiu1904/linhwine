<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<body>

	<div class="row">
	<h5 class="modal-title mt-5 text-center" id="exampleModalLabel">
						<b>Đổi mật khẩu</b>
					</h5>
					<c:if test="${not empty status }">
							<h1>${status }</h1>
						</c:if>	
					<div class="col-md-3"></div>
					<div class="col-md-6">
					<form:form class="form-sample" method="POST" modelAttribute="changePass" action="doi-mat-khau">
						<div class="form-group ">
						<label style="line-height: 2">Mật khẩu cũ*:</label><br>  <form:input
							class="form-control" path="oldpass" type="password" required="required" />
						<c:if test="${not empty old }">
							<p style="color:red;"> ${old }</p>
							
						</c:if>
					</div>
					<div class="form-group ">
						<label style="line-height: 2">Mật khẩu mới*:</label><br>  <form:input
							class="form-control" path="newpass"  type="password" required="required"  />
							<c:if test="${not empty length }">
							<p style="color:red;"> ${length }</p>
							
						</c:if>
					</div>
					<div class="form-group ">
						<label style="line-height: 2">Xác nhận lại mật khẩu mới*:</label><br>
						 <form:input
							class="form-control" path="confirmpass" type="password" required="required"/>
							<c:if test="${not empty confirm }">
							<p style="color:red;"> ${confirm }</p>
							
						</c:if>
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
	
	
</body>
