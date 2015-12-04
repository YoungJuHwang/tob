<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<title>환영합니다. 한빛문고 회원가입 페이지입니다.</title>
<script type="text/javascript" src="${context}/js/ajax.js"></script>
<script type="text/javascript" src="${context}/js/effect.js"></script>
<script type="text/javascript" src="${context}/js/global.js"></script>
<script type="text/javascript">
		    function id_check()
			{
				var join_form = document.member;
				var id = member.id.value;
				 
				if(id == "")
				{
					alert("사용하실 아이디를 입력 후 ID 중복 체크를 하십시오.");
					member.id.focus();
					return;
				}
				
				var url = "../member.do?task=idChk";
				var myAjax = new Ajax.Request(url,
							{	
								method: 'post', 
								parameters: Form.serialize('member'),
								onComplete: callbacka
							}
						);
			}
				
			function callback(originalRequest)
			{
				var forward = originalRequest.responseText;
				
				if( forward == "idchecknot" )
				{
					$('type1').style.display = 'none';
					$('type2').style.display = '';
					alert("이미 존재하는 아이디 입니다.");
				}
				else	
				{
					$('type1').style.display = '';
					$('type2').style.display = 'none';
					alert("사용이 가능한 아이디 입니다.");
				}
			}
			
			
			function member_join()
			{
				var join_form = document.member;
				
				join_form.task.value = "newUser";
				join_form.method = "post";
				join_form.action = "../member.do";
				join_form.submit();
			}
			
			
			function join_cancel()
			{
				var join_form = document.join_form;
				
				chked = confirm("회원 가입을 취소 하시겠습니까?");
				
				if(chked == true)	// 이하 값들을 비워준다
				{
					member.userid.value = "";
					member.password.value = "";
					member.name.value = "";
					member.birth.value = "";
					member.gender.value = "";
					member.email.value = "";
					member.phone.value = "";
					member.addr.value = "";
				}
			}
		</script>
	</head>
	<body>
		<h2>환영합니다. 한빛문고 회원가입페이지입니다.</h2><hr><p>
		<form name="join" method="post" action="/member/Member.do" style="margin: 0; padding: 0">
		<input type="hidden" name="task">
		<table width="600" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td colspan="3" align="center"><h3>회원 가입</h3></td>
			</tr>
			<tr style="background-color: #e4eefe">
				<td height="30" width="120"><font color="red">*</font> 아이디 :</td>
				<td width="250"><input type="text" name="userid">&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:idChk()">중복 체크</a></td>
				<td><div id="type1" style="display: none"><font color='red'>★</font> 사용 가능한 아이디 입니다.</div><div id="type2" style="display: none"><font color='red'>★</font> 이미 존재하는 아이디 입니다.</div></td>
			</tr>
			<tr>
				<td height="30"><font color="red">*</font> 비밀번호 :</td>
				<td colspan="2"><input type="password" name="password"></td>
			</tr>
			<tr>
				<td height="30"><font color="red">*</font> 이름 :</td>
				<td colspan="2"><input type="text" name="name"></td>
			</tr>
			<tr>
				<td height="30"><font color="red">*</font> 생년월일 :</td>
				<td colspan="2"><input type="text" name="birth"></td>
			</tr>
			<tr>
				<td height="30"><font color="red">*</font> 전화번호 :</td>
				<td colspan="2"><input type="text" name="phone_foward" size="5">&nbsp;-&nbsp;<input type="text" name="phone_middie" size="11">&nbsp;-&nbsp;<input type="text" name="phone_back" size="11"></td>
			</tr>
			<tr style="background-color: #e4eefe">
				<td height="30"><font color="red">*</font> email :</td>
				<td colspan="2"><input type="text" name="email_foward" size="15">&nbsp;@&nbsp;<input type="text" name="email_back" size="15"></td>
			</tr>
			<tr>
				<td height="30">&nbsp;&nbsp;주소 :</td>
				<td colspan="2"><input type="text" name="address" size="43"></td>
			</tr>
			<tr style="background-color: #e4eefe" align="center">
				<td colspan="3" height="60"><a href="javascript:userInner()">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:reset()">취소</a></td>
			</tr>
		</table>
		</form>
		</body>
</html>