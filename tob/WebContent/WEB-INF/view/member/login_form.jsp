<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<FORM NAME="Login" id="frm_login" METHOD=POST ACTION="${context}/member/mypage.do">

<TABLE WIDTH=620 BORDER=0 ALIGN=CENTER CELLSPACING=0 CELLPADDING=0>

	<TR>
		<TD ALIGN=CENTER WIDTH=320>
			아이디 <INPUT TYPE=TEXT id="userid" SIZE=10 MAXLENGTH=20>&nbsp;&nbsp;
			패스워드 <INPUT TYPE=PASSWORD id="password" SIZE=10 MAXLENGTH=20>
			<IMG id="btn_login" SRC="${context}/images/btn_login.gif" WIDTH=41 HEIGHT=22 ALIGN=ABSBOTTOM STYLE=CURSOR:HAND>
		</TD>    
		<TD ALIGN=RIGHT WIDTH=300>
			<IMG SRC="${context}/images/btn_idpw_srch.gif" STYLE=CURSOR:HAND>
			<IMG SRC="${context}/images/btn_be_member.gif" STYLE=CURSOR:HAND>
		</TD>
	</TR>
	
</TABLE>

</FORM>
<SCRIPT>
	/* document.getElementById('btn_login').addEventListener('click', function() {
		var form = document.getElementById('frm_login');
		form.submit();
	});  *//* =>jquery로 바꿈. 
			1. document.getElementById => $
			2. addEventListener => on => .click
	*/
	/* $(document).ready(function() {
		
	}); 1번째 단계.
		$(function() {
		
	}); 2번째 단계.
	*/
	/* $(function() {
		$('#btn_login').click(function() {
			/* $.ajax({
			}); 요기로 바꾸는 부분은 내일(11/24일)
			$('frm_login').submit(); //submit -> 다른 페이지로 이동(전송), 결과페이지 필요 => AJAX가 아님.
			$('frm_login').ajax(); //얘는 같은페이지에서 login부분만 바꿈. 엄연히 submit이랑 다름.
		});
	}); */
	$(function() {
		$('#btn_login').click(function() {
			//{} JS는 익명객체(일회용) 생성가능.
			$.ajax({ //함수를 넣지 않고 객체를 넣음.
				url : '${context}/member.do', //login은 post방식이므로 ? 안붙음.
				/* type : 'get', */ //get은 default이므로 제거 가능.
				data : {
					userid : $('#userid').val(),
					password : $('#password').val(),
					page : 'login' //멤버컨트롤러의 page로 감.
					
				},
				dataType : 'json',
				contentType :"application/x-www-form-urlencoded; charset=utf-8",
				success : function(data) {
					if (data.result === 'success') {
						$('<div id="login_result"></div>').appendTo($('#frm_login').empty());
						$('#login_result').html(
							'<div>환영합니다'+data.name+'님</div><button id="close1">#!#@#!창닫기</button>'		
						);
						$('#close1').click(function() {
							window.opener.top.location.href="${context}/main.do?page=auth&userid="+data.userid;
							window.close();
						});
					} else {
						alert('로그인 실패.');
					}
				
				}, // ,는 함수자체를 요소로 만듬.
				error : function() {
					alert('ajax 실패');
				}
			});  //submit()을 대체함. ajax내부는 거의 고정되있음. url, data, dataType, success, error.
			/* $.ajax(function() {
				
			}); */ //이렇게 쓰면 안됨. ajax는 속성값도 필요하므로. 이렇게 쓰면 함수밖에 없는게 되기 때문.
			
		}); 
	});
	
	
	
</SCRIPT>