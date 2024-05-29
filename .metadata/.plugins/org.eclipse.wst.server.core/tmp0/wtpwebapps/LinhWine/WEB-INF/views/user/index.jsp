<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>

	<main id="main" class="">
		<div id="content" class="content-area page-wrapper" role="main">
			<div class="row row-main">
				<div class="large-12 col">
					<div class="col-inner">



						<section class="section" id="section_1326188305">
							<div class="bg section-bg fill bg-fill  bg-loaded"></div>

							<div class="section-content relative">

								<div class="row row-collapse slider-row" id="row-1720902744">

									<div id="" class="col mt-2">
										<div class="col-inner">


											<div class="slider-wrapper relative" id="slider-1805072704">
												<div
													class="slider slider-nav-simple slider-nav-normal slider-nav-light slider-style-normal"
													style="height: 503.25px"
													data-flickity-options='{
														"cellAlign": "center",
														"imagesLoaded": true,
														"lazyLoad": 1,
														"freeScroll": false,
														"wrapAround": true,
														"autoPlay": 6000,
														"pauseAutoPlayOnHover" : true,
														"prevNextButtons": true,
														"contain" : true,
														"adaptiveHeight" : true,
														"dragThreshold" : 10,
														"percentPosition": true,
														"pageDots": true,
														"rightToLeft": false,
														"draggable": true,
														"selectedAttraction": 0.1,
														"parallax" : 0,
														"friction": 0.6        }'>

													<c:forEach var="item" items="${ slides }" varStatus="index">

														<c:if test="${ index.first }">
															<div class="img has-hover x md-x lg-x y md-y lg-y active">
														</c:if>
														<c:if test="${ not index.first }">
															<div class="img has-hover x md-x lg-x y md-y lg-y">
														</c:if>
														<div class="img-inner dark">

															<img width="900" height="447"
																data-src="<c:url value="/assets/user/img/slides/${ item.img }"/>"
																class="lazy-load attachment-original size-original"
																alt="" loading="lazy" srcset="" />
														</div>
												</div>

												</c:forEach>






											</div>



										</div>


									</div>
								</div>





							</div>
					</div>


					</section>

					<section class="section" id="section_1349002936">
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
														<a class="title-holder" href="#">SẢN PHẨM BÁN CHẠY</a>
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
														
																<c:forEach var="item" items="${ products }">

																	<div class="col" style="">
                                                                    <div class="col-inner">
																		
																		<c:if test="${item.giam_gia>0 }">
																			
																			<div class="badge-container absolute left top z-1">
	                                                                            <div class="callout badge badge-circle">
	                                                                                <div class="badge-inner secondary on-sale"><span class="onsale">${item.giam_gia } %</span></div>
	                                                                            </div>
                                                                        	</div>
																		
																		</c:if>
																		
                                                                        
                                                                        <div class="product-small box has-hover box-normal box-text-bottom">
                                                                            <div class="box-image ">
                                                                                <div class="">
                                                                                    <a href="<c:url value="/chi-tiet-san-pham/${item.id_product}" />">
                                                                                        <img width="247" height="247" src="<c:url value="/assets/user/img/${ item.anh }" />"
                                                                                            class="lazy-load attachment-woocommerce_thumbnail size-woocommerce_thumbnail" alt="" loading="lazy" srcset="" 
                                                                                            sizes="max-width: 247px 100vw, 247px" /> </a>
                                                                                </div>
                                                                                <div class="image-tools top right show-on-hover">
                                                                                </div>
                                                                                <div class="image-tools grid-tools text-center hide-for-small bottom hover-slide-in show-on-hover">
                                                                                </div>
                                                                            </div>

                                                                            <div class="box-text text-left">
                                                                                <div class="title-wrapper">
                                                                                    <p class="name product-title woocommerce-loop-product__title"><a href="<c:url value="/chi-tiet-san-pham/${item.id_product}" />" class="woocommerce-LoopProduct-link woocommerce-loop-product__link"> ${item.tensp }</a></p>
                                                                                </div>
                                                                                <c:if test="${item.giam_gia>0 }">
                                                                                	
                                                                                	<div class="price-wrapper">
                                                                                    	<span class="price"><del><span class="woocommerce-Price-amount amount"><bdi> <fmt:formatNumber type="number" maxIntegerDigits="9" value="${item.gia }" /><span class="woocommerce-Price-currencySymbol">&#8363;</span></bdi>
                                                                                    	</span>
                                                                                   		 </del> <ins><span class="woocommerce-Price-amount amount"><bdi><fmt:formatNumber type="number" maxIntegerDigits="9" value="${item.gia - (item.gia * item.giam_gia/100) }" /><span class="woocommerce-Price-currencySymbol">&#8363;</span></bdi></span></ins></span>
                                                                               		 </div>
                                                                                
                                                                                </c:if>
                                                                                <c:if test="${item.giam_gia == 0}">
                                                                                	
                                                                                	<div class="price-wrapper">
                                                                                    		<span class="price"><del><span class="woocommerce-Price-amount amount"><bdi><span class="woocommerce-Price-currencySymbol"></span></bdi>
                                                                                    	</span>
                                                                                   		 </del> <ins><span class="woocommerce-Price-amount amount"><bdi><fmt:formatNumber type="number" maxIntegerDigits="9" value="${item.gia }" /><span class="woocommerce-Price-currencySymbol">&#8363;</span></bdi></span></ins></span>
                                                                               		 </div>
                                                                                
                                                                                </c:if>
                                                                                
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

																</c:forEach>

															
													</div>
												</div>
											</div>


										</div>
									</div>
								</div>


							</div>
						</div>


						<style>
#section_1349002936 {
	padding-top: 23px;
	padding-bottom: 23px;
	background-color: rgb(247, 247, 247);
}
</style>
					</section>

					<section class="section" id="section_1621298227">
						<div class="bg section-bg fill bg-fill  bg-loaded"></div>

						<div class="section-content relative">

							<div class="row" id="row-716974624">

								<div id="col-1224518826"
									class="col div-no-padding small-12 large-12">
									<div class="col-inner">


										<div class="row row-tieu-de" id="row-1040301362">

											<div id="col-292984479"
												class="col div-tieu-de small-12 large-12">
												<div class="col-inner">


													<h3 class="title-comm">
														<a class="title-holder" href="#">Sản phẩm nổi bật</a>
													</h3>
												</div>
											</div>


										</div>
										<div class="row" id="row-794493420">

											<div id="col-1814678907"
												class="col list-product div-no-padding small-12 large-12">
												<div class="col-inner">




													<div
														class="row large-columns-4 medium-columns-3 small-columns-2 row-small slider row-slider slider-nav-simple slider-nav-push"
														data-flickity-options='{"imagesLoaded": true, "groupCells": "100%", "dragThreshold" : 5, "cellAlign": "left","wrapAround": true,"prevNextButtons": true,"percentPosition": true,"pageDots": false, "rightToLeft": false, "autoPlay" : false}'>



															<c:forEach var="item" items="${ hightlight }">

																	<div class="col" style="">
                                                                    <div class="col-inner">
																		
																		<c:if test="${item.giam_gia>0 }">
																			
																			<div class="badge-container absolute left top z-1">
	                                                                            <div class="callout badge badge-circle">
	                                                                                <div class="badge-inner secondary on-sale"><span class="onsale">${item.giam_gia } %</span></div>
	                                                                            </div>
                                                                        	</div>
																		
																		</c:if>
																		
                                                                        
                                                                        <div class="product-small box has-hover box-normal box-text-bottom">
                                                                            <div class="box-image ">
                                                                                <div class="">
                                                                                    <a href="<c:url value="/chi-tiet-san-pham/${item.id_product}" />">
                                                                                        <img width="247" height="247" src="<c:url value="/assets/user/img/${ item.anh }" />"
                                                                                            class="lazy-load attachment-woocommerce_thumbnail size-woocommerce_thumbnail" alt="" loading="lazy" srcset="" 
                                                                                            sizes="max-width: 247px 100vw, 247px" /> </a>
                                                                                </div>
                                                                                <div class="image-tools top right show-on-hover">
                                                                                </div>
                                                                                <div class="image-tools grid-tools text-center hide-for-small bottom hover-slide-in show-on-hover">
                                                                                </div>
                                                                            </div>

                                                                            <div class="box-text text-left">
                                                                                <div class="title-wrapper">
                                                                                    <p class="name product-title woocommerce-loop-product__title"><a href="<c:url value="/chi-tiet-san-pham/${item.id_product}" />" class="woocommerce-LoopProduct-link woocommerce-loop-product__link"> ${item.tensp }</a></p>
                                                                                </div>
                                                                                <c:if test="${item.giam_gia>0 }">
                                                                                	
                                                                                	<div class="price-wrapper">
                                                                                    	<span class="price"><del><span class="woocommerce-Price-amount amount"><bdi> <fmt:formatNumber type="number" maxIntegerDigits="9" value="${item.gia }" /><span class="woocommerce-Price-currencySymbol">&#8363;</span></bdi>
                                                                                    	</span>
                                                                                   		 </del> <ins><span class="woocommerce-Price-amount amount"><bdi><fmt:formatNumber type="number" maxIntegerDigits="9" value="${item.gia - (item.gia * item.giam_gia/100) }" /><span class="woocommerce-Price-currencySymbol">&#8363;</span></bdi></span></ins></span>
                                                                               		 </div>
                                                                                
                                                                                </c:if>
                                                                                <c:if test="${item.giam_gia == 0}">
                                                                                	
                                                                                	<div class="price-wrapper">
                                                                                    		<span class="price"><del><span class="woocommerce-Price-amount amount"><bdi><span class="woocommerce-Price-currencySymbol"></span></bdi>
                                                                                    	</span>
                                                                                   		 </del> <ins><span class="woocommerce-Price-amount amount"><bdi><fmt:formatNumber type="number" maxIntegerDigits="9" value="${item.gia }" /><span class="woocommerce-Price-currencySymbol">&#8363;</span></bdi></span></ins></span>
                                                                               		 </div>
                                                                                
                                                                                </c:if>
                                                                                
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

																</c:forEach>
														

														
													</div>
												</div>
											</div>


										</div>
									</div>
								</div>


							</div>
						</div>


						<style>
#section_1621298227 {
	padding-top: 0px;
	padding-bottom: 0px;
	background-color: rgb(247, 247, 247);
}
</style>
					</section>

					<section class="section" id="section_506742226">
						<div class="bg section-bg fill bg-fill  bg-loaded"></div>

						<div class="section-content relative">

							<div class="row" id="row-1438155365">

								<div id="col-2145562401"
									class="col div-no-padding small-12 large-12">
									<div class="col-inner">


										<div class="row row-tieu-de" id="row-26320516">

											<div id="col-621058188"
												class="col div-tieu-de small-12 large-12">
												<div class="col-inner">


													<h3 class="title-comm">
														<a class="title-holder" href="#">VANG NGON DƯỚI 1000K</a>
													</h3>
												</div>
											</div>


										</div>
										<div class="row" id="row-1601378843">

											<div id="col-1818147593"
												class="col list-product div-no-padding small-12 large-12">
												<div class="col-inner">




													<div
														class="row large-columns-4 medium-columns-3 small-columns-2 row-small slider row-slider slider-nav-simple slider-nav-push"
														data-flickity-options='{"imagesLoaded": true, "groupCells": "100%", "dragThreshold" : 5, "cellAlign": "left","wrapAround": true,"prevNextButtons": true,"percentPosition": true,"pageDots": false, "rightToLeft": false, "autoPlay" : false}'>


															<c:forEach var="item" items="${ vang }">

																	<div class="col" style="">
                                                                    <div class="col-inner">
																		
																		<c:if test="${item.giam_gia>0 }">
																			
																			<div class="badge-container absolute left top z-1">
	                                                                            <div class="callout badge badge-circle">
	                                                                                <div class="badge-inner secondary on-sale"><span class="onsale">${item.giam_gia } %</span></div>
	                                                                            </div>
                                                                        	</div>
																		
																		</c:if>
																		
                                                                        
                                                                        <div class="product-small box has-hover box-normal box-text-bottom">
                                                                            <div class="box-image ">
                                                                                <div class="">
                                                                                    <a href="<c:url value="/chi-tiet-san-pham/${item.id_product}" />">
                                                                                        <img width="247" height="247" src="<c:url value="/assets/user/img/${ item.anh }" />"
                                                                                            class="lazy-load attachment-woocommerce_thumbnail size-woocommerce_thumbnail" alt="" loading="lazy" srcset="" 
                                                                                            sizes="max-width: 247px 100vw, 247px" /> </a>
                                                                                </div>
                                                                                <div class="image-tools top right show-on-hover">
                                                                                </div>
                                                                                <div class="image-tools grid-tools text-center hide-for-small bottom hover-slide-in show-on-hover">
                                                                                </div>
                                                                            </div>

                                                                            <div class="box-text text-left">
                                                                                <div class="title-wrapper">
                                                                                    <p class="name product-title woocommerce-loop-product__title"><a href="<c:url value="/chi-tiet-san-pham/${item.id_product}" />" class="woocommerce-LoopProduct-link woocommerce-loop-product__link"> ${item.tensp }</a></p>
                                                                                </div>
                                                                                <c:if test="${item.giam_gia>0 }">
                                                                                	
                                                                                	<div class="price-wrapper">
                                                                                    	<span class="price"><del><span class="woocommerce-Price-amount amount"><bdi> <fmt:formatNumber type="number" maxIntegerDigits="9" value="${item.gia }" /><span class="woocommerce-Price-currencySymbol">&#8363;</span></bdi>
                                                                                    	</span>
                                                                                   		 </del> <ins><span class="woocommerce-Price-amount amount"><bdi><fmt:formatNumber type="number" maxIntegerDigits="9" value="${item.gia - (item.gia * item.giam_gia/100) }" /><span class="woocommerce-Price-currencySymbol">&#8363;</span></bdi></span></ins></span>
                                                                               		 </div>
                                                                                
                                                                                </c:if>
                                                                                <c:if test="${item.giam_gia == 0}">
                                                                                	
                                                                                	<div class="price-wrapper">
                                                                                    		<span class="price"><del><span class="woocommerce-Price-amount amount"><bdi><span class="woocommerce-Price-currencySymbol"></span></bdi>
                                                                                    	</span>
                                                                                   		 </del> <ins><span class="woocommerce-Price-amount amount"><bdi><fmt:formatNumber type="number" maxIntegerDigits="9" value="${item.gia }" /><span class="woocommerce-Price-currencySymbol">&#8363;</span></bdi></span></ins></span>
                                                                               		 </div>
                                                                                
                                                                                </c:if>
                                                                                
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

																</c:forEach>

														

														
													</div>
												</div>
											</div>


										</div>
									</div>
								</div>


							</div>
						</div>


						<style>
#section_506742226 {
	padding-top: 23px;
	padding-bottom: 23px;
	background-color: rgb(247, 247, 247);
}
</style>
					</section>

					



				</div>
			</div>
		</div>
		</div>


	</main>
</body>
