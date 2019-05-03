<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp"%>

<%-- 핵심 내용 시작 --%>
<div class="row">
<div class="col align-self-start border">
공지사항1
</div>

<div class="col align-self-end border">
<button type="button" class="btn btn-primary btn-sm" id="regBtn" >글쓰기</button>
</div>
</div>


<%-- list --%>
<div class="row">
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">말머리</th>
				<th scope="col">제목</th>
				<th scope="col">댓글수</th>
				<th scope="col">좋아요</th>
				<th scope="col">조회수</th>
				<th scope="col">글쓴이</th>
				<th scope="col">날짜</th>
			</tr>
		</thead>
		
		<c:forEach items="${list}" var="board">
		<tbody>
			<tr>
				<td><c:out value="${board.bno}"/></td>
				<td><a class='move' href='<c:out value="${board.bno}"/>'><c:out value="${board.title}"/></a></td>
				<td>1</td>
				<td><c:out value="${board.likeCnt}"/></td>
				<td><c:out value="${board.viewCnt}"/></td>
				<td><c:out value="${board.writer}"/></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}"/></td>
			</tr>
		</tbody>
		</c:forEach>
		
	</table>
</div>
<%-- list end --%>

<%-- Search --%>
<div class='row'>
	<div class="col-lg-12">
		<form id='searchForm' action="/board/list" method='get'>
			<select name='type'>
				<option value="" <c:out value="${pageMaker.cri.type==null?'selected':'' }"/>>--</option>
				<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목
				<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
				<option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
				<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목 or 내용</option>
				<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목 or 작성자</option>
				<option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC'?'selected':'' }"/>>제목 or 내용 or 작성자</option>
			</select>
			
			<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'/>
			<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/>
			<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>'/>
			<button class='btn btn-primary'>Search</button>

			
		</form>
	
	</div>

</div>
<%-- Search End--%>

<%--pagenation --%>
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    		<c:if test="${pageMaker.prev}">
				<li class="page-item paginate_button "><a class="page-link" href="${pageMaker.startPage-1}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
			</c:if>
			
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li class="page-item paginate_button ${pageMaker.cri.pageNum == num?"active":""}"><a class="page-link" href="${num}">${num}</a></li>
			</c:forEach>
			
			<c:if test="${pageMaker.next }">
				<li class="page-item paginate_button"><a class="page-link" href="${pageMaker.endPage+1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
			</c:if>
  </ul>
</nav>



<!-- Modal -->
<div class="modal" tabindex="-1" role="dialog" id="myModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">안내</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>처리가 완료되었습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<%-- Modal end --%>


<%-- hidden input --%>
<form id='actionForm' action="/board/list" method="get">
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type }"/>'>
	<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>'>
</form>
 
 
 



<script type="text/javascript">
$(document).ready(function(){
	
	<%--새글이 등록되었을 경우 모달창 표시 --%>
	var result = '<c:out value="${result}"/>';
	
	
	
	checkModal(result);
	
	<%-- history 조작을 해서 모달창이 나오지 않게 한다. --%>
	history.replaceState({}, null, null);
	
	function checkModal(result){
		
		if(result =='' || history.state){
			return;
		}
		
		if(parseInt(result)>0){
			$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
		}
		
		$("#myModal").modal("show");
		
	}
	
	
	<%-- move to register.jsp --%>
	$("#regBtn").on("click", function(){
		self.location="/board/register";
	});
	
	
	<%-- page proccess --%>
	var actionForm = $("#actionForm");
	
	$(".paginate_button a").on("click", function(e){
		e.preventDefault();
		console.log('click');
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
		
	})
	
	
	<%-- 게시물 조회하기 이벤트 처리 --%>
	$(".move").on("click", function(e){
		e.preventDefault();
		actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action", "/board/get");
		actionForm.submit();
	})
	
	<%-- 검색처리 --%>
	var searchForm = $('#searchForm');
	
	$("#searchForm button").on("click", function(e){
		
		if(!searchForm.find("option:selected").val()){
			alert("검색 종류를 선택하세요");
			return false;
		}
		
		if(!searchForm.find("input[name='keyword']").val()){
			alert("키워드를 입력하세요");
			return false;
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		searchForm.submit();
	});
	<%-- 검색처리 끝--%>
	
})
</script>


<%@ include file="../includes/footer.jsp"%>



