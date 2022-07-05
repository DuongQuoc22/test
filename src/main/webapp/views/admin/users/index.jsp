<%@ page language="java" session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="container">
	<div class="mt-5">
		<div class="mt-3">
<!-- Thông báo thêm thất bại  -->
<c:if test="${ !empty sessionScope.error }">
	<div class="alert alert-danger">
		${ sessionScope.error }
	</div>
	<c:remove var="error" scope="session"/>
</c:if>
<!-- Thông báo thêm thành công -->
<c:if test="${ !empty sessionScope.message }">
	<div class="alert alert-success">
		${ sessionScope.message }
	</div>
	<c:remove var="message" scope="session"/>
</c:if>
<!-- thông bao update thành công -->
<c:if test="${ !empty sessionScope.mes_update_user }">
	<div class="alert alert-success">
		${ sessionScope.mes_update_user }
	</div>
	<c:remove var="mes_update_user" scope="session"/>
</c:if>

<!-- thông báo xóa thành công -->
<c:if test="${ !empty sessionScope.mes_delete_user }">
	<div class="alert alert-success">
		${ sessionScope.mes_delete_user }
	</div>
	<c:remove var="mes_delete_user" scope="session"/>
</c:if>

<!-- thong bao xóa thất bại -->

<c:if test="${ !empty sessionScope.error_delete_user }">
	<div class="alert alert-danger">
		${ sessionScope.error_delete_user }
	</div>
	<c:remove var="error_delete_user" scope="session"/>
</c:if>
	<h2>Quản Lý Tài Khoản</h2>
	<hr>
	<br> 
	<br>
			<c:if test="${ empty ds }">
				<p class="alert alert-warning">Không có dữ liệu</p>
			</c:if>

			<c:if test="${ !empty ds }">
				<table class="table">
					<thead class="table-primary">
						<th>Họ tên</th>
						<th>SĐT</th>
						<th>Email</th>
						<th>Địa chỉ</th>
						<th colspan="2">Thao tác</th>
					</thead>
					<tbody>
						<c:forEach items="${ ds }" var="user">
							<tr>
								<td>${ user.hoTen }</td>
								<td>${ user.sdt }</td>
								<td>${ user.email }</td>
								<td>${ user.diaChi }</td>
								<td><!-- Modal  --> 
								<!-- Button trigger modal -->
									<button type="button" class="btn btn-primary"
										data-bs-toggle="modal" data-bs-target="#exampleModal${ user.id }">
										Xóa</button> <!-- Modal -->
									<div class="modal fade" id="exampleModal${ user.id }" tabindex="-1"
										aria-labelledby="exampleModalLabel${ user.id }" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel${ user.id }">Modal
														title</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">...</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">Thoát</button>
													<a href="/Assignment_SOF3011_Quocdvph14459/users/delete?id=${ user.id }">
													<button type="button" class="btn btn-primary">Xóa</button></a>
												</div>
											</div>
										</div>
									</div> 
									<!-- End Modal --> 
								</td>
								<td><a class="btn btn-danger"
									href="/Assignment_SOF3011_Quocdvph14459/users/edit?id=${ user.id }">Cập
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
			href="/Assignment_SOF3011_Quocdvph14459/users/create">Thêm Mới</a>
	</div>
</div>
