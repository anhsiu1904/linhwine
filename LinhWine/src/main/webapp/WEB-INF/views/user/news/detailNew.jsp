<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<main id="main" class="">

		<div class="row category-page-row"
			style="display: flex; justify-content: center;">
			<div class="col large-12">
				<div class="shop-container">

					<div class="row">
						<div class="col-md-3">
							<b>DANH MỤC BÀI VIẾT</b>
							<c:forEach var="item" items="${newCategory }">
								<p class="mt-3">
									<a href="<c:url value="/tin-tuc/${item.id }" />"
										class="mt-4"> ${item.name }</a>
								</p>
								<div style="padding: 5px; border-bottom: 1px solid #ccc"></div>
							</c:forEach>
						</div>
						<div class="col-md-9">

							<div class="col-md-12">

								<div class="overflow-hidden">
									<h3 style="font-weight:bold;text-align: center;">${newById.tieu_de }</h3>
									<div class="post-content">${newById.noi_dung }</div>
								</div>




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