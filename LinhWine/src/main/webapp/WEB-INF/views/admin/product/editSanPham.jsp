<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<body>

	<c:if test="${empty editProduct }">
		<c:set var="modelAttr" value="addProduct" />
		<c:set var="title" value="Thêm sản phẩm"/>
		<c:set var="input" value="Thêm mới"/>
		<c:set var="action" value="them-san-pham"/>
		<c:set var="anh" value="noimage.png"/>
		<c:set var="quanty" value="Số lượng nhập"/>
		<c:set var="required" value="required=\"required\""/>
	</c:if>
	<c:if test="${not empty editProduct }">
		<c:set var="modelAttr" value="editProduct" />
		<c:set var="title" value="Cập nhật sản phẩm"/>
		<c:set var="input" value="Cập nhật"/>
		<c:set var="action" value="${editProduct.id_product }"/>
		<c:set var="id_category" value="${editProduct.id_category }"/>
		<c:set var="tensp" value="${editProduct.tensp }"/>
		<c:set var="anh" value="${editProduct.anh }"/>
		<c:set var="gia" value="${editProduct.gia }"/>
		<c:set var="giam_gia" value="${editProduct.giam_gia }"/>
		<c:set var="so_luong_ton" value="${editProduct.so_luong_ton }"/>
		<c:set var="loaisp" value="${editProduct.loaisp }"/>
		<c:set var="thuong_hieu" value="${editProduct.thuong_hieu }"/>
		<c:set var="xuat_xu" value="${editProduct.xuat_xu }"/>
		<c:set var="dung_tich" value="${editProduct.dung_tich }"/>
		<c:set var="nong_do" value="${editProduct.nong_do }"/>
		<c:set var="tuoi_ruou" value="${editProduct.tuoi_ruou }"/>
		<c:set var="bo_suu_tap" value="${editProduct.bo_suu_tap }"/>
		<c:set var="mo_ta" value="${editProduct.mo_ta }"/>
		<c:set var="sp_noi_bat" value="${editProduct.sp_noi_bat }"/>
		<c:set var="quanty" value="Số lượng tồn"/>
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
                      <p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;Quản lý sản phẩm&nbsp;&nbsp;/&nbsp; ${title }</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-12 grid-margin">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">Thêm mới sản phẩm</h4>
                
                
                <form:form class="form-sample" method = "POST" modelAttribute="${modelAttr}" action="${action}" enctype="multipart/form-data">
                  <p class="card-description">
                    Nhập thông tin sản phẩm
                  </p>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label for="ufile"   class="col-sm-3 col-form-label">Ảnh sản phẩm *</label>
                        <div class="col-sm-9">
                        <img id="output" class="img-rounded" alt="Ảnh" width="150" height="150"
                                             src='<c:url value="/assets/user/img/${anh }" />' />
                          <input name="file" id="ufile" type="file" onchange="loadFile(event)"  ${required } />
                          
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Thuộc danh mục</label>
                          <div class="col-sm-9">
                          
                          		<form:select path="id_category" value="${id_category }" >
                          			
                          				<form:options items="${categories }" itemValue="id" itemLabel="name"/>
                          
                          		
                          		</form:select>
                            	
                          </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tên sản phẩm *</label>
                        <div class="col-sm-9">
                          <form:input type="text" path="tensp"  class="form-control" required="required" />
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Sản phẩm nổi bật</label>
                          <div class="col-sm-9">
                            	<form:radiobutton path="sp_noi_bat" value="1" label="Có" /> &nbsp; &nbsp;&nbsp;
                            	<form:radiobutton path="sp_noi_bat" value="0" label="Không" />
                          </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Giá *</label>
                        <div class="col-sm-9">
                          <form:input type="text" value="" path="gia"  class="form-control" required="required" />
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Giảm giá</label>
                        <div class="col-sm-9">
                          <form:input type="text" path="giam_gia" value="${giam_gia }" class="form-control" required="required" />
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">${quanty} *</label>
                        <div class="col-sm-9">
                          <form:input type="text" path="so_luong_ton" value="${so_luong_ton }" class="form-control" required="required" />
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Thương hiệu</label>
                        <div class="col-sm-9">
                          <form:input type="text" path="thuong_hieu" value="${thuong_hieu }" class="form-control" required="required" />
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Xuất xứ</label>
                        <div class="col-sm-9">
                          <form:input type="text" path="xuat_xu" value="${xuat_xu }" class="form-control" required="required" />
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Dung tích</label>
                        <div class="col-sm-9">
                          <form:input type="text" path="dung_tich" value="${dung_tich }" class="form-control" required="required" />
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Loại sản phẩm</label>
                        <div class="col-sm-9">
                          <form:input type="text" path="loaisp" value="${loaisp }" class="form-control" required="required" />
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Nồng độ</label>
                        <div class="col-sm-9">
                          <form:input type="text" path="nong_do" value="${nong_do }" class="form-control" required="required" />
                        </div>
                      </div>
                    </div>
                  </div><div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tuổi rượu</label>
                        <div class="col-sm-9">
                          <form:input type="text" path="tuoi_ruou" value="${tuoi_ruou }" class="form-control" />
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Bộ sưu tập</label>
                        <div class="col-sm-9">
                          <form:input type="text" path="bo_suu_tap" value="${bo_suu_tap }" class="form-control" />
                        </div>
                      </div>
                    </div>
                  </div>
                  
                  <div class="row">
                    
                    <div class="col-md-9">
                      <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Mô tả</label>
                        <div class="col-sm-10">
                          <form:textarea type="text" path="mo_ta" value="${mo_ta }" rows="5" class="form-control"></form:textarea>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="d-flex justify-content-center">
                    <a class="nav-link mr-2" href="<c:url value="/quan-tri/quan-ly-san-pham" />">
                      <span class="menu-title btn btn-outline-danger btn-fw">Quay lại</span>
                    </a>
                    <a class="nav-link ml-2" >
                      <input class="menu-title btn btn-outline-success btn-fw" type="submit" value="${input }" />
                    </a>
                  </div>
                </form:form>
                
                
              </div>
            </div>
          </div>
        </div>
        
        <script>
    var loadFile = function (event) {
        var image = document.getElementById("output");
        image.src = URL.createObjectURL(event.target.files[0]);
    };
</script>
</body>
