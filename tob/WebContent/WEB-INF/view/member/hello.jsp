<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../global/header.jsp"%>
<div class="outbox">
	<div class="box">
		자바스크립트는 <mark>객체 기반</mark>의 스크립트 프로그래밍 언어이다 <br />
		(cf. 자바는 <mark>클래스 기반</mark> 기반 컴파일 프로그래밍 언어이다.) <br />
		★★ 클래스 기반과 객체 기반의 차이점 알아야 한다. <br />
		JS는 본래 넷스케이프 사의 브랜던 아이크가 처음에는 모카스크립트라는 이름으로,<br />
		나중에는 라이브스크립트라는 이름으로 개발. 후에 Java가 1995년 개발되고, <br />
		객체지향 개념이 등장하자 JavaScript라는 이름으로 객체기반 프로그램밍 언어로 업글되었다.
	</div>
	<div class="pad"></div>
	<div class="">
		<h3> 자바스크립트의 특징</h3>
		<ul>
			<li>서버가 아닌 클라이언트에서 작동하는 인터프리터 언어</li>
			<li>객체 기반의 언어</li>
			<li>HTML 문서에 삽입 혹은 링크로 연결</li>
			<li>변수의 타입을 지정할 필요가 없음(var로 통일)</li>
		</ul>
	</div>
	<div class="pad"></div>
	<div class="">
		<h3> 자바스크립트의 기본 문법 </h3>
		<ul>
			<li>변수</li>
			<li>제어문</li>
			<li>함수</li>
		</ul>
		<h3>클라이언트 쪽 자바스크립트</h3>
		<ul>
			<li>객체 제어(BOM, DOM)</li>
			<li>이벤트 핸들링</li>
		</ul>
		<h3>서버와 데이터 통신을 위한 자바스크립트 : NodeJS</h3>
	</div>
	<div id="config_element" class="bg_color_yellow">
		<h3>JS와 관련있는 HTML 구성요소</h3>
		<ul>
			<li>요소(Element) : 내용을 구성하는 것으로 태그로 표현된다.</li>
			<li>속성(Property) : 요소가 가진 고유의 특징(객체의 특징)</li>
			<li>속성(Attribute) : 요소에 대한 추가적인 특징(HTML 추가 속성)</li>
		</ul>		
	</div>
	<div id="pad" class ="bg_color_yellow"> </div>
	<table>
		<tr>	
			<th>패턴</th>
			<th>대상</th>
		</tr>
		<tr>
			<td>*</td>
			<td>모든 엘리먼트</td>
		</tr>
		<tr>
			<td>#</td>
			<td>ID를 찾는 엘리먼트</td>
		</tr>
		<tr>
			<td>.</td>
			<td>클래스를 찾는 엘리먼트</td>
		</tr>
		<tr>
			<td>E</td>
			<td>태그 이름이 E인 엘리먼트</td>
		</tr>
		<tr>
			<td>E > F</td>
			<td>태그 이름이 E이면서 직속태그가 F인 엘리먼트</td>
		</tr>
		<tr>
			<td>E:first-child</td>
			<td>부모 엘리먼트 기준으로 첫번째 자식 엘리먼트</td>
		</tr>
		<tr>
			<td>E:active</td>
			<td>엘리먼트가 활성화 되었을 때</td>
		</tr>
		<tr>
			<td>E:hover</td>
			<td>엘리먼트 위로 마우스가 올라 갔을 떄</td>
		</tr>
		<tr>
			<td>E:focou</td>
			<td>엘리먼트에 커서가 위치할 때</td>
		</tr>
		<tr>
			<td>E + F</td>
			<td>E 엘리먼트 바로 옆의 엘리먼트 F</td>
		</tr>
		<tr>
			<td>E[A]</td>
			<td>속성이 A로 설정된 E엘리먼트</td>
		</tr>
		<tr>
			<td>E[A=V]</td>
			<td>속성 A의 값이 V인 모든 엘리먼트</td>
		</tr>
		<tr>
			<td>E[A^=V]</td>
			<td>속성 A의 값이 V로 시작하는 모든 엘리먼트</td>
		</tr>
	</table>
	<input type="button" id="btn_box" value="색상 변경"/>
	<input type="button" id="btn_box2" value="글자 추가"/>
</div>
<script type="text/javascript">  <!--  -> 자바의 메인메소드 같은 개념. -->
 	/* $(document).ready(function() {
 		$('config_element').addClass('bg_color_yellow');
 	}); */ /* 페이지가 로딩되면 자동으로 작동. 즉 default. ready메소드는 document밖에 못씀.*/
 	
 	/* $('#btn_box').click(function() {
 		$('#config_element').addClass('bg_color_yellow');
	}); 클릭하면 바뀜*/
 	
	/* $('#btn_box').mouseover(function() {
 		$('config_element').addClass('bg_color_yellow');
	}); */
	$('#btn_box').click(function() {
 		$('#config_element').removeClass('bg_color_yellow').addClass('bg_color_red');
	}); /* 처음 바탕은 노랑 이후 버튼클릭시 제거 후 빨강으로 만듬 */
	
	$('#btn_box2').click(function() {
		//$("#pad").text( "text()메소드는 글자를 집어넣는 메소드" );
		
			$('#pad').addClass(function( index, currentClass ) { /* addClass는 결과 */
			  var addedClass;
			 
			  if ( currentClass === "bg_color_yellow" ) {
			    addedClass = "bg_color_red"; // id가 pad고 class가 bg_color_yellow div에 class에 bg_color_red를 추가함.
			    //즉 addedClass는 기존 클래스에 덧붙이는 것임.
			    $("#pad").text( "원래는 노랑 바탕인데 빨강으로 바뀜" );
			  }
			 
			  return addedClass;
			});
	});
	
 	
 	
</script>

