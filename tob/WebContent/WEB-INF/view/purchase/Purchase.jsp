<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${context}/css/common.css" /> 


<div id = "box">

	<a href="#" class="list-group-item" id="cart">장바구니 서비스로</a>
	<a href="#" class="list-group-item" id="list">주문목록 서비스로</a>
</div>

<script type="text/javascript">
	$(function() {
		$('#cart').click(function() {
			Purchase.cart();
		});
		$('#list').click(function() {
			Purchase.list();
		});
		$('#regist').click(function() {
			Purchase.regist();
		});
		$('#change').click(function() {
			Purchase.change();
		});
		
	});

	var Purchase = {
						
			cart : function() {
				$.getJSON('${context}/purchase/Purchase.do?page=cart', function(data) {
					
					var table = '<h1> 장바구니 목록</h1>'
					+'<table id="cart_list"><tr><th>책 이름</th><th>임시 주문번호</th><th>수량</th></tr>';
					$.each(data, function() {
						table +='<tr><td>'+this.bookId+'</td><td>'+this.accNum+'</td><td>'+this.count+'</td></tr>'
							+'<tr><td>'+this.bookId+'</td><td>'+this.accNum+'</td><td>'+this.count+'</td></tr>';
					});
					table += '</table><a href="#" id="pay">결제하기</a>';
					$(table).appendTo($('#box').empty());
				});
			},
			list : function() {
				$.getJSON('${context}/purchase/Purchase.do?page=list', function(data) {
					var arr = [];
					var table = '<h1> 전체주문 목록</h1>'
					+'<table id="pur_list"><tr><th>주문번호</th><th>합계</th><th>어카운트 넘버</th><th>주문한 아이디</th></tr>';
					$.each(data, function(i, val) {
						table +='<tr><td><a href="#" id="'+this.purNum+'">'+this.purNum+'</a></td>'
						+'<td id = "s'+i+'">'+this.sum+'</td>'
						+'<td id = "a'+i+'">'+this.accountNum+'</td>'
						+'<td id = "u'+i+'">'+this.userid+'</td>'
						+'<td><a href="#" id="change'+i+'">변경하기</a></td></tr>'
						+'<td><a href="#" id="delete'+i+'">삭제하기</a></td></tr>';
						arr.push(this.purNum);
					});
					table += '</table><a href="#" id="regist">등록하기</a>'
					+'<a href="#" id="change">수정하기</a>';
					$(table).appendTo($('#box').empty());
					
					$.each(data, function(i, val) {
						$('#'+arr[i]).click(function() {
							alert("주문번호 클릭");
							var purNum = $('#'+arr[i]);
							var sum = $('#s'+i).text();
							var accNum = $('#a'+i).text();
							var userid = $('#u'+i).text();
							$('#s'+i).html('<input type="text" id="input_sum" value="'+sum+'">');
							$('#a'+i).html('<input type="text" id="input_accNum" value="'+accNum+'">');
							$('#u'+i).html('<input type="text" id="input_userid" value="'+userid+'">');
							$('#change'+i).click(function() {
								$.ajax("${context}/purchase/Purchase.do?page=change",{
									data : {
										purNum : $('#'+arr[i]).text(),
										sum : $('#input_sum').val(),
										accountNum : $('#input_accNum').val(),
										userid : $('#input_userid').val()
									},
									dataType : 'json',
									success : function() {
										$(table).appendTo($('#box').empty());
									},
									error : function() {
										
									}
								});
							});
							
						});
						
					});
					
				});
			},
			/* remove : function(purNum) {
				$.ajax('${context}/purchase/Purchase.do?page=remove',{
					data : {},
					dataType : ,
					success : function() {
						
					},
					error : function() {
						
					}
				});
			} */
			
			change : function() {
				$.getJSON('${context}/purchase/Purchase.do?page=')
			}
	};
</script>

