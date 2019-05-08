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

<!--  첨부파일 추가 -->
<div class="row border">
	<div class="col-lg-12">
		<div class="panel panel-fefault">
		
			<div class="panel-heading">파일 추가</div>
			
			<div class="panel-body">
				<div class="form-group uploadDiv">
					<input type="file" name='uploadFile' multiple>
				</div>
				
				<div class='uploadResult'>
					<ul>
					
					</ul>
				</div>
				
			</div>
		
		</div>
	</div>
</div>

<script>
function showUploadResult(uploadResultArr){
	if(!uploadResultArr || uploadResultArr.length == 0){
		return;
	}
	
	var uploadUL = $(".uploadResult ul");
	
	var str="";
	
	$(uploadResultArr).each(function(i,obj){
		//image type
		if(obj.image){
			var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_"+obj.uuid + "_"+ obj.fileName);
			str +="<li><div>";
			str +="<span>"+obj.fileName+"</span>";
			str +="<button type='button' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str +="<img src='/display?fileName="+fileCallPath+"'>";
			str +="</div></li>";
		}else{
			var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
			var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
			
			str += "<li><div>";
			str += "<span>" + obj.fileName + "</span>";
			str += "<button type='button' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/resources/img/attach.png'></a>";
			str += "</div></li>";
		}
	});	
}


$(document).ready(function(e){
	
	<%-- 제출 버튼을 눌렀을때의 처리 --%>
	var formObj = $("form[role='form']");
	$("button[type='submit']").on("click", function(e){
		e.preventDefault();
		console.log("submit clicked");
	});
	
	
	<%-- 파일 확인 작업 --%>
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; //5MB
	
	function checkExtension(fileName, fileSize){
		
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		if(regex.test(fileName)){
			alert("해당 조율의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	$("input[type='file']").change(function(e){
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		console.log("inputFile : " + inputFile );
		var files = inputFile[0].files;
		console.log("inputFile[0].files : " + inputFile[0].files);
		
		for(var i=0; i<files.length; i++){
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url:'/uploadAjaxAction',
			processData:false,
			contentType:false,
			data:formData,
			type:'POST',
			dataType:'json',
			success : function(result){
				console.log(result);
				showUploadResult(result);
			}
		});
		
		
	});
	
	
	
	
	
	
	
	
	
	
	
	
})
</script>



<%-- 핵심내용 끝 --%>

<%@ include file="../includes/footer.jsp"%>
