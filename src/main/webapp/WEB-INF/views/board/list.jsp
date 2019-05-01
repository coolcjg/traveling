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
				<td><a href='/board/get?bno=<c:out value="${board.bno}"/>'><c:out value="${board.title}"/></a></td>
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
	
})
</script>


<%@ include file="../includes/footer.jsp"%>



