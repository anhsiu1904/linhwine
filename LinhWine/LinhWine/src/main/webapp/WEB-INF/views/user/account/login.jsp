<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<body id="LoginForm">
<div class="login-page">
		<div class="form">
			<div class="brand-logo">
                
                <h2 class="form-signin-heading text-center" style="text-align:center;">Đăng nhập</h2>
            </div>
		    <hr>
		    <c:if test="${not empty statusLogin }">
		    	
		    	<div class="alert alert-danger">
				  <strong>Lỗi!</strong> ${statusLogin }
				</div>
		    	<% session.removeAttribute("statusLogin"); %>
		    </c:if>
			<c:if test="${not empty login }">
				<div class="alert alert-danger">
				   ${login }
				</div>
		    	<% session.removeAttribute("login"); %>
			</c:if>

			<form:form class="login-form" method="POST" action="dang-nhap" modelAttribute="user">
			    
				<form:input type="text" placeholder="Tên đăng nhập" name="tendn" required="required" path="tendn" style="padding:  10px;"/> 
				
				<form:input type="password" placeholder="Mật khẩu" name="matkhau" required="required" path="matkhau" style="padding:  10px;" /> 
				
				
				
				<input id="submit" type="submit" value="ĐĂNG NHẬP">
				<p class="message" style="font-size: 18; padding-top:10px"> Chưa có tài khoản? <a href="<c:url value='/dang-ky'/> ">Tạo tài khoản mới</a></p>
				<p class="message" style="font-size: 18; padding-top:10px"><a href="<c:url value="/" />">Về Trang chủ</a></p>
			</form:form>
		</div>
	</div>
</body>
