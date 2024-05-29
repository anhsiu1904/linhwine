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
                      <p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;Quản lý sản phẩm&nbsp;&nbsp;</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">Danh sách sản phẩm</h4>
                  <a class="nav-link " href="<c:url value="/quan-tri/them-san-pham" />" >
                    <span class="menu-title btn btn-primary">Thêm sản phẩm</span>
                  </a>
                <div class="table-responsive pt-3">
                  <table id="recent-purchases-listing" class="table">
                    <thead>
                      <tr>
                       
                        <th>
                          Mã sản phẩm
                        </th>
                         <th>
                          Ảnh
                        </th>
                        <th>
                          Tên sản phẩm
                        </th>
                        <th>
                          Số lượng tồn
                        </th>
                        <th>
                          Hành động
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="item" items="${adminProductsPage }">
                    		<tr>
                        
                        <td>
                           ${item.id_product }
                        </td>
                        <td class="product-thumbnail" >
                            <img width="300px" height="auto" src='<c:url value="/assets/user/img/${item.anh}" />' class="img-custom" alt="" loading="lazy">
                        </td>
                        <td>
                           ${item.tensp }
                        </td>
                        <td>
                           ${item.so_luong_ton }
                        </td>
                        <td>
                          <div class="d-flex justify-content-center">
                            <a class="nav-link " href='<c:url value="/quan-tri/cap-nhat-san-pham/${item.id_product}" />'>
                              <span class="menu-title btn btn-inverse-warning btn-fw pl-3 pr-3 pt-2 pb-2">Cập nhật</span>
                            </a>
                            <a class="nav-link " href="<c:url value="/quan-tri/chi-tiet-san-pham/${item.id_product}" />">
                              <span class="menu-title btn btn-inverse-info btn-fw pl-3 pr-3 pt-2 pb-2">Xem chi tiết</span>
                            </a>
                            <a class="nav-link delete-product" data-id="${item.id_product}" >
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
         
          
          <div class="container">
						<nav class="woocommerce-pagination">
							<div class="pagination-container">
								<ul class="text-center links nav-pagination page-numbers">
									
									<c:forEach var="item" begin="1" end="${pageAdminInfo.totalPage }" varStatus="loop">
										
										<c:if test="${(loop.index) == pageAdminInfo.currentPage }">
											<li class="page-number active"><a href="<c:url value="/quan-tri/quan-ly-san-pham/${loop.index }" />">${(loop.index)}</a></li>
										</c:if>
										<c:if test="${(loop.index) != pageAdminInfo.currentPage }">
											<li class="page-number"><a href="<c:url value="/quan-tri/quan-ly-san-pham/${loop.index }" />">${(loop.index)}</a></li>
										</c:if>
										
									
									</c:forEach>
									
									
								</ul>
							</div>

						</nav>
					</div>
        </div>
        
        <script type="text/javascript">
        	$(".delete-product").on("click", function(){
        		var id = $(this).data("id");
        		if(confirm("Bạn có chắc chắn muốn xóa?") == true){
        			window.location.href = '<c:url value="/quan-tri/xoa-san-pham/'+id+'" />';
        			
        		}
        		
        	});
        </script>
</body>
