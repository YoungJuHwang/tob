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
						+'<td id = "u'+i+'">'+this.userid+'</td>';
						arr.push(this.purNum);
					});
					table +='<a href="#" id="change">수정하기</a>'
					+'<a href="#" id="regist">등록하기</a>'
					+'<a href="#" id="delete">삭제하기</a>';
					$(table).appendTo($('#box').empty());
					$('#change').click(function() {
						Purchase.update();
					});
					$('#regist').click(function() {
						Purchase.registform();
					});
					$('#delete').click(function() {
						Purchase.remove();
					});
				});
				
			},
			registform : function() {
				$('#box').html('<TABLE WIDTH=500 HEIGHT=90 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER><TR style="color: highlight;"><TD ALIGN=CENTER><FONT SIZE=4><B>주문 등록</B></FONT>'
						+'</TD></TR></TABLE><FORM NAME="frm_join" id="frm_join" METHOD=get ACTION="${context}/purchase.do?page=regist"><TABLE WIDTH=500 BORDER=1 CELLSPACING=0 '
						+'CELLPADDING=2 ALIGN=CENTER><TR><TD WIDTH=120 ALIGN=CENTER><B>주문번호</B></TD><TD WIDTH=500><INPUT TYPE=TEXT NAME="purNum" id="purNum" placeholder="주문 '
						+'번호" SIZE=15 MAXLENGTH=7 style="color: red;"></TD></TR><TR><TD WIDTH=120 ALIGN=CENTER><B>합계</B></TD><TD WIDTH=500><INPUT TYPE=TEXT NAME="sum" '
						+'id="sum" placeholder="합 계" SIZE=15 MAXLENGTH=7 style="border-color: green;"></TD></TR><TR><TD WIDTH=120 ALIGN=CENTER><B>1일 주문번호</B></TD><TD WIDTH=500>'
						+'<INPUT TYPE=TEXT NAME="accNum" id="accNum" placeholder="1일 주문번호" SIZE=15 MAXLENGTH=7 style="background: black; color: white;"></TD></TR><TR><TD WIDTH=120 '
						+'ALIGN=CENTER><B>회원아이디</B></TD><TD WIDTH=500><input type="text" name="userid" placeholder="회원 아이디" id="userid" size="15" maxlength="7" /></TR>'
						+'<TR ALIGN=CENTER><TD colspan="2"><input type="button" value="등록" id="commit" style="border-bottom-color: '
						+'aqua;"/><input type="button" value="취소" id="cancel" style="border-color: green;"/></TD></TR></TABLE></FORM>'
						);
				$('#commit').click(function() {
					Purchase.regist();
				})
			},
			
			regist : function() {
				$('#frm_join').submit(function(e) {
					e.preventDefault();
					$.ajax('${context}/purchase',{
						data : {},
						dataType : '',
						success : function() {
							
						},
						error : function() {
							
						}
						
					});
				});
				
				
			},
			update : function() {
				$.getJSON('${context}/purchase/Purchase.do?page=change', function(data) {
					var table = '<h1> 주문내역 수정</h1>'
						+'<table id="pur_list"><tr><th>주문번호</th><th>합계</th><th>어카운트 넘버</th><th>주문한 아이디</th></tr>';
				
					$(table).appendTo($('#box').empty());
				
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
	};
</script>

