<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${context}/css/common.css" />

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="${context}/main.do">
	<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
	  </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="${context}/jquery/main.do?page=hello">jQuery 소개</a></li>
            <li><a href="${context}/jquery/main.do?page=form_tag"> form_tag </a></li>
			<li><a href="${context}/jquery/main.do?page=selector"> selector </a></li>
			<li><a href="${context}/jquery/main.do?page=traversing"> Traversing(조회) </a></li>
			<li><a href="${context}/jquery/main.do?page=attribute"> Attribute </a></li>
			<li><a href="${context}/jquery/main.do?page=core"> Core </a></li>
			<li><a href="${context}/jquery/main.do?page=css"> CSS </a></li>
			<li><a href="${context}/jquery/main.do?page=effect"> Effect </a></li>
			<li><a href="${context}/jquery/main.do?page=data"> Data </a></li>
			<li><a href="${context}/jquery/main.do?page=event"> Event </a></li>
			<li><a href="${context}/jquery/main.do?page=utility"> Utility </a></li>
			<li><a href="${context}/jquery/main.do?page=ajax"> AJAX </a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">검 색</button>
      </form>
    <c:if test="${empty sessionScope.member}"> <!-- test뒤 부분은 조건식. sessionScope == null -->
      <!-- 로그인 전 상태 표시할 태그 -->
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" 
          aria-haspopup="true" aria-expanded="false">Sign in <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#" id="login">Sign in</a></li>
            <li><a href="${context}/member.do?page=join">Sing up</a></li>
            <li><a href="#" id="admin">Admin</a></li> <!-- 63,64번째줄 차이 : 걍 넘어가는건 63번처럼 직접, 64번은 이동 외에 뭔 동작. -->
          </ul>
        </li>
       </ul>
     </c:if>
     <c:if test="${not empty sessionScope.member}"> <!-- sessionScope == not null 메인컨트롤러의 session.setAttribute때문에 가능.-->
     	<!-- 로그인 상태 시 표시할 태그 -->
     	<ul class="nav navbar-nav navbar-right" id="mypage">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" 
          aria-haspopup="true" aria-expanded="false"> <c:out value="${member.name}"/> <span class="caret"></span></a>
          <ul class="dropdown-menu">					<%-- 다 생략하고 ${member.userid}로 써도 됨. 여기가 sessionscope껀지(o) request껀지.--%>
            <li><a href="${context}/member.do?page=logout" id="logout">Log out</a></li>
            <li><a href="${context}/member.do?page=mypage&userid=${member.userid}" id="mypage">My page</a></li>
          </ul>
        </li>
       </ul>
     </c:if>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<script type="text/javascript">
	$(function() {
		$('#login').click(function() {
			bom.popup();	
		});
		$('#admin').click(function() {
			admin.checkAdmin();
		});
		
	});
	
	var bom = {};
	bom.popup = function() { //크롬에서 팝업으로 새로운창 띄우기.
		var url = "${context}/member.do?";
		var name = "로그인";
		var style = "toolbar=no,status=no,directories=no,scrollbars=yes,location=no,resizable=no,border=0,menubar=no";
		var param = "page=login_form";
		var width = 600;
		var height = 400;
		var xpos = (screen.availWidth - width) / 2;
		var ypos = (screen.availHeight - height) / 2;
		style = style+',top='+ypos+',left='+xpos+',width='+width+",height="+height;
		url = url + param;
		window.open(url,'',style);
	}
	
	var admin = {
			checkAdmin : function() {
				var isAdmin = confirm('관리자에요?'); /* confirm은 true(예-yes)/false(아니오-no)를 리턴함. */
				if (!isAdmin) {
					alert('관리자아니면 나가셈');
				} else {
					var password = prompt('관리자 비번 입력하세요');
					if (password == 1) { //관리자는 접근번호를 부여받음.
						location.href = "${context}/admin.do?page=main";
					} else {
						alert('관리자 비번 틀림ㅋㅋㅋ');
					}
				}
			}
	};
	
	
	
	
</script>