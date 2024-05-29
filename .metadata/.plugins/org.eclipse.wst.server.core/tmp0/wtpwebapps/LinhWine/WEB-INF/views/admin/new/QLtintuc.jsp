<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
                      <p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;Quản lý tin tức&nbsp;&nbsp;</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">Danh sách tin tức</h4>
                <a class="nav-link " href="<c:url value="/quan-tri/them-tin-tuc" />" >
                    <span class="menu-title btn btn-primary">Thêm tin tức</span>
                  </a>
                <div class="table-responsive pt-3">
                  <table id="recent-purchases-listing" class="table table-bordered">
                    <thead>
                      <tr>
                        
                        <th>
                          Mã tin tức
                        </th>
                        <th>
                          Tên tiêu đề
                        </th>
                        <th>
                          Ngày tạo
                        </th>
                        
                        <th>
                          Tóm tắt
                        </th>
                        
                        <th>
                          Người viết
                        </th>
                        <th>
                        	Hành động
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                    	
                    	<c:forEach  var="item" items="${ allNews}">
                     
                      <tr>
                        
                        <td>
                           ${item.id_new }
                        </td>
                        <td>
                           ${item.tieu_de }
                        </td>
                        <td>
                           ${item.ngay_tao }
                        </td>
                        <td>
                         
                          ${item.tom_tat }
                        </td>
                        
                        
                        <td>
                        	<c:forEach var="user" items="${allUser }">
                        		<c:if test="${user.id == item.nguoi_tao }">
                        			${user.tendn }
                        		</c:if>
                        	</c:forEach>
                 			
                      
                          
                        </td>
                        <td>
                        	<div class="d-flex justify-content-center">
                            <a class="nav-link " href='<c:url value="/quan-tri/cap-nhat-tin-tuc/${item.id_new }" />'>
                              <span class="menu-title btn btn-inverse-warning btn-fw pl-3 pr-3 pt-2 pb-2">Cập nhật</span>
                            </a>
                            <a class="nav-link " href="<c:url value="/quan-tri/chi-tiet-tin-tuc/${item.id_new }" />">
                              <span class="menu-title btn btn-inverse-info btn-fw pl-3 pr-3 pt-2 pb-2">Xem chi tiết</span>
                            </a>
                            <a class="nav-link delete-new" data-id="${item.id_new }" >
                              <span class="menu-title btn btn-inverse-danger btn-fw pl-3 pr-3 pt-2 pb-2">Xóa</span>
                            </a>
                          </div>
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
        	$(".delete-new").on("click", function(){
        		var id = $(this).data("id");
        		if(confirm("Bạn có chắc chắn muốn xóa?") == true){
        			window.location.href = '<c:url value="/quan-tri/xoa-tin-tuc/'+id+'" />';
        			
        		}
        		
        	});
        </script>
        
</body>
