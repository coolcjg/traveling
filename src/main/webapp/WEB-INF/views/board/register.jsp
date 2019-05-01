<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>

<%-- 핵심 내용 시작 --%>
<div class="row border">
	<div class="col-lg-12">글 등록</div>
</div>

<div class="row border">
	<div class="col-lg-12">
		<form role="form" action="/board/register" method="post">
			<div class="form-group">
				<label>제목</label> <input type="text" class="form-control"
					name="title">
			</div>

			<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" name="content" rows="3"></textarea>
			</div>

			<div class="form-group">
				<label>글쓴이</label> <input type="text" class="form-control"
					name="writer">
			</div>

			<button type="submit" class="btn btn-primary">Submit</button>
			<button type="reset" class="btn btn-primary">Reset</button>
		</form>
	</div>
</div>

<%-- 핵심내용 끝 --%>

<%@ include file="../includes/footer.jsp"%>
