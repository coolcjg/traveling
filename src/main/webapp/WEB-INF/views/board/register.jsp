<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
			
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
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
					name="writer" value='<sec:authentication property="principal.username"/>' readonly="readonly">
			</div>

			<button type="submit" class="btn btn-primary">Submit</button>
			<button type="reset" class="btn btn-primary">Reset</button>
		</form>
	</div>
</div>

<!--  첨부파일 추가 -->
<div class="row border">
	<div class="col-lg-12">
		<div class="panel panel-default">
		
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

<%-- 핵심내용 끝 --%>


<script>
$(document).ready(function(e){
	
	<%-- 첨부파일 삭제처리 --%>
	$(".uploadResult").on("click", "button", function(e){
		console.log("delete file");
		
		var targetFile = $(this).data("file");
		var type=$(this).data("type");
		
		console.log(targetFile);
		console.log(type);
		
		var targetLi = $(this).closest("li");
		
		
		$.ajax({
			url:'/deleteFile',
			data:{fileName:targetFile, type:type},
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			dataType:'text',
			type:'POST',
			success:function(result){
				alert(result);
				targetLi.remove();
			}
		});
	});
		
	<%-- 제출 버튼을 눌렀을때의 처리 --%>
	  var formObj = $("form[role='form']");
	  
	  $("button[type='submit']").on("click", function(e){
	    e.preventDefault();
	    console.log("submit clicked");
	    
	    var str="";
	    
	    $(".uploadResult ul li").each(function(i, obj){
	    	var jobj = $(obj);
	    	console.dir(jobj);
	    	
	    	str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
	    	str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	    	str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	    	str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
	    });
	    formObj.append(str).submit();
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
		      alert("해당 종류의 파일은 업로드할 수 없습니다.");
		      return false;
		    }
		    return true;
	   }
	
	  var csrfHeaderName = "${_csrf.headerName}";
	  var csrfTokenValue="${_csrf.token}";
	 
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
		      beforeSend:function(xhr){
		    	  xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		      },
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
})
</script>

<%@ include file="../includes/footer.jsp"%>