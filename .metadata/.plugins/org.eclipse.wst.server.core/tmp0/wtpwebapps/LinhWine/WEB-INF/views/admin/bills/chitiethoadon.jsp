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
                <h4 class="card-title">Chi tiết hóa đơn</h4>
                <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Mã hóa đơn:</label>
                        <div class="col-sm-9">
                          <label class="col-form-label"> ${bill.id }</label>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Tên người mua:</label>
                        <div class="col-sm-9">
                          <label class="col-form-label">${bill.hoten }</label>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Số điện thoại:</label>
                        <div class="col-sm-9">
                          <label class="col-form-label"> ${bill.sdt }</label>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Địa chỉ:</label>
                        <div class="col-sm-9">
                          <label class="col-form-label">${bill.diachi }</label>
                        </div>
                      </div>
                    </div>
                  </div>
                  
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Ngày đặt:</label>
                        <div class="col-sm-9">
                          <label class="col-form-label"> ${bill.ngay_tao }</label>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Ngày cập nhật:</label>
                        <div class="col-sm-9">
                          <label class="col-form-label"> ${bill.ngay_cap_nhat }</label>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Trạng thái:</label>
                        <div class="col-sm-9">
                          <label class="col-form-label">${bill.trang_thai }</label>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Ghi chú:</label>
                        <div class="col-sm-9">
                          <label class="col-form-label"> ${bill.note }</label>
                        </div>
                      </div>
                    </div>
                    
                  </div>
                  
                <div class="table-responsive pt-3">
                
                  <table id="recent-purchases-listing" class="table table-bordered">
                    <thead>
                      <tr>
                        <th>
                          #
                        </th>
                        <th>
                          Tên sản phẩm
                        </th>
                        <th>
                          Số lượng
                        </th>
                        <th>
                          Thành tiền
                        </th>
                        
                      </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="item" items="${billdetail }">
                    	
                    		<tr>
                        <td>
                          
                        </td>
                        <td>
                        	<c:forEach var="product" items="${allProducts }">
                        		<c:if test="${product.id_product == item.id_product }">
                        		
                        			${product.tensp }
                        			
                        		</c:if>
                        	</c:forEach>
                           
                        </td>
                        <td>
                        <c:forEach var="product" items="${allProducts }">
                        		<c:if test="${product.id_product == item.id_product }">
                        		<fmt:formatNumber type="number" maxIntegerDigits="9"
																	value="${product.gia*(1-product.giam_gia/100) }" /> vnd x ${item.quanty }
                        			
                        			
                        		</c:if>
                        	</c:forEach>
                           
                        </td>
                        <td>
                           <fmt:formatNumber type="number" maxIntegerDigits="9"
																	value="${item.total }" /> vnd
                        </td>
                        
                      </tr>
                    	
                    	</c:forEach>
                      
                      
                    </tbody>
                  </table>
                </div>
                
                <div class="row">
                    <div class="col-md-12 ">
                      <div class="form-group row">
                        <label class="col-sm-10 col-form-label text-right">Tổng tiền:</label>
                        <div class="col-sm-2 text-left">
                          <label class="col-form-label"> <fmt:formatNumber type="number" maxIntegerDigits="9"
																	value="${bill.total }" /> vnd</label>
                        </div>
                      </div>
                    </div>
                    
                  </div>
                
              </div>
            </div>
          </div>
        </div>
	
</body>
