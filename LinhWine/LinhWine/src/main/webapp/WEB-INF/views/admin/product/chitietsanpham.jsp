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
                      <p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;Quản lý sản phẩm&nbsp;&nbsp;/&nbsp;Thông tin chi tiết sản phẩm</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-12 grid-margin">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">Thông tin chi tiết sản phẩm</h4>
                <form class="form-sample">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label"><b>Ảnh sản phẩm</b></label>
                        <div class="col-sm-9">
                          <img src="<c:url value="/assets/user/img/${product.anh }" />" alt="default" width="200">
                        </div>
                      </div>
                    </div>
                    
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-md-3 col-form-label">Thuộc danh mục</label>
                        <div class="col-md-9">
                          <c:forEach var="item" items="${categories }">
							
								<c:if test="${ item.id == product.id_category }">
									
									 <label class="col-form-label">${ item.name} </label>
								
								</c:if>
							
							</c:forEach>
                        </div>
                      </div>
                    </div>
                    
                    
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Mã sản phẩm</label>
                        <div class="col-sm-9">
                          <label class="col-form-label">${product.id_product }</label>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tên sản phẩm</label>
                        <div class="col-sm-9">
                          <label class="col-form-label">${product.tensp }</label>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Giá</label>
                        <div class="col-sm-9">
                          <label class="col-form-label">${product.gia }</label>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Giảm giá</label>
                        <div class="col-sm-9">
                          <label class="col-form-label">${product.giam_gia }</label>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Số lượng tồn</label>
                        <div class="col-sm-9">
                          <label class="col-form-label">${product.so_luong_ton }</label>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Thương hiệu</label>
                        <div class="col-sm-9">
                          <label class="col-form-label">${product.thuong_hieu }</label>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Xuất xứ</label>
                        <div class="col-sm-9">
                          <label class="col-form-label">${product.xuat_xu }</label>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Dung tích</label>
                        <div class="col-sm-9">
                          <label class="col-form-label">${product.dung_tich }</label>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Loại sản phẩm</label>
                        <div class="col-sm-9">
                          <label class="col-form-label">${product.loaisp }</label>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Nồng độ</label>
                        <div class="col-sm-9">
                          <label class="col-form-label">${product.nong_do }</label>
                        </div>
                      </div>
                    </div>
                  </div><div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tuổi rượu</label>
                        <div class="col-sm-9">
                          <label class="col-form-label">${product.tuoi_ruou }</label>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Bộ sưu tập</label>
                        <div class="col-sm-9">
                          <label class="col-form-label">${product.bo_suu_tap }</label>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Ngày tạo</label>
                        <div class="col-sm-9">
                          <label class="col-form-label">${product.ngay_tao }</label>
                        </div>
                      </div>
                    </div>
                    
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Ngày cập nhật</label>
                        <div class="col-sm-9">
                          <label class="col-form-label">${product.ngay_cap_nhat }</label>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Sản phẩm nổi bật</label>
                        <div class="col-sm-9">
                          <label class="col-form-label">${product.sp_noi_bat }</label>
                        </div>
                      </div>
                    </div>
                    
                  </div>
                  <div class="row">
                    
                    <div class="col-md-12">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Mô tả</label>
                        <div class="col-sm-9">
                          <label class="col-form-label">${product.mo_ta }</label>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="d-flex justify-content-center">
                    <a class="nav-link" href='<c:url value="/quan-tri/quan-ly-san-pham" />'>
                      <span class="menu-title btn btn-outline-primary btn-fw ">Quay lại</span>
                    </a>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
</body>
