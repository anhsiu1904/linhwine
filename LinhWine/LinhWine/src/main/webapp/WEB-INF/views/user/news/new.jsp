<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<main id="main" class="">

		<div class="row category-page-row"
			style="display: flex; justify-content: center;">
			<div class="col large-12">
				<div class="shop-container">

					<div class="row" >
					<div class="col-md-3" >
						<b >DANH MỤC BÀI VIẾT</b>
						<c:forEach var="item" items="${newCategory }">
							<p class="mt-3"><a href="<c:url value="/tin-tuc/${item.id }" />" class="mt-4"> ${item.name }</a></p>
							<div style="padding: 5px; border-bottom: 1px solid #ccc"></div>
						</c:forEach>
					</div>
					<div class="col-md-9" >
					<h2>TẤT CẢ BÀI VIẾT</h2>
						<div class="col-md-12" >
						
						<c:forEach var="item" items="${allNews }">
						
							<div class="row mt-4">
                            <div class="col-md-4 ">
                                <div>
                                    <a href="<c:url value="/chi-tiet-tin-tuc/${item.id_new }" />">
                                        <img class="img-post" src="<c:url value="/assets/user/img/${item.anh }" />" alt="ảnh"
                                            style="width:100%;padding-bottom:20px">
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="description-post">
                                    <a href="<c:url value="/chi-tiet-tin-tuc/${item.id_new }" />">
                                        <h4>${item.tieu_de } </h4>
                                    </a>
                                    <p>
                                    	 ${item.tom_tat }
                                    </p>
                                    <div class="seemore-post" style="padding-top:20px;">
                                        <a href="<c:url value="/chi-tiet-tin-tuc/${item.id_new }" />">
                                            <span>Xem thêm >></span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div style="padding: 10px; border-bottom: 1px solid #ccc"></div>
                        </div>
						
						</c:forEach>
						
                        
                        
                        
                    </div>

                    
                </div>
                
					</div>
					
					</div>

					

				</div>
				<!-- shop container -->
			</div>
		</div>


										


	</main>
</body>
