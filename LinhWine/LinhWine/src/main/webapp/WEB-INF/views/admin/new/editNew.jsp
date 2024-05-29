<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<body>

	
	<c:if test="${empty idNew }">
		<c:set var="modelAtribute" value="addNew" />
		<c:set var="action" value="them-san-pham" />
		<c:set var="title" value="Thêm mới tin tức" />
		<c:set var="required" value="required=\"required\""/>
		<c:set var="anh" value="noimage.png"/>
		<c:set var="input" value="Thêm mới"/>
	</c:if>
	<c:if test="${not empty idNew }">
		<c:set var="modelAtribute" value="editNew" />
		<c:set var="action" value="${id_new }" />
		<c:set var="title" value="Cập nhật tin tức" />
		<c:set var="anh" value="${editNew.anh}"/>
		<c:set var="input" value="Cập nhật"/>
		<c:set var="tieude" value="${tieu_de }"/>
		<c:set var="tomtat" value="${tom_tat }"/>
		<c:set var="noidung" value="${noi_dung }"/>
		<c:set var="idcn" value="${id_new_category }"/>
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
                      <p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;Quản lý tin tức&nbsp;&nbsp;/&nbsp;   ${title} </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-12 grid-margin">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">Thêm mới tin tức</h4>
                
                
                <form:form class="form-sample" method = "POST" modelAttribute="${modelAtribute }" action="${action }" enctype="multipart/form-data">
                  <p class="card-description">
                    Nhập thông tin tin tức
                  </p>
                  <div class="row">
                    <div class="col-md-9">
                      <div class="form-group row">
                        <label for="ufile"   class="col-sm-3 col-form-label">Ảnh tin tức *</label>
                        <div class="col-sm-9">
                        <img id="output" class="img-rounded" alt="Ảnh" width="150" height="150"
                                             src='<c:url value="/assets/user/img/${anh }" />' />
                          <input name="file" id="ufile" type="file" onchange="loadFile(event)"  />
                          
                        </div>
                      </div>
                    </div>
                    
                  </div>
                  <div class="row">
                    
                    <div class="col-md-9">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tiêu đề *</label>
                        <div class="col-sm-9">
                          <form:input type="text" path="tieu_de" value="${tieude }"  class="form-control" required="required" />
                        </div>
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="form-group row">
                        <label class="col-sm-6 col-form-label">Danh mục tin tức</label>
                          <div class="col-sm-6">
                          
                          		<form:select path="id_new_category" value="${idcn }" >
                          			
                          				<form:options items="${newCategory }" itemValue="id" itemLabel="name"/>
                          
                          		
                          		</form:select>
                            	
                          </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-9">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tóm tắt *</label>
                        <div class="col-sm-9">
                          <form:input type="text" value="${tomtat }" path="tom_tat"  class="form-control" required="required" />
                        </div>
                      </div>
                    </div>
                    
                  </div>
                  
                  
                  <div class="row">
                    
                    <div class="col-md-9">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Nội dung</label>
                        <div class="col-sm-9">
                          <form:textarea type="text" path="noi_dung" value="${noidung }" rows="5" required="required" class="form-control"></form:textarea>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="d-flex justify-content-center">
                    <a class="nav-link mr-2" href="<c:url value="/quan-tri/quan-ly-tin-tuc" />">
                      <span class="menu-title btn btn-outline-danger btn-fw">Quay lại</span>
                    </a>
                    <a class="nav-link ml-2" >
                      <input class="menu-title btn btn-outline-success btn-fw" type="submit" value=" ${input }" />
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
