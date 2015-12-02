<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="temp">
<TABLE WIDTH=620 HEIGHT=40 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>
  <TR BGCOLOR=#A0A0A0>
    <TD ALIGN=CENTER><FONT SIZE=4><B>회 원 가 입</B></FONT></TD>
  </TR>
</TABLE>

<FORM NAME="frm_join" id="frm_join" METHOD='get' ACTION="">

<TABLE WIDTH=620 BORDER=1 CELLSPACING=0 CELLPADDING=2 ALIGN=CENTER>

	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>아이디</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="userid" id="userid" SIZE=20 MAXLENGTH=20 style="ime-mode:active">
		</TD>
	</TR>

	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>비밀번호</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE="password" NAME="password" id="password" SIZE=20 MAXLENGTH=10 style="ime-mode:inactive">
			<IMG SRC="${context}/images/btn_dup_id_3.gif" BORDER=0 ALIGN=ABSMIDDLE STYLE=CURSOR:HAND>
		</TD>
	</TR>
	
  	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>패스워드 <br />재입력</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=PASSWORD NAME="repassword" id="repassword" SIZE=20 MAXLENGTH=10>
		</TD>
	</TR>
  
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>이름</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE="text" NAME="name" id="name" SIZE=20 MAXLENGTH=10>
		</TD>
	</TR>
  
 	 <TR>
		<TD WIDTH=120 ALIGN=CENTER><B>생일</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE="text" NAME="birth" id="birth" SIZE=20 MAXLENGTH=10>
		</TD>
	</TR>
	
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>전화번호</B></TD>
		<TD WIDTH=500>
			<select name="phone" id="phone">
				<option value="010-4278-4789">010-4278-4789</option>
				<option value="010-4511-8559">010-4511-8559</option>
				<option value="017-511-8559">017-511-8559</option>
			</select>
		</TD>
	</TR>   
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>이메일</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="email" id="email" SIZE=60 MAXLENGTH=90 style="ime-mode:inactive">
			<select name="portal" size=1>
				<option value="0" selected>포털 선택</option>
				<option value="@naver.com">@naver.com</option>
				<option value="@gmail.com">@gmail.com</option>
				<option value="@daum.net">@daum.net</option>
				<option value="@hotmail.com">@hotmail.com</option>
			</select>
		</TD>
	</TR>
  	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>성 별</B></TD>
		<TD WIDTH=500>
			<input type="radio" name="gender" id="gender" value="남" /> 남
			<input type="radio" name="gender" id="gender" value="여" /> 여
		</TD>
	</TR>   
  	
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>주 소</B></TD>
			<td width=500>
				<input type="checkbox" name="addr" value="서울" /> 서울
				<input type="checkbox" name="addr" value="인천" /> 인천
				<input type="checkbox" name="addr" value="포항" /> 포항
				<input type="checkbox" name="addr" value="강남구" /> 강남구
				<input type="checkbox" name="addr" value="서초구" /> 서초구
				<input type="checkbox" name="addr" value="북구" /> 북구
				<input type="checkbox" name="addr" value="남구" /> 남구
			</td>
	</TR>
	
    <TR ALIGN=CENTER>
		<TD colspan="2">		
			<IMG SRC="${context}/images/btn_be_member_3.gif" STYLE=CURSOR:HAND id="join">&nbsp;&nbsp;
			<IMG SRC="${context}/images/btn_mb_cancel_3.gif"  STYLE=CURSOR:HAND id="cancel">
		</TD>
	</TR>	
   
</TABLE>
</FORM>
</div>

<script type="text/javascript">
	/* $(document).ready(function() {
		
	}); */ //jquery 에서 페이지마다 이렇게 반복되는게 별로.
	$(function() {
		$('#join').click(function() {
			Join.join();
		});
	}); 
	
	var Join = {
			join : function() {
					
					$.ajax('${context}/member.do',{
						data : {
							userid : $('#userid').val(),
							password : $('#password').val(),
							name : $('#name').val(),
							birth : $('#birth').val(),
							phone : $("select[name=phone] option:selected").val(),
							email : $('#email').val(),
							portal : $("select[name=portal] option:selected").val(),
							gender : ($("input:radio[name=gender]:checked").val()), 
							addr : function() {
								var arr = [];
								$('input:checkbox[name=addr]:checked').each(function() {
									arr.push($(this).val());
								});
								return arr;
							},
							page : 'joinMember'
						},
						dataType : 'json',
						success : function(data) {
							$('#temp').remove();
							var header = document.createElement('div');
							header.id = 'header'; //<div id='header'> </div> 만든거랑 같음. body는 안보이지 존재함.
							document.body.appendChild(header); //document는 가상의 최상위 객체. html에서 body를 제외한 header부분을 추가함.
							
							var outbox = document.createElement('div');
							outbox.id = 'outbox';
							document.body.appendChild(outbox);
							
							var footer = document.createElement('div');
							footer.id = 'footer';
							document.body.appendChild(footer); //dom객체의 1뎁스 : header, outbox, footer.
							$('<div id="box"></div>').appendTo($('#outbox').empty());
							$('#box').append('<h1> 환영합니다.'+ data.name +' 님 </h1><br/>'
										+'<a href="${context}/main.do">홈으로</a>');
								
						},
						error : function(request, status, error) {
							alert("Code : "+request.status+", 내용 : "+request.responseText+", error : "+error);
						}
					});
					
			},
			checkbox : function(addr) {
				var arr = [];
				addr.each(function() {
					arr.push($(this).val());
				});
				return arr;
			}
	};
	
	
	
	
</script>