<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<script src= "${context}/js/global.js"></script>
<script type="text/javascript">
	$(function() {
		Global.init();
		$('#header').load('${context}/main.do?page=header');
		$('#footer').load('${context}/main.do?page=footer');
		Member.detail();
	});
	var Member = {
			detail : function() {
				$.getJSON('${context}/member.do?page=detail&userid=${member.userid}',
						function(data){
							var table = '<table><tr><td rowspan="10" id="td_profile"><img id="profile" src="${context}/images/${member.profile}"/></td><th id="item">항목</th><th>빈 칸</th></tr>'
							+'<tr><td>아이디</td><td>${member.userid}</td></tr><tr><td>비밀번호</td><td>${member.password}</td></tr><tr><td>이름</td><td>${member.name}</td></tr><tr><td>생일</td><td>${member.gender}</td></tr>'
							+'<tr><td>폰번호</td><td>${member.phone}</td></tr>'
							+'<tr><td>이메일</td><td>${member.email}</td></tr><tr><td>성별</td><td>${member.gender}</td></tr><tr><td>주소</td><td>${member.addr}</td></tr>'
							+'<tr><td>등록일</td><td>${member.regdate}</td></tr><tr><td><button id="changeImg">사진변경</button></td>'
							+'<td><button id="changeInfo">정보수정</button><button id="remove">회원탈퇴</button></td><td><button id="confirm">확인</button></td></tr></table>';
					$('#box').html(table);
					Member.style();
					$('#changeInfo').click(function() {
						Member.updateForm();
					});
					$('#remove').click(function() {
						Member.remove('${member.userid}');
					});
				});
				
				},
			updateForm : function() {
				$.getJSON('${context}/member.do?page=detail&userid=${member.userid}',function(data){ //getJSON('')안에 할때마다 가져와야한다는것.
					$('<form action=${context}/member/update" id="frm">').appendTo($('#box').empty());
					var table = '<table><tr><td rowspan="10" id="td_profile"><img id="profile" src="${context}/images/${member.profile}"/></td><th id="item">항목</th><th>빈 칸</th></tr>'
						+'<tr><td>아이디</td><td>${member.userid}</td></tr><tr><td>비밀번호</td><td><input type="password" id="password" value="${member.password}"</td></tr><tr><td>이름</td><td>${member.name}</td></tr><tr><td>생일</td><td>${member.gender}</td></tr>'
						+'<tr><td>폰번호</td><td><input type="text" id="phone" value="${member.phone}"</td></tr>'
						+'<tr><td>이메일</td><td><input type="text" id="email" value="${member.email}"</td></tr><tr><td>성별</td><td>${member.gender}</td></tr><tr><td>주소</td><td><input type="text" id="addr" value="${member.addr}"</td></tr>'
						+'<tr><td>등록일</td><td>${member.regdate}</td></tr><tr><td><button id="changeImg">사진변경</button></td>'
						+'<td><button id="changeInfo">정보수정</button></td><td><button id="confirm">확인</button></td></tr></table>';
					$('#frm').html(table);
					Member.style();
					$('#confirm').click(function() {
						$('#frm').submit(function(e) { //form태그는 submit으로 값을 날림.
							e.preventDefault(); //기본 폼태그의 서브밋을 막아라. 자스의 서브밋을 실행해라.
							$.ajax('${context}/member.do',{ //수정된 데이터를 서버로 던져야 하기 때문에.. // getJSON은 보여주기만할때.
								data : {
									password : $('#password').val(),
									phone : $('#phone').val(),
									email : $('#email').val(),
									addr : $('#addr').val(),
									page : 'update'
								},
								async : true, //비동기로 할 지 여부, 기본값 true, 생략가능.
								dataType : 'json',
								success : function() {
									location.href="${context}/member.do?page=mypage&userid="+data.userid;
								},
								error : function(xhr, status, msg) {
									alert('에러발생상태 : '+status+', 내용 : '+msg);
									//error는 파라미터 갯수와 위치로 그 역할을 결정하기 때문에 xhr : AJAX를 실행하는 객체.
									//xhr은 자리를 지키고 있어야, status와 msg가 작동한다. 이름 다 바꿔도 됨. (a,b,c)
								}
							});
							
						});
					});
					
				});
			},
			update : function() {
				$.ajax({
					url : '', //url 반복쓰기 싫어서 getJSON처럼 앞에 붙였음.
					data : {},
					dataType : 'json',
					success : function(data) {
						
					},
					error : function(e) {
						
					} //try - exception 의 exception일때 error로 옴. 즉 프로그램 오류.
				});
			},
			style : function() {
				$('td').css('text-align','center');
				$('tr').add('th').add('td').css('float','center');
				$('#box').css('clear','both').css('margin','20px');
				$('#profile').css('width','300px');
				$('#td_profile').css('width','400px');
				$('#item').css('width','400px');
			},
			remove : function(userid) {
				$.ajax('${context}/member.do',{
					data : {
						userid : userid,
						page : 'remove'
					},
					dataType : 'json',
					success : function() {
						alert('회원탈퇴 되었습니다.');
						location.href = "${context}/member.do?page=logout";
					},
					error : function(xhr, status, msg) {
						alert('에러발생상태 : '+status+', 내용 : '+error);
						
					}
				});
				
			}
	};
</script>
<!-- 
 * 주요속성
 * data : 서버에 전송할 데이터, key/value 형식의 객체
 * dataType : 서버가 리턴하는 데이터 타입(xml, json, script, html)
 * type : 서버로 전송하는 데이터의 타입(POST, GET)
 * url : 데이터를 전송할 URL
 * success : AJAX 통신에 성공했을 때 호출될 이벤트 핸들러
 * error : AJAX 통신이 실패했을 때 호출될 이벤트 핸들러
 -->

