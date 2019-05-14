<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<title>Hello, world!</title>
</head>

<!-- 화면전체 -->
<div class="container border">
	<!-- 화면전체 -->
	<div class="row border">


		<%-- 제일큰 왼쪽컬럼1 --%>
		<div class="col-2 border">
			<%@include file="../includes/nav.jsp" %>
		</div>
		<%-- 제일큰 왼쪽컬럼1 끝 --%>
		
		<%-- 제일큰 오른쪽컬럼2 --%>
		<div class="col-10 border">
		
			<%-- 오른쪽컬럼2 -> 첫번째줄 --%>
			<div class="row border">

				<%-- 오른쪽컬럼2 첫번째줄 왼쪽컬럼(공지사항과 자유게시판을 감싼다.) --%>
				<div class="col-6 border">
					<div class="row border">

						<div class="border">
							공지사항
							<ul class="list-group">

								<li class="list-group-item">Cras justo odio</li>
								<li class="list-group-item">Dapibus ac facilisis in</li>
							</ul>
						</div>

					</div>

					<div class="row border">

						<div class="border">
							자유게시판
							<ul class="list-group">
								<li class="list-group-item">Cras justo odio</li>
								<li class="list-group-item">Dapibus ac facilisis in</li>
								<li class="list-group-item">Morbi leo risus</li>
								<li class="list-group-item">Porta ac consectetur ac</li>
								<li class="list-group-item">Vestibulum at eros</li>
							</ul>
						</div>


					</div>
				</div>
				<%-- 오른쪽컬럼2 첫번째줄 왼쪽컬럼(공지사항과 자유게시판을 감싼다.)  끝--%>

				<%-- 오른쪽컬럼2 첫번째줄 오른쪽컬럼(여행정보.) --%>
				<div class="col-6 border">

					<div class="border">
						여행정보
						<ul class="list-group">
							<li class="list-group-item">Cras justo odio</li>
							<li class="list-group-item">Dapibus ac facilisis in</li>
							<li class="list-group-item">Morbi leo risus</li>
							<li class="list-group-item">Porta ac consectetur ac</li>
							<li class="list-group-item">Vestibulum at eros</li>
							<li class="list-group-item">Vestibulum at eros</li>
							<li class="list-group-item">Vestibulum at eros</li>
						</ul>
					</div>

				</div>
				<%-- 오른쪽컬럼2 첫번째줄 오른쪽컬럼(여행정보.) 끝 --%>


			</div>
			<%-- 오른쪽컬럼2 -> 첫번째줄 끝 --%>



			<%-- 오른쪽컬럼2 -> 두번째줄 시작 --%>
			<div class="row border">
				<div class="col-12 border">
					갤러리
					<div class="card-deck">
						<div class="card">
							<img src="..." class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">Card title</h5>
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content. This
									content is a little bit longer.</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">Last updated 3 mins ago</small>
							</div>
						</div>
						<div class="card">
							<img src="..." class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">Card title</h5>
								<p class="card-text">This card has supporting text below as
									a natural lead-in to additional content.</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">Last updated 3 mins ago</small>
							</div>
						</div>
						<div class="card">
							<img src="..." class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">Card title</h5>
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content. This
									card has even longer content than the first to show that equal
									height action.</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">Last updated 3 mins ago</small>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%-- 오른쪽컬럼2 -> 두번째줄 끝 --%>

			

		</div>
	</div>
</div>

	<script
				src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>

	</body>
</html>