<%@ page language="java" session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

	<form action="/Assignment_SOF3011_Quocdvph14459/category/store" method="POST">
	
				<c:if test="${ !empty sessionScope.error_add_cate }">
				<div class="alert alert-danger">${ sessionScope.error_add_cate }</div>
				<c:remove var="error_add_cate" scope="session" />
			</c:if>
		<div class="col-6 offset-3 p-2">
			<label class="fw-bold">Tên danh mục</label>
			<input type="text" class="form-control" name="ten">
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
			<button class="btn bg-primary fw-bold text-light">Thêm Mới</button>
			<button class="btn bg-danger fw-bold text-light" type="reset">Làm
				Mới</button>
		</div>