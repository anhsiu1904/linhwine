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
                      <p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;Quản lý tài khoản&nbsp;&nbsp;</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">Danh sách tài khoản</h4>
               
                <div class="table-responsive pt-3">
                  <table id="recent-purchases-listing" class="table text-center">
                    <thead>
                      <tr>
                      
                        <th>
                          Mã tài khoản
                        </th>
                        <th>
                        	Tên tài khoản
                        </th>
                        <th>
                          Tên khách hàng
                        </th>
                       
                        <th>
                          Địa chỉ
                        </th>
                        <th>
                          Số điện thoại
                        </th>
                        <th>
                          Trạng thái
                        </th>
                        <th>
                          Hành động
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                    	
                    	<c:forEach var="item" items="${allUsers }">
                    	
                    		<tr>
                        
                        <td>
                          ${item.id }
                        </td>
                        <td>
                          ${item.tendn }
                        </td>
                        <td>
                          ${item.hoten }
                        </td>
                        <td>
                          ${item.diachi }
                        </td>
                        <td>
                          ${item.sdt }
                        </td>
                       
                        <td>
                        	<c:if test="${item.status == true }">
                        		<button type="button" class="btn btn-success pl-3 pr-3 pt-2 pb-2">
		                            Hoạt động
		                          </button>
                        	</c:if>
                          	<c:if test="${item.status == false }">
                          		<button type="button" class="btn btn-dark pl-3 pr-3 pt-2 pb-2">
		                            Khóa
		                          </button>
                          	</c:if>
                        </td>
                        <td>
                          <div class="d-flex justify-content-center">
                            
                            <c:if test="${item.id != LoginInfo.id }">
                            <a class="nav-link " href="<c:url value="/quan-tri/cap-nhat-tai-khoan/${item.id }" />">
                              <span class="menu-title btn btn-inverse-warning btn-fw pl-3 pr-3 pt-2 pb-2">Cập nhật</span>
                            </a>
                            	<a class="nav-link " href="<c:url value="/quan-tri/xoa-tai-khoan/${ item.id}" />" >
                              <span  disabled class="menu-title btn btn-inverse-danger btn-fw pl-3 pr-3 pt-2 pb-2">Xóa</span>
                            </a>
                            </c:if>
                            
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
</body>
