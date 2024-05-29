<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<body>
	<div class="main-panel">
	
        <div class="content-wrapper">
          <div class="row">
            <div class="col-md-12 grid-margin">
              <div class="d-flex justify-content-between flex-wrap">
                <div class="d-flex align-items-end flex-wrap">
                  <div class="mr-md-3 mr-xl-5">
                    <h2>Xin chào, Admin</h2>
                    <div class="d-flex">
                      <i class="mdi mdi-home text-muted hover-cursor"></i>
                      <p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;Quản lý tài khoản&nbsp;&nbsp;/&nbsp;Cập nhật tài khoản</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-12 grid-margin">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">Cập nhật thông tin tài khoản</h4>
                <form:form class="form-sample" method="POST" modelAttribute="user" action="${user.id}">
                  <p class="card-description">
                    Nhập thông tin tài khoản
                  </p>
                 
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Mã tài khoản: </label>
                        <label class="col-sm-9 col-form-label">${user.id} </label>
                        
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tên khách hàng: </label>
                        <label class="col-sm-9 col-form-label">${user.hoten} </label>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tên đăng nhập: </label>
                        <label class="col-sm-9 col-form-label">${user.tendn} </label>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Số điện thoại</label>
                        <label class="col-sm-9 col-form-label">${user.sdt} </label>
                      </div>
                    </div>
                    
                  </div>

                  <div class="row">
                    <div class="col-md-9">
                      <div class="form-group row">
                        <label class="col-md-2 col-form-label">Địa chỉ</label>
                        <label class="col-sm-10 col-form-label">${user.diachi} </label>
                      </div>
                    </div>
                    
                  </div>
                  <div class="row">
                    
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-md-3 col-form-label">Nhóm quyền</label>
                        <div class="col-md-6">
                          <form:select path="role.id_role" value="${user.role.id_role}" >
                          			
                          				<form:options items="${roles }" itemValue="id_role" itemLabel="name"/>
                          
                          		
                          		</form:select>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-md-3 col-form-label">Trạng thái</label>
                        <label class="col-md-9 col-form-label">
                        	<form:radiobutton path="status" value="1" label="Hoạt động" /> &nbsp; &nbsp;&nbsp;
                            <form:radiobutton path="status" value="0" label="Khóa" />
                        </label>
                      </div>
                    </div>
                  </div>
                  
                  <div class="d-flex justify-content-center">
                    <a class="nav-link mr-2" href="<c:url value="/quan-tri/quan-ly-tai-khoan" />">
                      <span class="menu-title btn btn-outline-danger btn-fw">Quay lại</span>
                    </a>
                    <a class="nav-link ml-2" >
                      <input class="menu-title btn btn-outline-success btn-fw" type="submit" value="Cập nhật" />
                    </a>
                  </div>
                </form:form>
              </div>
            </div>
          </div>
        </div>
</body>
