<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>


	
	<main id="main" class="">

		<div class="shop-page-title category-page-title page-title ">
			<div class="page-title-inner flex-row  medium-flex-wrap container">
				<div class="flex-col flex-grow medium-text-center">
					<h1 class="shop-page-title is-xlarge categorycustom">Danh sách
						sản phẩm</h1>
					<div class="is-small">
						<nav class="woocommerce-breadcrumb breadcrumbs ">
						
							
						
							
						</nav>
					</div>
					<div class="category-filtering category-filter-row show-for-medium">
						<a href="#" data-open="#shop-sidebar" data-visible-after="true"
							data-pos="left" class="filter-button uppercase plain"> <i
							class="icon-equalizer"></i> <strong>Lọc</strong>
						</a>
						<div class="inline-block"></div>
					</div>
				</div>
				<div class="flex-col medium-text-center">
					
						<select name="loc" class="orderby"
							>
							<option  value="menu_order" >Thứ
								tự mặc định</option>
							<option name="loc" value="tang">Theo giảm giá: thấp đến
								cao</option>
							<option name="loc" value="giam">Theo giảm giá: cao xuống
								thấp</option>
						</select>

					
				</div>
			</div>
		</div>
			
		

		<div class="row category-page-row"
			style="display: flex; justify-content: center;">
			<div class="col large-9">
				<div class="shop-container">

					<div class="woocommerce-notices-wrapper"></div>
					<div
						class="products row row-small large-columns-4 medium-columns-3 small-columns-2 has-equal-box-heights equalize-box">

						<c:if test="${not empty sortPage }">
							<c:set var="list" value="${sortPage }" />
							<c:set var="type" value="${type }" />
							
						</c:if>
						
						<c:if test="${empty sortPage }">
							<c:set var="list" value="${productsPage }" />
						
						</c:if>

								<c:forEach var="item" items="${list }">

							<div
								class="product-small col has-hover product type-product post-7098 status-publish first instock product_cat-bo-duong-da product_cat-my-pham-duong-da has-post-thumbnail sale shipping-taxable purchasable product-type-simple">
								<div class="col-inner">
										
									<c:if test="${item.giam_gia > 0 }">

										<div class="absolute left top z-1">
											<div class="callout badge badge-circle">
												<div class="badge-inner secondary on-sale">
													<span class="onsale">- ${item.giam_gia} %</span>
												</div>
											</div>
										</div>

									</c:if>


									<div class="product-small box ">
										<div class="box-image">
											<div class="image-zoom">
												<a href="<c:url value="/chi-tiet-san-pham/${item.id_product}" />"> <img width="247" height="247"
													style="max-height: 247px"
													src="<c:url value="/assets/user/img/${item.anh}" />"
													class="attachment-woocommerce_thumbnail size-woocommerce_thumbnail lazy-load-active"
													alt="" loading="lazy"
													sizes="(max-width: 247px) 100vw, 247px">
												</a>
											</div>
											<div class="image-tools is-small top right show-on-hover">
											</div>
											<div
												class="image-tools is-small hide-for-small bottom left show-on-hover">
											</div>
											<div
												class="image-tools grid-tools text-center hide-for-small bottom hover-slide-in show-on-hover">
											</div>
										</div>

										<div class="box-text text-left">
											<div class="title-wrapper">
												<p
													class="name product-title woocommerce-loop-product__title">
													<a href="<c:url value="/chi-tiet-san-pham/${item.id_product}" />"
														class="woocommerce-LoopProduct-link woocommerce-loop-product__link">
														${item.tensp }</a>
												</p>
											</div>
											<c:if test="${item.giam_gia>0 }">

												<div class="price-wrapper">
													<span class="price"><del>
															<span class="woocommerce-Price-amount amount"><bdi>
																<fmt:formatNumber type="number" maxIntegerDigits="9"
																	value="${item.gia }" />
																<span class="woocommerce-Price-currencySymbol">&#8363;</span></bdi>
															</span>
														</del> <ins>
															<span class="woocommerce-Price-amount amount"><bdi>
																<fmt:formatNumber type="number" maxIntegerDigits="9"
																	value="${item.gia - (item.gia * item.giam_gia/100) }" />
																<span class="woocommerce-Price-currencySymbol">&#8363;</span></bdi></span>
														</ins></span>
												</div>

											</c:if>
											<c:if test="${item.giam_gia == 0}">

												<div class="price-wrapper">
													<span class="price"><del>
															<span class="woocommerce-Price-amount amount"><bdi>
																<span class="woocommerce-Price-currencySymbol"></span></bdi> </span>
														</del> <ins>
															<span class="woocommerce-Price-amount amount"><bdi>
																<fmt:formatNumber type="number" maxIntegerDigits="9"
																	value="${item.gia }" />
																<span class="woocommerce-Price-currencySymbol">&#8363;</span></bdi></span>
														</ins></span>
												</div>

											</c:if>

										</div>
									</div>
								</div>
							</div>



						</c:forEach>




					</div>


					<div class="container">
						<nav class="woocommerce-pagination">
							<div class="pagination-container">
								<ul class="text-center links nav-pagination page-numbers">
									<c:if test="${empty sortPage }">
										<c:forEach var="item" begin="1" end="${pageProductInfo.totalPage }" varStatus="loop">
											
											<c:if test="${(loop.index) == pageProductInfo.currentPage }">
												<li class="page-number active"><a href="<c:url value="/tat-ca-san-pham/${loop.index }" />">${(loop.index)}</a></li>
											</c:if>
											<c:if test="${(loop.index) != pageProductInfo.currentPage }">
												<li class="page-number"><a href="<c:url value="/tat-ca-san-pham/${loop.index }" />">${(loop.index)}</a></li>
											</c:if>
											
										
										</c:forEach>
									</c:if>
									<c:if test="${not empty sortPage }">
										<c:forEach var="item" begin="1" end="${sortProductInfo.totalPage }" varStatus="loop">
											
											<c:if test="${(loop.index) == sortProductInfo.currentPage }">
												<li class="page-number active"><a href="<c:url value="/tat-ca-san-pham/${type }/${loop.index }" />">${(loop.index)}</a></li>
											</c:if>
											<c:if test="${(loop.index) != sortProductInfo.currentPage }">
												<li class="page-number"><a href="<c:url value="/tat-ca-san-pham/${type }/${loop.index }" />">${(loop.index)}</a></li>
											</c:if>
											
										
										</c:forEach>
									</c:if>
									
								</ul>
							</div>

						</nav>
					</div>

				</div>
				<!-- shop container -->
			</div>
		</div>


										


	</main>
	
	<script>
        
	           $(".orderby").change(function() {
	        	  
	        	   var status = $(".orderby").val();
	        	   window.location =  "/LinhWine/tat-ca-san-pham/"+status+"/1";
	           		});
           
           
           </script>
</body>
