<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<body >

<div class="login-page">
		<div class="form">
			<form:form method="POST" action='dang-ky' modelAttribute="user">
				<div class="brand-logo">
                	
                	<h2 class="form-signin-heading" style="text-align:center;">Đăng ký tài khoản</h2>
            	</div>
            	
            	
				<hr/>
				<div class="form-group">
					<form:input type="text" path="tendn" name="tendn" class="form-control"
						placeholder="Ten dn" autofocus="true" required="required" ></form:input>
					<c:if test="${not empty tendnLength }">
							<p style="color:red;"> ${tendnLength }</p>
							<% session.removeAttribute("tendnLength"); %>
					</c:if>
					<c:if test="${empty tendnLength }">
						<c:if test="${not empty status }">
							<p style="color:red;"> ${status }</p>
							<% session.removeAttribute("status"); %>
						</c:if>
					</c:if>
				</div>

				<div class="form-group">
					<form:input type="password" path="matkhau" class="form-control"
						required="required" placeholder="Mật khẩu"></form:input>
					<c:if test="${not empty passLength }">
							<p style="color:red;"> ${passLength }</p>
							<% session.removeAttribute("passLength"); %>
					</c:if>
				</div>

				<div class="form-group">
					<form:input type="text" path="hoten" class="form-control"
						placeholder="Họ và tên" required="required"></form:input>
					<form:errors class="error" path="hoten"></form:errors>
				</div>

				<div class="form-group">
					<form:input type="number"  path="sdt" class="form-control"
						placeholder="Số điện thoại" required="required"></form:input>
					<form:errors class="error" path="sdt"></form:errors>
				</div>

				<div class="form-group">
					<form:input type="text" path="diachi" class="form-control"
						placeholder="Địa chỉ" required="required"></form:input>
					<form:errors class="error" path="diachi"></form:errors>
				</div>
				<input id="submit" type="submit" value="ĐĂNG KÝ">
				<p class="message" style="font-size: 18; padding-top:10px"> Đã có tài khoản? <a href="<c:url value='/dang-nhap'/> ">Đăng nhập</a></p>
			</form:form>
		</div>
	</div>

</body>

