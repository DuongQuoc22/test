<%@ page language="java" contentType="text/html; charset=UTF-8" session="true"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:if test="${ !empty sessionScope.error }">
	<div class="alert alert-danger">
		${ sessionScope.error }
	</div>

	<c:remove var="error" scope="session"/>
</c:if>
	<form method="POST" action="/Assignment_SOF3011_Quocdvph14459/users/store" class="row p-5">
		<div class="col-6 offset-3 p-2">
			<label class="fw-bold">Họ Và Tên</label> <input type="text"
				class="form-control" name="hoTen">
		</div>

		<div class="col-6 offset-3 p-2">
			<label class="fw-bold">Địa Chỉ</label> <input type="text"
				class="form-control" name="diaChi">
		</div>
		<div class="col-6 offset-3 p-2">
			<label class="fw-bold">Email</label>
			<input type="text"
				class="form-control" name="email">
		</div>
		<div class="col-6 offset-3 p-2">
			<label class="fw-bold">PassWord</label> <input type="password"
				class="form-control" name="password">
		</div>
		<div class="col-6 offset-3 p-2">
			<label class="fw-bold">Điện Thoại</label> <input type="text"
				class="form-control" name="sdt">
		</div>
		
		<div class="col-6 offset-3 mt-3">
			<button class="btn bg-primary fw-bold text-light">Thêm Mới</button>
			<button class="btn bg-danger fw-bold text-light" type="reset">Làm
				Mới</button>
		</div>
	</form>