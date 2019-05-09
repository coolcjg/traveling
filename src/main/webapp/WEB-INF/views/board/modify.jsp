<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 100px;
}
</style>

<style>
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
}

.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}
</style>


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

<%-- 원본 이미지 부분 --%>
<div class='bigPictureWrapper'>
	<div class='bigPicture'>
	</div>
</div>



<%-- 첨부파일 표시부분 --%>
<div class="row border">
	<div class="col-lg-12">
		<div class="panel panel-default">
		
			<div class="panel-heading">Files</div>
			
			<div class="panel-body">		
			
				<div class="form-group uploadDiv">
					<input type="file" name='uploadFile' multiple="multiple">
				</div>
			
				
				<div class='uploadResult'>
					<ul>
					
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>



<%-- 핵심내용 끝 --%>





<script type="text/javascript">
$(document).ready(function(){
	
	
	(function(){
		var bno = '<c:out value="${board.bno}"/>';
		
		$.getJSON("/board/getAttachList", {bno:bno}, function(arr){
			console.log(arr);
			
			var str = "";
			
			$(arr).each(function(i, attach){
				
				//image type
				if(attach.fileType){
					var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);
					
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='" + attach.fileName+"' data-type='"+attach.fileType+"'>";
					str += "<div>";
					str += "<span>" + attach.fileName +"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str += "</li>";

				}else{
					
					str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='" + attach.fileName+"' data-type='"+attach.fileType+"'>";
					str += "<div>";
					str += "<span> " + attach.fileName+"</span><br/>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/resources/img/attach.png'>";
					str += "</div>";
					str += "</li>";
				}
			});
			
			$(".uploadResult ul").html(str);
		});
		
	})();
	
	
	//버튼을 누르면 첨부파일이 사라지게 하는것.
	$(".uploadResult").on("click", "button", function(e){
		console.log("delete file");
		
		if(confirm("Remove this file? ")){
			var targetLi = $(this).closest("li");
			targetLi.remove();
		}
	})
	
	
	<%-- 파일 확인 작업 --%>
	 var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	 var maxSize = 5242880; //5MB
	
	  function checkExtension(fileName, fileSize){
		    
		    if(fileSize >= maxSize){
		      alert("파일 사이즈 초과");
		      return false;
		    }
		    
		    if(regex.test(fileName)){
		      alert("해당 종류의 파일은 업로드할 수 없습니다.");
		      return false;
		    }
		    return true;
	   }
	 
	 
	 <%-- 파일 등록작업 --%>
	  $("input[type='file']").change(function(e){

		    var formData = new FormData();
		    
		    var inputFile = $("input[name='uploadFile']");
		    
		    var files = inputFile[0].files;
		    
		    for(var i = 0; i < files.length; i++){

		      if(!checkExtension(files[i].name, files[i].size) ){
		        return false;
		      }
		      formData.append("uploadFile", files[i]);
		      
		    }
		    
		    $.ajax({
		      url: '/uploadAjaxAction',
		      processData: false, 
		      contentType: false,
		      data:formData,
		      type: 'POST',
		      dataType:'json',
		        success: function(result){
		          console.log(result); 
				  showUploadResult(result); //업로드 결과 처리 함수 

		      }
		    }); //$.ajax
		    
		  });
	  
	  
	  
	  //jsp파일에 업로드파일 출력부분
	  function showUploadResult(uploadResultArr){
		  
		    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
		    
		    var uploadUL = $(".uploadResult ul");
		    
		    var str ="";
		  
	    $(uploadResultArr).each(function(i, obj){
	       
	        if(obj.image){
	          var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
	          str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
	          str += "<span> "+ obj.fileName+"</span>";
	          str +="<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
	          str += "<img src='/display?fileName="+fileCallPath+"'>";
	          str += "</div>";
	          str +"</li>";
	        }else{
	          var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);            
	          var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
	              
	          str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
	          str += "<span> "+ obj.fileName+"</span>";
	          str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
	          str += "<img src='/resources/img/attach.png'></a>";
	          str += "</div>";
	          str +"</li>";
	        }
	    });
	    uploadUL.append(str);
	  }

	
	  
	  //수정버튼 클릭했을 때 처리.
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
		}else if(operation === 'modify'){
			console.log("submit clicked");
			
			var str = "";
			
				$(".uploadResult ul li").each(function(i, obj){
					var jobj = $(obj);
					
					console.dir(jobj);
					
					str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
					str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
					str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
					str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
				});
				formObj.append(str).submit();
		}
		formObj.submit();
	})
	
})
</script>

<%@ include file="../includes/footer.jsp"%>
