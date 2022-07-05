<%@ page language="java" session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="container">
	<div class="row">
		<div class="mt-5">
		<div class="mt-3">
<!-- Thông báo thêm thất bại  -->
<c:if test="${ !empty sessionScope.error_add_pro }">
	<div class="alert alert-danger">
		${ sessionScope.error_add_pro }
	</div>
	<c:remove var="error_add_pro" scope="session"/>
</c:if>
<!-- Thông báo thêm thành công -->
<c:if test="${ !empty sessionScope.mes_add_pro }">
	<div class="alert alert-success">
		${ sessionScope.mes_add_pro }
	</div>
	<c:remove var="mes_add_pro" scope="session"/>
</c:if>
<!-- thong bao update thanh cong -->
<c:if test="${ !empty sessionScope.mes_update_pro }">
	<div class="alert alert-success">
		${ sessionScope.mes_update_pro }
	</div>
	<c:remove var="mes_update_pro" scope="session"/>
</c:if>

<!--  Thông báo login thành công -->
<c:if test="${ !empty sessionScope.message1 }">
	<div class="alert alert-success">
		${ sessionScope.message1 }
	</div>
	<c:remove var="message1" scope="session"/>
</c:if>
<!-- thong bao xoa thanh cong -->
<c:if test="${ !empty sessionScope.mes_delete_pro }">
	<div class="alert alert-success">
		${ sessionScope.mes_delete_pro }
	</div>
	<c:remove var="mes_delete_pro" scope="session"/>
</c:if>
<!-- thong bao xoa that bai -->
<c:if test="${ !empty sessionScope.error_delete_pro }">
	<div class="alert alert-danger">
		${ sessionScope.error_delete_pro }
	</div>
	<c:remove var="error_delete_pro" scope="session"/>
</c:if>

<!-- thông báo filter check login -->
<c:if test="${ !empty sessionScope.filter_login }">
	<div class="alert alert-success">
		${ sessionScope.filter_login }
	</div>
	<c:remove var="filter_login" scope="session"/>
</c:if>
			<c:if test="${ empty ds }">
				<p class="alert alert-warning">Không có dữ liệu</p>
			</c:if>
	<h2>Danh Sách Sản Phẩm</h2>
	<hr>
	<br>
	<br>
			<c:if test="${ !empty ds }">
				<div class="container">
					<div class="row">
						<div class="col-12 col-md-4 mt-2">
							<c:forEach items="${ ds }" var="product">
									<div class="card mb-3" style="width: 900px; height: 400px;">
										<div class="row g-0">
											<div class="col-md-4">
												<img src="/Assignment_SOF3011_Quocdvph14459/img/ao.png" class="img-fluid rounded-start" alt="...">
											</div>
											<div class="col-md-8">
												<div class="card-body">
													<h5 class="card-title"><span class="fw-bold fs-4 text-primary">${ product.ten }</span></h5>
													<p class="card-text">
														<p><span class="fw-bold">Màu Sắc:</span><span class=" fs-5"> ${ product.mauSac }</span></p>
														<p><span class="fw-bold">Size:</span><span class=" fs-5"> ${ product.kichThuoc }</span></p>
														<p><span class="fw-bold">Số Lượng:</span><span class=" fs-5"> ${ product.soLuong }</span></p>
														<p><span class="fw-bold">Giá:</span> <span class="text-danger fs-4">${ product.donGia } VNĐ</span></p>
													</p>
													<div class="row">
														<a href="/Assignment_SOF3011_Quocdvph14459/products/edit?id=${ product.id }" 
														class="btn btn-primary col-5">Cập Nhật</a>
														<!-- Button trigger modal -->
									<button type="button" class="btn btn-primary col-5 offset-1"
										data-bs-toggle="modal" data-bs-target="#exampleModal${ product.id }">
										Xóa</button> <!-- Modal -->
									<div class="modal fade" id="exampleModal${ product.id }" tabindex="-1"
										aria-labelledby="exampleModalLabel${ product.id }" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel${ product.id }">Message</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">Bạn muốn xóa sản phẩm này chứ?</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">Thoát</button>
													<a href="/Assignment_SOF3011_Quocdvph14459/products/delete?id=${ product.id }">
													<button type="button" class="btn btn-primary">Xóa Sản Phẩm</button></a>
												</div>
											</div>
										</div>
									</div> 
													</div>
												</div>
											</div>
										</div>
									</div>
									<br>
				</c:forEach>
						</div>
					</div>
				</div>
			</c:if>
		</div>
	</div>
	<div class="d-flex flex-row-reverse ">
		<a class="btn btn-success"
			href="/Assignment_SOF3011_Quocdvph14459/products/create">Thêm Mới</a>
	</div>
	</div>
</div>
