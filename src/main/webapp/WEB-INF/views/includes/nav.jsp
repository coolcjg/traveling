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
				<form action="/member/login" method="post" class="border">
					<div class="form-group">
						<input type="text" name="uid" class="form-control" placeholder="ID"/>
					</div>
					<div class="form-group">
						<input type="password" name="upw" class="form-control" placeholder="Password">
					</div>
					<div class="form-group">
						<label>
							<input type="checkbox" name="useCookie">Remember Me
						</label>
					</div>					
					
					<button type="submit" class="btn btn-primary">로그인</button>
					&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btn-primary">회원가입</button>
				</form>

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