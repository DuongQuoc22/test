<%@ page language="java" contentType="text/html; charset=UTF-8" session="true"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:if test="${ !empty sessionScope.error_add_pro }">
	<div class="alert alert-danger">
		${ sessionScope.error_add_pro }
	</div>

	<c:remove var="error_add_pro" scope="session"/>
</c:if>
	<form method="POST" action="/Assignment_SOF3011_Quocdvph14459/products/store" class="row p-5">
		<div class="col-6 offset-3 p-2">
			<label class="fw-bold">Tên Sản Phẩm</label> <input type="text"
				class="form-control" name="ten">
		</div>
<!--  thay loại sẳn phẩm = select-option -->
		<div class="col-6 offset-3 p-2">
			<label class="fw-bold">Loại Sản Phẩm</label>
			<select name="category_id" class="form-control"> 
				<c:forEach items="${ dsCate }" var="cate">
					<option value="${ cate.id }">${ cate.ten }</option>
				</c:forEach>
			</select>
		</div>
		<div class="col-6 offset-3 p-2">
			<label class="fw-bold">Số Lượng</label>
			<input type="text"
				class="form-control" name="soLuong">
		</div>
		<div class="col-6 offset-3 p-2">
			<label class="fw-bold">Đơn Giá</label> <input type="text"
				class="form-control" name="donGia">
		</div>
		<div class="col-6 offset-3 p-2">
			<label class="fw-bold">Màu Sắc</label> <input type="text"
				class="form-control" name="mauSac">
		</div>
		<div class="col-6 offset-3 p-2">
			<label class="fw-bold">Kích Thước</label> <input type="text"
				class="form-control" name="kichThuoc">
		</div>
		<div class="col-6 offset-3 mt-3">
			<button class="btn bg-primary fw-bold text-light">Thêm Mới</button>
			<button class="btn bg-danger fw-bold text-light" type="reset">Làm
				Mới</button>
		</div>
	</form>