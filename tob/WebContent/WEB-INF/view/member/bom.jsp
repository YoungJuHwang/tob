<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../global/header.jsp"%>
<div class="outbox">
	<div class="box">
		<input type="button" id="back" value="뒤로가기"/>
		<h3>자바스크립트 객체와 자바의 차이점</h3>
		JS는 객체기반 언어이다. Java는 객체지향 언어이다. <br />
		두 언어간의 차이점은 객체를 표현하는데 있어서 <br />
		클래스(객체의 정의)와 인스턴스(객체의 실체)를 정확히 구분하는데 있다. <br />
		반면 JS는 이의 구별없이 단순히 객체라고 통합하여 말한다. <br />
		JS에서 객체는 물같은 액체로 봄 -> 클래스 수정 없이 메소드 자체를 추가 삭제 가능. <br />
		-> 나도 모르는 사이 객체가 바뀔 수 있다. 객체를 먼저 정의하는 것이 의미없다. <br />
		자바는 인스턴스를 다이나믹하게 고칠 수 없다 -> 클래스를 수정 후 인스턴스를 수정할 수 있다. <br />
		※ 자바스크립트는 이벤트(브라우저 창 열기)가 있어야 한다. 그 전엔 존재하지 않음.
	</div>
	<div class="pad"> </div>
	<h3>객체의 구분</h3>
	<ul>
		<li>기본객체 : String, Math, Date, Array</li>
		<li>내장객체 : 브라우저객체(BOM), 다큐먼트객체(DOM) -> 정의되어있지 않음. 사용법만 있다.</li>
		<li>사용자정의객체 : 개발자가 직접 만든 객체들.. ex) var member = {}</li>
	</ul>
	<h3>브라우저 객체(BOM : Browser Object Model)의 종류</h3>
	웹 브라우저는 최초 HTML이 로드할 때, HTML문서와 관계없이 5개의 브라우저 객체를 생성한다. <br />
	<ol>
		<li>Window</li>
		<li>Document</li>
		<li>Location</li>
		<li>Navigator</li> 
		<li>History</li> <!-- 뒤로가기에 쓰임 -->
	</ol>
	<p>★★브라우저 객체는 Window 객체라고 불리며, 브라우저 창이 열리때마다(이벤트) 생성된다.
		브라우저 창안에 존재하는 모든 요소(객체)들의 상위객체 window.alert()와 같이 
		사용해야 하나 window를 생략하고 사용가능하다.(자바에서의 this 와 비슷.)
		window가 최상위 객체이긴 하나, 추상적인 개념의 최상위 객체인 Object가 존재. 
		-> 자바의 상속 개념을 도입하기 위해. 존재하지 않는 Object를 추상적으로 존재한다고 만듬.
	</p>
	
	<a href="#" id="opener">팝업창으로 열기</a> <br />
	<a href="${context}/js/main.do?page=popup" target="_blank">a태그 새창 열기</a> <br />
	
	<a href="#" id="location">페이지 이동</a>
	
</div>

<script>
	$('#opener').click(function() {
		/* window.open('${context}/js/main.do?page=popup'); */
		/* window.close(); -> close는 window에 영향을 미치지 못한다. */
		bom.popup();
	});
	$('#location').click(function() {
		location.href = "${context}/js/main.do?page=dom";
	}); 
	$('#back').click(function() {
		history.go(-1)
	}); 
	var bom = {};
	bom.popup = function() { //크롬에서 팝업으로 새로운창 띄우기.
		var url = "${context}/member.do";
		var name = "팝업";
		var style = "toolbar=no,status=no,directories=no,scrollbars=yes,location=no,resizable=no,border=0,menubar=no";
		var param = "?page=login";
		var width = 600;
		var height = 400;
		var xpos = (screen.availWidth - width) / 2;
		var ypos = (screen.availHeight - height) / 2;
		style = style+',top='+ypos+',left='+xpos+',width='+width+",height="+height;
		url = url + param;
		window.open(url,'',style);
	}
</script>







