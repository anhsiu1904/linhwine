<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                      <p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;Quản lý tin tức&nbsp;&nbsp;/&nbsp;Thông tin chi tiết tin tức</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-12 grid-margin">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">Thông tin chi tiết tin tức</h4>
                <form class="form-sample">
                  
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Mã tin tức</label>
                        <div class="col-sm-9">
                          <label class="col-form-label">${detailNew.id_new }</label>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tiêu đề</label>
                        <div class="col-sm-9">
                          <label class="col-form-label">${detailNew.tieu_de }</label>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Ngày tạo</label>
                        <div class="col-sm-9">
                          <label class="col-form-label">${detailNew.ngay_tao }</label>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Người tạo</label>
                        <div class="col-sm-9">
                        	<c:forEach var="item" items="${allUser }">
                        		<c:if test="${item.id == detailNew.nguoi_tao }">
                        			 <label class="col-form-label">${item.tendn }</label>
                        		</c:if>
                        	</c:forEach>
                         
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Ngày cập nhật</label>
                        <div class="col-sm-9">
                          <label class="col-form-label">${detailNew.ngay_cap_nhat }</label>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Người cập nhật</label>
                        <div class="col-sm-9">
                          <label class="col-form-label">${detailNew.nguoi_cap_nhat }</label>
                        </div>
                      </div>
                    </div>
                  </div>
                  
                  
                  <div class="row">
                    
                    <div class="col-md-12">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Nội dung</label>
                        <div class="col-sm-9">
                          <label class="col-form-label">${detailNew.noi_dung }</label>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="d-flex justify-content-center">
                    <a class="nav-link" href='<c:url value="/quan-tri/quan-ly-tin-tuc" />'>
                      <span class="menu-title btn btn-outline-primary btn-fw ">Quay lại</span>
                    </a>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
</body>
