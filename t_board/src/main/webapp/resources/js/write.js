$("#goListBtn").on("click", function() {
	self.location = "/board/listPage?num=1";
});

var template = Handlebars.compile($("#template").html());
	
$(".fileDrop").on("dragenter dragover", function(event){
	event.preventDefault();
});
	
$(".fileDrop").on("drop", function(event){
	event.preventDefault();
		
	var files = event.originalEvent.dataTransfer.files;
		
	var file = files[0];
		
	var formData = new FormData();
		
	formData.append("file", file);
		
	$.ajax({
		url: '/board/uploadAjax',
		data: formData,
		dataType: 'text',
		processData: false,
		contentType: false,
		type: 'POST',
		success: function(data) {
				var fileInfo = getFileInfo(data);
				var html = template(fileInfo);
					
				$(".uploadedList").append(html);
		}
	});
});
	
$("#registerForm").submit(function(event){
	event.preventDefault();
		
	var that = $(this);
		
	var str = "";
	
	$(".uploadedList .delbtn").each(function(index){
		str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
	});
		
	that.append(str);
		
	that.get(0).submit();
});
	
$(".uploadedList").on("click", ".delbtn", function(event){
		
	event.preventDefault();
		
	var that = $(this);
		 
	$.ajax({
	  url:"/board/deleteFile",
	  type:"post",
	   data: {fileName:$(this).attr("href")},
	   dataType:"text",
	   success:function(result){
		   if(result == 'deleted'){
			   that.closest("li").remove();
		   }
	   }
   });
});
	
$(document).ready(function(){
	$("#writeBtn").on("click", function(){
		if($("#title").val()==""){
			alert("제목을 입력해주세요.");
			$("#title").focus();
			return false;
		}
			
		if($("#writer").val()==""){
			alert("작성자를 입력해주세요.");
			$("#writer").focus();
			return false;
		}
			
		if($("#content").val()==""){
			alert("내용을 입력해주세요.");
			$("#content").focus();
			return false;
		}
				
		alert("글이 작성되었습니다.");
	});
})