<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                      <p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;Quản lý danh mục&nbsp;&nbsp;</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">Danh sách danh mục</h4>
                <a class="nav-link " href="<c:url value="/quan-tri/them-danh-muc" />">
                  <span class="menu-title btn btn-primary">Thêm danh mục</span>
                </a>
                <div class="table-responsive pt-3">
                  <table id="recent-purchases-listing" class="table table-bordered">
                    <thead>
                      <tr>
                        <th>
                          Hành động
                        </th>
                        <th>
                          Mã danh mục
                        </th>
                        <th>
                         Tên danh mục
                        </th>
                        <th>
                          Mô tả
                        </th>
                      
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach var="item" items="${categories }">
                      		
                      <tr>
                      	<td>
                          <div class="d-flex justify-content-center">
                            <a class="nav-link " href="<c:url value="/quan-tri/cap-nhat-danh-muc/${ item.id}" />">
                              <span class="menu-title btn btn-inverse-warning btn-fw pl-3 pr-3 pt-2 pb-2">Cập nhật</span>
                            </a>
                            <a class="nav-link delete-category" data-id="${ item.id}" >
                              <span class="menu-title btn btn-inverse-danger btn-fw pl-3 pr-3 pt-2 pb-2">Xóa</span>
                            </a>
                          </div>
                        </td>
                        <td>
                          ${ item.id}
                        </td>
                        <td>
                          ${ item.name}
                        </td>
                        <td>
                          ${ item.description}
                        </td>
                        
                      </tr>
                      
                      </c:forEach>
                      
                      
                      
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
       
        <script type="text/javascript">
        	$(".delete-category").on("click", function(){
        		var id = $(this).data("id");
        		if(confirm("Bạn có chắc chắn muốn xóa?") == true){
        			window.location = "xoa-danh-muc/"+id;
        			
        		}
        		
        	});
        </script>
</body>
