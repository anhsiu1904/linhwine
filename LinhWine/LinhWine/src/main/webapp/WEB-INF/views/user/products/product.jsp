<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>


	<main id="main" class="container">

		<div class="container">

			<div id="product-6932"
				class="product type-product post-6932 status-publish first instock product_cat-bo-my-pham-tri-nam-va-tan-nhang has-post-thumbnail sale shipping-taxable purchasable product-type-simple">
				<div class="product-container mt-3">

					<div class="">
						<div class="row content-row mb-0">

							<div class="product-gallery col large-5 mt-2"
								style='padding-left: 31px'>


								<div
									class="product-images relative mb-half has-hover woocommerce-product-gallery woocommerce-product-gallery--with-images woocommerce-product-gallery--columns-4 images"
									data-columns="4" style="border-style: groove">
									<c:if test="${product.giam_gia > 0 }">

										<div class="absolute left top z-1">
											<div class="callout badge badge-circle">
												<div class="badge-inner secondary on-sale">
													<span class="onsale">- ${product.giam_gia} %</span>
												</div>
											</div>
										</div>

									</c:if>
									<div class="woocommerce-product-gallery__image slide first">
										<img width="510" height="510"
											src='<c:url value="/assets/user/img/${product.anh }" />'
											class="lazy-load wp-post-image skip-lazy"
											sizes="(max-width: 510px) 100vw, 510px" />
									</div>
								</div>

							</div>


							<div
								class="product-info summary col-fit col entry-summary product-summary">
								<h1 class="product-title product_title entry-title"></h1>
								<p style="display: none" id="spid"></p>

								<div>
									<p class="price product-page-price price-on-sale">
										<span>${product.tensp }</span>
										<ins>
											<span class="woocommerce-Price-amount amount"><bdi>
												<span id="priceConvert"></span></bdi></span>
										</ins>
									</p>
								</div>

								<table class="st-pd-table" style="font-size: 15px">
									<tbody>

										<tr>
											<td>Tình trạng:</td>

											<c:if test="${product.so_luong_ton > 0 }">

												<td><p class="product-description"
														style='color: green;'>Còn hàng</p></td>

											</c:if>

											<c:if test="${product.so_luong_ton == 0 }">

												<td><p class="product-description" style='color: red;'>
														Hết hàng</p></td>

											</c:if>
										</tr>

										<tr>
											<td>Thương hiệu:</td>
											<td><p class="product-description">
													${product.thuong_hieu }</p></td>
										</tr>

										<tr>
											<td>Xuất xứ:</td>
											<td><p class="product-description">
													${product.xuat_xu }</p></td>
										</tr>

										<tr>
											<td>Nồng độ:</td>
											<td><p class="product-description">
													${product.nong_do }</p></td>
										</tr>

										<c:if test="${product.tuoi_ruou >0 }">
											<tr>
												<td>Tuổi rượu/Phân hạng:</td>
												<td><p class="product-description">
														${product.tuoi_ruou }</p></td>
											</tr>
										</c:if>



										<tr>
											<td>Phân loại:</td>
											<td><p class="product-description">${product.loaisp }</p></td>
										</tr>

										<c:if test="${product.bo_suu_tap.length() > 0 }">
											<tr>
												<td>Bộ sưu tập:</td>
												<td><p class="product-description">
														${product.bo_suu_tap }</p></td>
											</tr>
										</c:if>



									</tbody>
								</table>




								<div class="is-divider small"></div>
								<div>
									<p class="price product-page-price price-on-sale">
										<span>Giá bán :</span>
										<ins>
											<c:if test="${product.giam_gia>0 }">

												<div class="price-wrapper">
													<span class="price"><del>
															<span class="woocommerce-Price-amount amount"><bdi>
																<fmt:formatNumber type="number" maxIntegerDigits="9"
																	value="${product.gia }" /> <span
																	class="woocommerce-Price-currencySymbol">&#8363;</span></bdi>
															</span>
														</del> <ins>
															<span class="woocommerce-Price-amount amount"><bdi>
																<fmt:formatNumber type="number" maxIntegerDigits="9"
																	value="${product.gia - (product.gia * product.giam_gia/100) }" />
																<span class="woocommerce-Price-currencySymbol">&#8363;</span></bdi></span>
														</ins></span>
												</div>

											</c:if>
											<c:if test="${product.giam_gia == 0}">

												<div class="price-wrapper">
													<span class="price"><del>
															<span class="woocommerce-Price-amount amount"><bdi>
																<span class="woocommerce-Price-currencySymbol"></span></bdi> </span>
														</del> <ins>
															<span class="woocommerce-Price-amount amount"><bdi>
																<fmt:formatNumber type="number" maxIntegerDigits="9"
																	value="${product.gia }" /> <span
																	class="woocommerce-Price-currencySymbol">&#8363;</span></bdi></span>
														</ins></span>
												</div>

											</c:if>
										</ins>
									</p>
								</div>
								
								<c:if test="${product.so_luong_ton >0 }">
									<div class="row col-12">
									
									
									
										
											
										<form method="get" action="<c:url value="/add-cart/${product.id_product }" />">	
											<div class="action">
												<button
													class="mt-1 single_add_to_cart_button button alt add-cart"  style="height:35px;width:300px;"
													type="submit">
													<i class="fas fa-shopping-cart"></i> Thêm vào giỏ hàng
												</button>
											</div>
										</form>		
										
									
								</div>
								</c:if>
								
								
							</div>

							<div id="product-sidebar"
								class="col large-3 hide-for-medium product-sidebar-small"
								style='padding-top: 40px'>
								<div class="row tieu-chi-sidebar " id="row-1179559846">
									<div id="col-1076857932"
										class="col div-cam-ket small-12 large-12  ">
										<div class="col-inner">
											<aside id="custom_html-13"
												class="widget_text widget widget_custom_html">
												<span class="widget-title shop-sidebar">Cam Kết Mua
													Hàng</span>
												</p>
												<div class="is-divider small"></div>
												<div class="textwidget custom-html-widget">
													<ul class="list-camket" style="padding: 10px">
														<li><i class="fa fa-check-circle" aria-hidden="true"></i>
															Cam kết 100% hàng chính hãng.</li>
														<li><i class="fa fa-check-circle" aria-hidden="true"></i>
															Nhân viên tư vấn tận tình, chu đáo.</li>
														<li><i class="fa fa-check-circle" aria-hidden="true"></i>
															Xem hàng kiểm tra hàng trước khi thanh toán.</li>
														<li><i class="fa fa-check-circle" aria-hidden="true"></i>
															Cam kết bồi hoàn 200% nếu sản phẩm kém chất lượng, ko rõ
															nguồn gốc.</li>
													</ul>
													
												</div>
											</aside>
										</div>
									</div>
								</div>
							</div>


						</div>
					</div>

					<c:if test="${product.mo_ta.length() > 0 }">

						<div class="product-footer mb-5">
							<div class="">
								<div class="large-12">
									<div class="container">
										<div class="product-page-accordian">
											<div class="san-pham-tab">
												<div>
													<h3 class="tab-thong-tin"
														style="padding: 10px; padding-left: 20px;">Chi tiết
														sản phẩm</h3>
													<div class="tab-thong-tin-trong">
														<div class="card-body">
															<table class="st-pd-table" style="font-size: 15px">
																${product.mo_ta }
															</table>

														</div>
													</div>

												</div>

											</div>
										</div>


									</div>
								</div>

							</div>


						</div>
					</c:if>

					<section class="section mt-5" id="section_1349002936">
						<div class="bg section-bg fill bg-fill  bg-loaded"></div>

						<div class="section-content relative">

							<div class="row" id="row-2082886737">

								<div id="col-1880555698"
									class="col div-no-padding small-12 large-12">
									<div class="col-inner">


										<div class="row row-tieu-de" id="row-1218091420">

											<div id="col-1549349624"
												class="col div-tieu-de small-12 large-12">
												<div class="col-inner">


													<h3 class="title-comm">
														<a class="title-holder" href="#">SẢN PHẨM LIÊN QUAN</a>
													</h3>
												</div>
											</div>


										</div>
										<div class="row" id="row-634888389">

											<div id="col-1034191091"
												class="col list-product div-no-padding small-12 large-12">
												<div class="col-inner">




													<div
														class="row large-columns-4 medium-columns-3 small-columns-2 row-small slider row-slider slider-nav-simple slider-nav-push"
														data-flickity-options='{"imagesLoaded": true, "groupCells": "100%", "dragThreshold" : 5, "cellAlign": "left","wrapAround": true,"prevNextButtons": true,"percentPosition": true,"pageDots": false, "rightToLeft": false, "autoPlay" : false}'>

														<c:set var="count" value="${ productByIdCategory.size() }" />
														<c:if test="${ productByIdCategory.size() > 12 }">
														
															<c:set var="count" value="12" />
														
														</c:if>
														
														<c:forEach var="item" begin="0" end="${ count}" items="${ productByIdCategory }">
														
															<c:if test="${product.id_product != item.id_product }">
															
																<div class="col" style="">
																<div class="col-inner">

																	<c:if test="${item.giam_gia>0 }">

																		<div class="badge-container absolute left top z-1">
																			<div class="callout badge badge-circle">
																				<div class="badge-inner secondary on-sale">
																					<span class="onsale">${item.giam_gia } %</span>
																				</div>
																			</div>
																		</div>

																	</c:if>


																	<div
																		class="product-small box has-hover box-normal box-text-bottom">
																		<div class="box-image ">
																			<div class="">
																				<a
																					href="<c:url value="/chi-tiet-san-pham/${item.id_product}" />">
																					<img width="247" height="247"
																					src="<c:url value="/assets/user/img/${ item.anh }" />"
																					class="lazy-load attachment-woocommerce_thumbnail size-woocommerce_thumbnail"
																					alt="" loading="lazy" srcset=""
																					sizes="max-width: 247px 100vw, 247px" />
																				</a>
																			</div>
																			<div class="image-tools top right show-on-hover">
																			</div>
																			<div
																				class="image-tools grid-tools text-center hide-for-small bottom hover-slide-in show-on-hover">
																			</div>
																		</div>

																		<div class="box-text text-left">
																			<div class="title-wrapper">
																				<p
																					class="name product-title woocommerce-loop-product__title">
																					<a
																						href="<c:url value="/chi-tiet-san-pham/${item.id_product}" />"
																						class="woocommerce-LoopProduct-link woocommerce-loop-product__link">
																						${item.tensp }</a>
																				</p>
																			</div>
																			<c:if test="${item.giam_gia>0 }">

																				<div class="price-wrapper">
																					<span class="price"><del>
																							<span class="woocommerce-Price-amount amount"><bdi>
																								<fmt:formatNumber type="number"
																									maxIntegerDigits="9" value="${item.gia }" />
																								<span class="woocommerce-Price-currencySymbol">&#8363;</span></bdi>
																							</span>
																						</del> <ins>
																							<span class="woocommerce-Price-amount amount"><bdi>
																								<fmt:formatNumber type="number"
																									maxIntegerDigits="9"
																									value="${item.gia - (item.gia * item.giam_gia/100) }" />
																								<span class="woocommerce-Price-currencySymbol">&#8363;</span></bdi></span>
																						</ins></span>
																				</div>

																			</c:if>
																			<c:if test="${item.giam_gia == 0}">

																				<div class="price-wrapper">
																					<span class="price"><del>
																							<span class="woocommerce-Price-amount amount"><bdi>
																								<span class="woocommerce-Price-currencySymbol"></span></bdi>
																							</span>
																						</del> <ins>
																							<span class="woocommerce-Price-amount amount"><bdi>
																								<fmt:formatNumber type="number"
																									maxIntegerDigits="9" value="${item.gia }" />
																								<span class="woocommerce-Price-currencySymbol">&#8363;</span></bdi></span>
																						</ins></span>
																				</div>

																			</c:if>

																		</div>
																	</div>
																</div>
															</div>
															
															</c:if>
															
																
															
															

															

														</c:forEach>


													</div>
												</div>
											</div>


										</div>
									</div>
								</div>


							</div>
						</div>


					</section>


				</div>
			</div>
			<br>
	</main>

</body>
