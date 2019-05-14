<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
	
	<br>
			<%-- main img --%>
			<div class="border">
				<a href="/board/main"> <img src="/resources/img/title.jpg"
					class="img-fluid" alt="Responsive image">
				</a>
			</div>

			<br>

			<%-- login form --%>
			<sec:authorize access="isAuthenticated()">
				<a href="/customLogout"> <i class="fa fa-sign-out fa-fw"></i>Logout
				</a>
			</sec:authorize>

			<sec:authorize access="isAnonymous()">
				<a href="/customLogin"> <i class="fa fa-sign-out fa-fw"></i>Login
				</a>
			</sec:authorize>


			<!-- 
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
				 -->

			<br>

			<%-- nav --%>

			<div class="border">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link active"
						href="/board/list">공지사항</a></li>
					<li class="nav-item"><a class="nav-link" href="#">자유게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="#">여행정보</a></li>
					<li class="nav-item"><a class="nav-link" href="#">갤러리</a></li>

				</ul>
			</div>

			<br>