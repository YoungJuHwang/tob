<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../global/header.jsp"%>
<form action="${context}/form_tag/school_register.do" id="frm_checkbox">
	이름 : <input type="text" name="name"/>
	나이 : <input type="text" name="age"/>
	
	<h1>주소</h1>
	<input type="radio" name="addr" value="서울" /> 서울
	<input type="radio" name="addr" value="대구" /> 대구
	<input type="radio" name="addr" value="부산" /> 부산
	<input type="radio" name="addr" value="포항" /> 포항
	
	<h1>좋아하는 프로그램 언어</h1>
	
	<input type="checkbox" name="subject" value="asp" /> ASP프로그래밍
	<input type="checkbox" name="subject" value="php" /> PHP프로그래밍
	<input type="checkbox" name="subject" value="jsp" /> JSP프로그래밍
	<input type="checkbox" name="subject" value="java" /> JAVA프로그래밍
	
	<h1> 전공</h1>
	<select name="major" id="major">
		<option value="not">전공선택</option>
		<option value="인문학">인문학</option>
		<option value="수학과">수학과</option>
		<option value="영문과">영문과</option>
		<option value="정보통신">정보통신</option>
	</select>
	
	<input type="button" id="btn_form_tag" value="확 인">
</form>
<script type="text/javascript">
$('#btn_form_tag').click(function() {
	/* var subjects = ($("input")).val(["asp", "php"]); */ // 클릭하면 val()괄호안의 값으로 버튼값 바뀜.
	
 	var addr = ($("input:radio[name=addr]:checked").val());
	var major = ($("select[name=major] option:selected").val());
	var name = $('input:text[name=name]').val();
	var age = $('input:text[name=age]').val(); 
	var subjects = formTag.checkbox($('input:checkbox:checked'));
	/* var count = $('input[name=subject]:checkbox:checked'); 선택된 갯수 세기*/
	var count = $("input:checkbox:checked").length;
	
	alert( "이름 : "+name+"\n나이 : "+age+"\n선택한 주소 : " +addr
			+"\n선택한 전공 : "+major+  "\n선택한 언어 : "+subjects
			 + "\n선택한 과목 수 : "+count );
	
});

var formTag = {}; /*빈객체 생성*/

formTag.alert = function(id,pw,nation){   /*디스플레이의 객체*/
	alert("입력한 아이디는 " + id + "이고 패스워드는 " + pw + "입니다.\n당신의 출신국가는 " + nation
			+ "입니다.");
} //자바스크립트임. -> 클래스 선언과 비슷한 것. ;없는것도 걍 선언만 함.

/* formTag.radio = function(addr) {
	//원래 여기다 alert(); 한걸 고친거.
	return addr;
} */

formTag.checkbox = function(subjects) {
	var arr = [];
	subjects.each(function() {
		arr.push($(this).val());
	});
	return arr;
}

/* formTag.select = function(major) {
	return major;
} */
</script>






