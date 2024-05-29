<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<body>

	<c:if test="${ empty category}">
		<c:set var="modelAttr" value="addCategory" />
		<c:set var="title" value="Thêm danh mục"/>
		<c:set var="input" value="Thêm mới"/>
		<c:set var="action" value="them-danh-muc"/>
		<c:set var="name" value="" />
		<c:set var="description" value="" />
	</c:if>
	
	<c:if test="${not empty category }">
		<c:set var="modelAttr" value="category" />
		<c:set var="title" value="Cập nhật danh mục"/>
		<c:set var="input" value="Cập nhật"/>
		<c:set var="action" value="${category.id}"/>
		<c:set var="name" value="${category.name }" />
		<c:set var="description" value="${category.description }" />
	</c:if>
	
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
                      <p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;Quản lý danh mục&nbsp;&nbsp;/&nbsp;${title}</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-12 grid-margin">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">${title}</h4>
                <form:form class="form-sample" method="POST" modelAttribute="${modelAttr}" action="${action}">
                  <p class="card-description">
                    Nhập thông tin danh mục
                  </p>
                 
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tên danh mục *</label>
                        <div class="col-sm-9">
                          <form:input type="text" placeholder="Nhập tên danh mục" class="form-control" value="${name }"  path="name" required="required" />
                        </div>
                      </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-md-9">
                      <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Mô tả</label>
                        <div class="col-sm-10">
                          <form:textarea rows="4" cols="29" placeholder="Nhập mô tả" value="${description }"  path="description" class="form-control" />
                        </div>
                      </div>
                    </div>
                  </div>
                  
                  <div class="d-flex justify-content-center">
                    <a class="nav-link mr-2" href="<c:url value="/quan-tri/quan-ly-danh-muc" />">
                      <span class="menu-title btn btn-outline-danger btn-fw">Quay lại</span>
                    </a>
                    <a class="nav-link ml-2" >
                      <input class="menu-title btn btn-outline-success btn-fw" type="submit" value="${input}" />
                    </a>
                  </div>
                </form:form>
              </div>
            </div>
          </div>
        </div>
</body>
