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
                      <p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;Quản lý hóa đơn&nbsp;&nbsp;</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">Danh sách hóa đơn</h4>
                <div class="table-responsive pt-3">
                  <table id="recent-purchases-listing" class="table table-bordered">
                    <thead>
                      <tr>
                        
                        <th>
                          Mã hóa đơn
                        </th>
                        <th>
                          Tên tài khoản
                        </th>
                        <th>
                          Ngày tạo
                        </th>
                        
                        <th>
                          Chi tiết hóa đơn
                        </th>
                        <th>
                          Tổng tiền
                        </th>
                        <th>
                          Trạng thái
                        </th>
                        
                      </tr>
                    </thead>
                    <tbody>
                    	
                    	<c:forEach  var="item" items="${ bills}">
                     
                      <tr>
                        
                        <td>
                           ${item.id }
                        </td>
                        <td>
                           ${item.hoten }
                        </td>
                        <td>
                           ${item.ngay_tao }
                        </td>
                        
                        <td>
                         <div class="d-flex justify-content-center">
                          <a class="nav-link " href="<c:url value="/quan-tri/chi-tiet-hoa-don/${item.id }" />">
                              <span class="menu-title btn btn-inverse-info btn-fw pl-3 pr-3 pt-2 pb-2">Xem chi tiết</span>
                            </a>
                            </div>
                        </td>
                        <td>
                         <fmt:formatNumber type="number" maxIntegerDigits="9"
																	value="${item.total }" /> vnd
                          
                        </td>
                        <td>
                 			<c:if test="${item.trang_thai.equals('Đang giao') }">
                 				<select class="edit-status" data-id="${item.id }">
                 					<option>Đang giao</option>
                 					<option>Hoàn thành</option>
                 					<option>Hủy đơn</option>
                 				</select>
                 				
                 			</c:if>
                 			<c:if test="${item.trang_thai.equals('Hoàn thành') }">
                 				<p class="text-center" style="color:green">Hoàn thành</p>
                 			</c:if>
                 			<c:if test="${item.trang_thai.equals('Hủy đơn') }">
                 				<p class="text-center" style="color:red">Đã hủy</p>
                 			</c:if>
                       
                          
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
        
        <script>
        
	           $(".edit-status").change(function() {
	        	   var id = $(this).data("id");
	        	   var status = $(".edit-status").val();
	        	   window.location = "cap-nhat-trang-thai/"+id+"/"+status;
	           		});
           
           
           </script>
        
</body>
