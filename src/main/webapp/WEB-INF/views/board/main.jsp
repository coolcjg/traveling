<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<body>


	<div class="container border">
		<div class="row border">
		
		
		
		
			<div class="col-2 border">

				<br>

				<%-- main img --%>
				<div class="border">
					<img src="/resources/img/title.jpg" class="img-fluid"
						alt="Responsive image">
				</div>

				<br>

				<%-- login form --%>
				<form class="border">
					<div class="form-group">
						<input type="email" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="ID">
					</div>
					<div class="form-group">
						<input type="password" class="form-control"
							id="exampleInputPassword1" placeholder="Password">
					</div>

					<div class="form-group form-check">
						<input type="checkbox" class="form-check-input" id="exampleCheck1">
						<label class="form-check-label" for="exampleCheck1">자동 로그인</label>
					</div>

					<button type="submit" class="btn btn-primary">Submit</button>
					&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btn-primary">Join</button>
				</form>

				<br>

				<%-- nav --%>

				<div class="border">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active" href="#">공지사항</a></li>
						<li class="nav-item"><a class="nav-link" href="#">자유게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="#">여행정보</a></li>
						<li class="nav-item"><a class="nav-link" href="#">갤러리</a></li>
						<li class="nav-item"><a class="nav-link" href="#">중고나라</a></li>
					</ul>
				</div>

				<br>

			</div>


			<%-- column 2 --%>
			<div class="col-10 border">

				<%-- main 1row --%>
				<div class="row border">

					<%-- main 1row 1col --%>
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
					<%-- main 1row 1col end--%>

					<%-- main 1row 2col --%>
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
					<%-- main 1row 2col end--%>
					
					
				</div>
				<%-- main 1row end --%>
				
			

				<%--main 2row (picture) --%>
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
				<%--main 2row (picture) end --%>
				
				
				
				
				
				
			
		</div>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
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