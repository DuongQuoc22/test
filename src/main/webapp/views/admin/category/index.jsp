<%@ page language="java" session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="container">
	<div class="mt-5">
		<div class="mt-3">

			<!-- Thông báo thêm thành công -->
			<c:if test="${ !empty sessionScope.mes_add_cate }">
				<div class="alert alert-success">${ sessionScope.mes_add_cate }</div>
				<c:remove var="mes_add_cate" scope="session" />
			</c:if>
			
			<!-- Thông báo thêm thất bại -->
			<c:if test="${ !empty sessionScope.error_add_cate }">
				<div class="alert alert-danger">${ sessionScope.error_add_cate }</div>
				<c:remove var="error_add_cate" scope="session" />
			</c:if>
			
			<!-- thong bao cập nhật thành công -->
			<c:if test="${ !empty sessionScope.mes_update_cate }">
				<div class="alert alert-success">${ sessionScope.mes_update_cate }</div>
				<c:remove var="mes_update_cate" scope="session" />
			</c:if>
			
			<!-- Thông báo xóa thành công -->
			<c:if test="${ !empty sessionScope.mes_delete_cate }">
				<div class="alert alert-success">${ sessionScope.mes_delete_cate }</div>
				<c:remove var="mes_delete_cate" scope="session" />
			</c:if>
			
			<!--  Thong bao xóa thất bại -->
			<c:if test="${ !empty sessionScope.error_delete_cate }">
				<div class="alert alert-danger">${ sessionScope.error_delete_cate }</div>
				<c:remove var="error_delete_cate" scope="session" />
			</c:if>
			<c:if test="${ empty dsCate }">
				<p class="alert alert-warning">Không có dữ liệu</p>
			</c:if>
	<h2>Danh Mục Sản Phẩm</h2>
	<hr>
	<br> 
	<br>
			<c:if test="${ !empty dsCate }">
				<table class="table">
					<thead class="table-primary">
						<th>Tên Danh Mục</th>
						<th>Người Thêm</th>
						<th colspan="2">Thao tác</th>
					</thead>
					<tbody>
						<c:forEach items="${ dsCate }" var="cate">
							<tr>
								<td>${ cate.ten }</td>
								<td>
									${ cate.user.hoTen }
								</td>
								
								<td><!-- Modal  --> 
								<!-- Button trigger modal -->
									<button type="button" class="btn btn-primary"
										data-bs-toggle="modal" data-bs-target="#exampleModal${ cate.id }">
										Xóa</button> <!-- Modal -->
									<div class="modal fade" id="exampleModal${ cate.id }" tabindex="-1"
										aria-labelledby="exampleModalLabel${ cate.id }" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel${ cate.id }">Message</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">Bạn muốn xóa không ?</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">Thoát</button>
													<a href="/Assignment_SOF3011_Quocdvph14459/category/delete?id=${ cate.id }">
													<button type="button" class="btn btn-primary">Xóa</button></a>
												</div>
											</div>
										</div>
									</div> 
									<!-- End Modal --> 
								</td>
								<td><a class="btn btn-danger"
									href="/Assignment_SOF3011_Quocdvph14459/category/edit?id=${ cate.id }">Cập
										nhật</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</div>
	</div>
	<div class="d-flex flex-row-reverse ">
		<a class="btn btn-success"
			href="/Assignment_SOF3011_Quocdvph14459/category/create">Thêm Mới</a>
	</div>
</div>
