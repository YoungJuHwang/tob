<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="div_admin_book">
<table id="tab_admin_book">
	<tr>
		<th>책 ID</th>
		<td id="book_id">${book.bookId}</td>
	</tr>
	<tr>
		<th>책 이름</th>
		<td id="book_name">${book.bookName}</td>
	</tr>
	<tr>
		<th>책 가격</th>
		<td id="book_price">${book.bookPrice}</td>
	</tr>
	<tr>
		<th>작가작가작가</th>
		<td id="book_writer">${book.writer}</td>
	</tr>
</table>
	<button id="delete_book" style="float:left">삭제</button>
	<button id="update_book" style="float:right; margin-right:10px;">등록</button>
	<button id="modify_book" style="float:right; margin-right:10px;">수정</button>
</div>
<script src="${context}/js/global.js"></script>
<script type="text/javascript">

	$(function() {
		$("#update_book").css("display","none");
		$("#delete_book").click(function() {
			if (confirm("정말 삭제하시겠습니까?")) {
				$.ajax("${context}/admin/Admin.do?page=delete2",{
					data : {
						bookid : $("#book_id").text(),
					},
					dataType : "json",
					success : function(data) {
						$("#div_admin_book").html(data.result);
						//부모창의 회원목록 버튼을 클릭하게함
						opener.document.getElementById("mgmt_book").click();
					},
					error : function() {
						
					}
				});	
			}
		});
		$("#modify_book").click(function() {
			if(confirm("정말 수정하시겠습니까?")){
				var bookid = $("#book_id").text();
				var bookName = $("#book_name").text();
				var price = $("#book_price").text();
				$("#book_name").html("<input type='text' id='input_bookName' value=" + bookName + ">");
				$("#book_price").html("<input type='text' id='input_price' value=" + price + ">");
				$("#update_book").css("display","inline-block");
				$("#modify_book").css("display","none");
				$("#delete_book").css("display","none");
				//등록버튼을 누르면
				$("#update_book").click(function() {
					if(confirm("정말 등록하시겠습니까?")){
						console.log(bookid + bookName + price);
						$.ajax("${context}/admin/Admin.do?page=insert2",{
							data : {
								bookid : $("#book_id").text(),
								name : $("#input_bookName").val(),
								price : $("#input_price").val()
							},
							dataType : "json",
							success : function(data) {
								$("#div_admin_book").html(data.result);
								//부모창의 책목록 버튼을 클릭하게함
								opener.document.getElementById("mgmt_book").click();
							},
							error : function() {
								
							}
						});				
					}
				});
			}
		});
		
	});
</script>