<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IT16305</title>
<link rel="stylesheet"
	href="/Assignment_SOF3011_Quocdvph14459/css/bootstrap.min.css" />
	<style>
		body{
			background-color: #fff0b3;
		}
	</style>
</head>
<body>
	<div class="container-fluid">
		<header>
			<img width="100%" height="50%"
				src="/Assignment_SOF3011_Quocdvph14459/img/banner2.jpg">
		</header>
		<!-- Navbar -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">TRANG CHỦ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="/Assignment_SOF3011_Quocdvph14459/products/index">SẢN PHẨM</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="/Assignment_SOF3011_Quocdvph14459/category/index">LOẠI SẢN PHẨM</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="#">LIÊN HỆ</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            TÀI KHOẢN
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="/Assignment_SOF3011_Quocdvph14459/login">Đăng Nhập</a></li>
            <li><a class="dropdown-item" href="/Assignment_SOF3011_Quocdvph14459/users/create">Đăng Ký</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="/Assignment_SOF3011_Quocdvph14459/users/index">Quản Lý Tài Khoản</a></li>
          </ul>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
		<!-- End Navbar -->

		<!-- Body -->
		<div class="row pt-3 ">

			<div class="col-9">
				<jsp:include page="${ view }"></jsp:include>
			</div>

			<div class="col-3">
				<ul class="list-group">
					<li class="list-group-item active" aria-current="true">Danh Mục Sản Phẩm</li>
					<li class="list-group-item">Đồ gia dụng</li>
					<li class="list-group-item">Đồ điện tử</li>
					<li class="list-group-item">Đồ dùng học tập</li>
					
				</ul>
			</div>
		</div>
		<!-- End Body -->

		<!-- Footer -->
		<footer class="bg-secondary mt-3">
			<h2 class="row col-12 pt-2">
				<span class="text-center text-light">Cao Đẳng FPT POLYTECHNIC</span>
			</h2>
			<div class="row">
				<div class="col-4">
					<p class="text-light text-center">
						<span style="font-weight: bold; color: orange; font-size: 23px">Cơ
							Sở Hà Nội</span>
					</p>
					<p class="offset-1 text-light">
						<span style="font-weight: bold; color: orange;">Văn phòng
							Tuyển sinh</span>: Tòa nhà FPT Polytechnic, Phố Trịnh Văn Bô, Nam Từ
						Liêm, Hà Nội.
					</p>
					<p class="offset-1 text-light">
						<span style="font-weight: bold; color: orange;">Hotline</span>:
						(024) 8582 0808
					</p>
				</div>


				<div class="col-4">
					<p class="text-light text-center">
						<span style="font-weight: bold; color: orange; font-size: 23px">Cơ
							Sở Đà Nẵng</span>
					</p>
					<p class="offset-1 text-light">
						<span style="font-weight: bold; color: orange;">Văn phòng
							Tuyển sinh</span>: Số 137 Nguyễn Thị Thập, Phường Hòa Minh, Quận Liên
						Chiểu, TP. Đà Nẵng.
					</p>
					<p class="offset-1 text-light">
						<span style="font-weight: bold; color: orange;">Hotline</span>:
						(0236) 3710 999
					</p>
				</div>


				<div class="col-4">
					<p class="text-light text-center">
						<span style="font-weight: bold; color: orange; font-size: 23px">Cơ
							Sở Hồ Chí Minh</span>
					</p>
					<p class="offset-1 text-light">
						<span style="font-weight: bold; color: orange;">Văn phòng
							Tuyển sinh</span>: 778/B1 Nguyễn Kiệm, <br>P.4, Q. Phú Nhuận, TP.
						Hồ Chí Minh.
					</p>
					<p class="offset-1 text-light">
						<span style="font-weight: bold; color: orange;">Hotline</span>:
						028 62523434/0901 660 002
					</p>
				</div>
			</div>
		<!--  	<div class="row col-12 text-center mt-4 text-light">
				<p>Giấy phép đăng ký số 028374656498 của sở Kế Hoạch và Đầu Tư
					Hà Nội cấp ngày 02/04/2022</p>
				<p>Website được đăng ký tại cục Thương Mại Điện Tử và Công Nghê
					Thông Tin của bộ Công Thương</p>
			</div> -->
		</footer>
		<!-- End Footer -->
	</div>

	<script src="/Assignment_SOF3011_Quocdvph14459/js/jquery.min.js"></script>
	<script src="/Assignment_SOF3011_Quocdvph14459/js/popper.min.js"></script>
	<script src="/Assignment_SOF3011_Quocdvph14459/js/bootstrap.min.js"></script>
</body>
</html>