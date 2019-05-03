<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>

<%-- 핵심 내용 시작 --%>
<div class="row border">
	<div class="col-lg-12">
		글 수정
	</div>
</div>

<div class="row border">
	<div class="col-lg-12">
		<form role="form" action="/board/modify" method="post">
			<div class="form-group">
				<label>글 번호</label> <input type="text" class="form-control"
					name="bno" value='<c:out value="${board.bno}"/>' readonly="readonly">
			</div>			
	
			<div class="form-group">
				<label>제목</label> <input type="text" class="form-control"
					name="title" value='<c:out value="${board.title}"/>' >
			</div>

			<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" name="content" rows="3"><c:out value="${board.content}"/></textarea>
			</div>

			<div class="form-group">
				<label>글쓴이</label> <input type="text" class="form-control"
					name="writer" value='<c:out value="${board.writer}"/>' readonly="readonly">
			</div>

			<button type="submit" data-oper='modify' class="btn btn-primary">Modify</button>
			<button type="submit" data-oper='remove' class="btn btn-primary">Remove</button>
			<button type="submit" data-oper='list' class="btn btn-primary">List</button>
			
			<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
			<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
			<input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
			<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>				
			
		</form>
		
	</div>
</div>

<%-- 핵심내용 끝 --%>



<script type="text/javascript">
$(document).ready(function(){
	var formObj=$("form");
	
	$('button').on("click", function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'remove'){
			formObj.attr("action", "/board/remove");
		}else if(operation ==='list'){
			//move to list
			formObj.attr("action", "/board/list").attr("method", "get");
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var keywordTag = $("input[name='keyword']").clone();
			var typeTag = $("input[name='type']").clone();
			
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(keywordTag);
			formObj.append(typeTag);
		}
		formObj.submit();
		
	})
	
})
</script>

<%@ include file="../includes/footer.jsp"%>
