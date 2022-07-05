<%@ page language="java" session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!--  thông báo update thất bại -->
<c:if test="${ !empty sessionScope.error_update_cate }">
	<div class="alert alert-danger">
		${ sessionScope.error_update_cate }
	</div>
	<c:remove var="error_update_cate" scope="session"/>
</c:if>
	<form action="/Assignment_SOF3011_Quocdvph14459/category/update?id=${ cate.id }" method="POST">
		<div class="col-6 offset-3 p-2">
			<label class="fw-bold">Tên danh mục</label>
			<input type="text" class="form-control" name="ten" value=${ cate.ten }>
		</div>
		
		<div class="col-6 offset-3 p-2">
			<label class="fw-bold">Người Tạo</label>
			<select name="user_id" class="form-control"> 
				<c:forEach items="${ dsUser }" var="user">
					<option value="${ user.id }">${ user.hoTen }</option>
				</c:forEach>
			</select>
		</div>
		<div class="col-6 offset-3 mt-3">
			<button class="btn bg-primary fw-bold text-light">Cập Nhật</button>
			<button class="btn bg-danger fw-bold text-light" type="reset">Làm
				Mới</button>
		</div>