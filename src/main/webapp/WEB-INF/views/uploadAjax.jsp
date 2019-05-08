<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


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


</head>
<body>
<h1> Upload with Ajax</h1>

<div class='uploadDiv'>
	<input type='file' name='uploadFile' multiple>
</div>

<div class='uploadResult'>
	<ul>
	
	</ul>
</div>

<button id='uploadBtn'>Upload</button>

<div class='bigPictureWrapper'>
	<div class='bigPicture'>
	</div>
</div>





<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>

<%-- 원본 이미지를 보여줄 div 처리. a태그에서 직접 showImage()를 호출할 수 있는 방식으로 작성하기 위해 바깥에 작성--%>
function showImage(fileCallPath){
	//alert(fileCallPath);
	
	$(".bigPictureWrapper").css("display", "flex").show();
	
	$(".bigPicture")
	.html("<img src='/display?fileName=" + encodeURI(fileCallPath)  +"'>")
	.animate({width:'100%', height:'100%'}, 1000);
}

<%-- 원본사진 클릭시 사라지게 만들기 --%>
$(".bigPictureWrapper").on("click", function(e){
	$(".bigPicture").animate({width:'0%', height:'0%'}, 1000);
	setTimeout(()=>{
		$(this).hide();
	},1000);
});



$(document).ready(function(){
	
	<%-- 파일의 확장자나 크기의 사전 처리 --%>
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; //5MB
	
	function checkExtension(fileName, fileSize){
		if(fileSize >=maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}
	<%-- 파일의 확장자나 크기의 사전 처리  끝--%>
	
	
	var cloneObj = $(".uploadDiv").clone();
	
	<%-- 업로드처리 시작 --%>
	$("#uploadBtn").on("click", function(e){
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		console.log(files);
		
		//add filedate to formdata
		for(var i=0; i<files.length; i++){
			
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url:'/uploadAjaxAction',
			processData : false,
			contentType : false,
			data:formData,
			type:'POST',
			success : function(result){
				console.log(result);
				
				showUploadedFile(result);
				$(".uploadDiv").html(cloneObj.html());
			}
		});
	});
	<%-- 업로드처리 끝 --%>
	
	<%-- 업로드한 파일 이름 출력 --%>
	var uploadResult = $(".uploadResult ul");
	
	function showUploadedFile(uploadResultArr){
		var str = "";
		
		$(uploadResultArr).each(function(i,obj){
			
			if(!obj.image){
				var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
				
				
				var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
				
				
				str +="<li>"+
						"<div>"+
							"<a href='/download?fileName=" + fileCallPath +"'>"+
								"<img src='/resources/img/attach.png'>" + obj.fileName + 
							"</a>"+
						"<span data-file=\'"+fileCallPath+"\' data-type='file'>x</span>"+
					  "</li>";
			}else{
				//썸네일
				var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
				
				//원본
				var originPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;
				
				
				
				originPath = originPath.replace(new RegExp(/\\/g), "/");
				
				
				str += "<li>"+
							"<a href=\"javascript:showImage(\'"+originPath+"\')\">"+
								"<img src='/display?fileName=" + fileCallPath+ "'>"+
							"</a>"+
							"<span data-file=\'"+fileCallPath+"\' data-type='image'>x</span>"+
						"</li>";
			}
		});
		uploadResult.append(str);
	}
	
	$(".uploadResult").on("click", "span", function(e){
		var targetFile = $(this).data("file");
		var type= $(this).data("type");
		
		$.ajax({
			url:'/deleteFile',
			data: {fileName:targetFile, type:type},
			dataType:'text',
			type:'POST',
			success:function(result){
				alert(result);
			}
		})
	})
	

});
</script>
</body>
</html>