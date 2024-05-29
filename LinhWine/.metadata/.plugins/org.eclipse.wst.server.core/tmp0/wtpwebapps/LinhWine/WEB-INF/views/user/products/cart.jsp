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
        
        
        
                            <div class="woocommerce">
                                <div class="woocommerce-notices-wrapper"></div>
                                <div class="woocommerce row row-large row-divided">
                                    <div class="col large-7 pb-0 ">
        
        
                                        <div class="cart-wrapper sm-touch-scroll">
        
                                            
                                                
                                           
                                            <table class="shop_table shop_table_responsive cart woocommerce-cart-form__contents" cellspacing="0">
                                                <thead>
                                                    <tr>
                                                        <th class="product-name" colspan="3">Sản phẩm</th>
                                                        <th class="product-price">Giá</th>
                                                        <th class="product-quantity">Số lượng</th>
                                                        <th class="product-subtotal">Tạm tính</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                      
                                                      
                                                        
                                                	<c:forEach var="item" items="${ Cart }">
                                                		<tr class="woocommerce-cart-form__cart-item cart_item">
                                                            <td style="padding: 20px;text-align: center">
                                                                
                                                                    <a href='<c:url value="/del-cart/${item.key}"/>' type="button" style="background: #f12323; color: #fff; border-radius: 50%" class="btn btn-sm" >X</a>
                                                                
                                                            </td>
                                                            <td class="product-thumbnail" >
                                                                <img width="200" height="auto" src='<c:url value="/assets/user/img/${item.value.product.anh}" />' class="img-custom" alt="" loading="lazy">
                                                            </td>
                                                            <td class="product-name" data-title="Sản phẩm"> ${item.value.product.tensp}</td>
                                                            
                                                            <c:if test="${item.value.product.giam_gia > 0}">
                                                            
                                                            	<td style="padding: 20px;text-align: center">
                                                            	<del>
	                                                            	<span class="woocommerce-Price-amount amount"><bdi>
																		<fmt:formatNumber type="number" maxIntegerDigits="9"
																			value="${item.value.product.gia }" /> <span
																			class="woocommerce-Price-currencySymbol">&#8363;</span></bdi>
																	</span></del>
	                                                                <span class="woocommerce-Price-amount amount">
	                                                                    <bdi><fmt:formatNumber type="number" maxIntegerDigits="9"
																		value=" ${item.value.product.gia*(1-item.value.product.giam_gia/100) }" /><span> <class ="woocommerce-price-currencysymbol"="">₫</class></span></bdi>
	                                                                </span>
	                                                               
	                                                            </td>
                                                            
                                                            </c:if>
                                                            <c:if test="${item.value.product.giam_gia == 0}">
                                                            
                                                            	<td style="padding: 20px;text-align: center">
	                                                                <span class="woocommerce-Price-amount amount">
	                                                                    <bdi><fmt:formatNumber type="number" maxIntegerDigits="9"
																		value=" ${item.value.product.gia }" /><span> <class ="woocommerce-price-currencysymbol"="">₫</class></span></bdi>
	                                                                </span>
	                                                            </td>
                                                            
                                                            </c:if>
                                                            
                                                            
                                                            <td style="padding: 20px">
                                                               
                                                                    <div class="quantity buttons_added ">
                                                                    	
	                                                                        <input style="background: #eee"  type="submit" value="-" class="minus button is-form ">
	                                                                        <input type="number"  class="input-text qty text" step="1" min="1" max="${item.value.product.so_luong_ton}" name="SoLuong" value="${item.value.quanty}" title="SL" 
	                                                                        size="4" placeholder="" inputmode="numeric" id="quanty-cart-${item.key }">
	                                                                        <input style="background: #eee"   type="button" value="+" class="plus button is-form ">
                                                                    	
                                                                    		<div class="mt-2 edit-cart" data-id="${item.key }" style="padding-left:10px;"><i class="fas fa-sync" ></i></div>
                                                                    </div>
                                                                   
                                                                	
                                                            </td>
        													
        														
        													
                                                            <td style="padding: 20px;text-align: center">
                                                                <span class="woocommerce-Price-amount amount">
                                                                    <bdi><fmt:formatNumber type="number" maxIntegerDigits="9"
																	value="${item.value.totalPrice}" /><span class="woocommerce-Price-currencySymbol">₫</span></bdi>
                                                                </span>
        
                                                            </td>
                                                            <td style="padding: 20px;text-align: center">
                                                            </td>
        
                                                        </tr>
                                                	</c:forEach>
                                              
        
                                                    <tr>
                                                        <td colspan="6" class="actions clear">
        
        
                                                            <div class="continue-shopping pull-left text-left mt-2">
                                                                <a class="button-continue-shopping button primary is-outline" href='<c:url value="/" />'>
                                                                    ←&nbsp;Tiếp tục xem sản phẩm
                                                                </a>
                                                            </div>
        
                                                        </td>
                                                    </tr>
        
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
        
        
                                    <div class="cart-collaterals large-5 col pb-0">
        
                                        <div class="cart-sidebar col-inner ">
                                            <div class="cart_totals ">
        
                                                <table cellspacing="0">
                                                    <thead>
                                                        <tr>
                                                            <th class="product-name" colspan="2" style="border-width:3px;">Cộng giỏ hàng</th>
                                                        </tr>
                                                    </thead>
                                                </table>
        
                                                <h2>Cộng giỏ hàng</h2>
        
                                                <table cellspacing="0" class="shop_table shop_table_responsive">
        
                                                    <tbody>
                                                        <tr class="cart-subtotal">
                                                            <th>Tổng Tiền</th>
                                                            <td data-title="Tạm tính">
                                                                <span class="woocommerce-Price-amount amount">
                                                                    <bdi><fmt:formatNumber type="number" maxIntegerDigits="9"
																	value="${TotalPriceCart }" /><span class="woocommerce-Price-currencySymbol">₫</span></bdi>
                                                                </span>
                                                            </td>
                                                        </tr>
        
                                                    </tbody>
                                                </table>
        										<c:if test="${not empty Cart }">
        											<div class="wc-proceed-to-checkout">
        
                                                    <a href='<c:url value="/checkout" />' class="checkout-button button alt wc-forward">
                                                        Tiến hành thanh toán
                                                    </a>
                                                </div>
        										</c:if>
                                                
                                            </div>
        
                                            <div class="cart-sidebar-content relative"></div>
                                        </div>
        
                                    </div>
                                </div>
        
                                <div class="cart-footer-content after-cart-content relative"></div>
                            </div>
        
        
                        </div>
                    </div>
                </div>
            </div>
        
                </main>
           <content tag="script">
           <script>
	           $(".edit-cart").on("click", function() {
	           			var id = $(this).data("id");
	           			var quanty = $("#quanty-cart-"+id).val();
	           			window.location = "edit-cart/"+id+"/"+quanty;
	           		});
           
           
           </script>
           
           
           </content>
</body>
