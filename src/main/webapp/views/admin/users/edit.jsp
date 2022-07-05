<%@ page language="java" session="true" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
    
    <!-- thong báo update thất bại -->
    <c:if test="${ !empty sessionScope.error_update_user }">
	<div class="alert alert-danger">
		${ sessionScope.error_update_user }
	</div>
	<c:remove var="error_update_user" scope="session"/>
</c:if>

<form method="POST" class="row p-5" action="/Assignment_SOF3011_Quocdvph14459/users/update?id=${ user.id }">
		<div class="col-6 offset-3 p-2">
			<label class="fw-bold">Họ Và Tên</label> <input type="text"
				class="form-control" name="hoTen" value="${ user.hoTen }">
		</div>

		<div class="col-6 offset-3 p-2">
			<label class="fw-bold">Địa Chỉ</label> <input type="text"
				class="form-control" name="diaChi" value="${ user.diaChi }">
		</div>
		<div class="col-6 offset-3 p-2">
			<label class="fw-bold">Email</label>
			<input type="text"
				class="form-control" name="email" value="${ user.email }">
		</div>
		<div class="col-6 offset-3 p-2">
			<label class="fw-bold">Điện Thoại</label> <input type="text"
				class="form-control" name="sdt" value="${ user.sdt }">
		</div>
		
		<div class="col-6 offset-3 mt-3">
			<button class="btn bg-primary fw-bold text-light">Cập Nhật</button>
			<button class="btn bg-danger fw-bold text-light" type="reset">Làm
				Mới</button>
		</div>
	</form>