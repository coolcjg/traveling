<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>

<%-- 게시글 내용 표시 --%>
<div class="row border">
	<div class="col-lg-12">
		게시글
	</div>
</div>

<div class="row border">
	<div class="col-lg-12">
			<div class="form-group">
				<label>글 번호</label> <input type="text" class="form-control"
					name="bno" value='<c:out value="${board.bno}"/>' readonly="readonly">
			</div>			
	
			<div class="form-group">
				<label>제목</label> <input type="text" class="form-control"
					name="title" value='<c:out value="${board.title}"/>' readonly="readonly">
			</div>

			<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" name="content" rows="3" readonly="readonly"><c:out value="${board.content}"/></textarea>
			</div>

			<div class="form-group">
				<label>글쓴이</label> <input type="text" class="form-control"
					name="writer" value='<c:out value="${board.writer}"/>' readonly="readonly">
			</div>

			<button data-oper='modify' class="btn btn-primary">Modify</button>
			<button data-oper='list' class="btn btn-primary">List</button>
			
			<form id='operForm' action="/board/modify" method="get">
				<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno }"/>'>
				<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
				<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
				<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
				<input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
			</form>
	</div>
</div>
<%-- 게시글 내용 표시  end--%>



<script type="text/javascript">

$(document).ready(function(){
	
	<%--수정, 삭제버튼 누를때 함수설정 --%>
	var operForm = $("#operForm");
	$("button[data-oper='modify']").on("click", function(e){
		operForm.attr("action", "/board/modify").submit();
	});
	
	$("button[data-oper='list']").on("click", function(e){
		operForm.find("#bno").remove();
		operForm.attr("action", "/board/list")
		operForm.submit();
	})
	<%--수정, 삭제버튼 누를때 함수설정 끝 --%>
	
})
</script>


<%@ include file="../includes/footer.jsp"%>
