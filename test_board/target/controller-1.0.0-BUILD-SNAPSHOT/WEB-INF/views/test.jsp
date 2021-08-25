<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#modDiv {
		width: 300px;
		height: 100px;
		background-color: gray;
		position: absolute;
		top: 50%;
		left: 50%;
		margin-top: -50px;
		margin-left: -150px;
		padding: 10px;
		z-index: 1000;
	}
</style>
</head>
<body>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
		
	<h2>Ajax Test Page</h2>
	
	<div>
		<div>
			REPLYER <input type="text" name="writer" id="newReplyWriter">
		</div>
		<div>
			REPLY TEXT <input type="text" name="content" id="newReplyContent">
		</div>
		
		<button id="replyAddBtn">ADD REPLY</button>
	</div>
	
	
	<ul id="reply">
	</ul>
	
	<div id="modDiv" style="display: none;">
		<div class="modal-title"></div>
		<div>
			<input type="text" id="content">
		</div>
		<div>
			<button type="button" id="replyModBtn">Modify</button>
			<button type="button" id="replyDelBtn">Delete</button>
			<button type="button" id="closeBtn">Close</button>
		</div>
	</div>
	
	<script>
		var bno = 492;
		
		function getAllList() {
			$.getJSON("/reply/all/" + bno, function(data){
				var str = "";
				console.log(data.length);
				
				$(data).each(
					function() {
						str += "<li data-rno='"+this.rno+"' class='replyLi'>"
							+ this.rno + ":" + this.content
							+ "<button>MOD</button></li>";
					});
				$("#reply").html(str);
			});
		}

		$("#replyAddBtn").on("click", function() {
			var writer = $("#newReplyWriter").val();
			var content = $("#newReplyContent").val();
			
			$.ajax({
				type : 'post',
				url : '/reply/reply',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					bno : bno,
					writer : writer,
					content : content
				}),
				success : function(result) {
					if(result == 'SUCCESS') {
						alert("등록 되었습니다.");
						getAllList();
					}
				}
			});
		});
		
		$("#reply").on("click", ".replyLi button", function() {
			var reply = $(this).parent();
			
			var rno = reply.attr("data-rno");
			var content = reply.text();
			
			$(".modal-title").html(rno);
			$("#content").val(content);
			$("#modDiv").show("slow");
		});
		
		$("#replyDelBtn").on("click", function() {
			var rno = $(".modal-title").html();
			var content = $("#content").val();
			
			$.ajax({
				type : 'delete',
				url : '/reply/' + rno,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType : 'text',
				success : function(result) {
					console.log("result: " + result);
					if(result == 'SUCCESS') {
						alert("삭제 되었습니다.");
						$("#modDiv").hide("slow");
						getAllList();
					}
				}
			})
		})
	</script>
</body>
</html>