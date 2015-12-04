<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${context}/css/common.css" /> 

<nav class="navbar navbar-default" style="margin: 0 auto;">
  <div class="container-fluid" style="padding-left: 400px;">
    <!-- Brand and toggle get grouped for better mobile display -->
  
	
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse" style="padding-left: 0;">
		    
				<div class="nav navbar-nav" style="padding-right: 200px;">
					<div class="nav navbar-nav-1" style="margin-left: 300px;" > Home</div>
					<div class="nav navbar-nav-2">
						<ul class="nav navbar-nav"  style="padding-right: 100px; padding-top: 100px">
							<li style="padding-right: 100px;"><a href="#">Event</a></li>
							<li style="padding-right: 100px;"><a href="#">Link asdq34f3qv</a></li>
							<li style="padding-right: 100px;"><a href="#">Link</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">Category <span class="caret"></span></a>
								<ul class="dropdown-menu" style="padding-right: 100px">
									<li><a href="${context}/book/Book.do">연우페이지로</a></li>
									<li><a href="${context}/event/Event.do">정민페이지로</a></li>
									<li><a href="${context}/purchase/Purchase.do">혜숙페이지로</a></li>
									<li><a href="${context}/member/Member.do">형동페이지로</a></li>
									<li><a href="${context}/admin/Admin.do">수민페이지로</a></li>
									<li role="separator" class="divider"></li>
									<li><a href="#">Separated link</a></li>
									<li role="separator" class="divider"></li>
									<li><a href="#">One more separated link</a></li>
							</ul></li>
						</ul>
				</div>
				</div>
		
 
    
    <%-- <c:if test="${empty sessionScope.member}"> <!-- test뒤 부분은 조건식. sessionScope == null -->
      <!-- 로그인 전 상태 표시할 태그 -->
      <ul class="nav navbar-nav navbar-right" style="margin: 0; padding-right: 100px;">
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
          <ul class="dropdown-menu">					다 생략하고 ${member.userid}로 써도 됨. 여기가 sessionscope껀지(o) request껀지.
            <li><a href="${context}/member.do?page=logout" id="logout">Log out</a></li>
            <li><a href="${context}/member.do?page=mypage&userid=${member.userid}" id="mypage">My page</a></li>
          </ul>
        </li>
       </ul>
     </c:if> --%>
     </div>
    </div><!-- /.navbar-collapse -->
    
  </div><!-- /.container-fluid -->
</nav>
<div class="container" style="margin-right: 0; margin-left: 350px;">

        <div class="row">

            <div class="col-md-9">

                <div class="row carousel-holder">

                    <div class="col-md-12">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img class="slide-image" src="http://placehold.it/800x300" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="http://placehold.it/800x300" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="http://placehold.it/800x300" alt="">
                                </div>
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>

                </div>

                <div class="row">

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">$24.99</h4>
                                <h4><a href="#">First Product</a>
                                </h4>
                                <p>See more snippets like this online store item at <a target="_blank" href="http://www.bootsnipp.com">Bootsnipp - http://bootsnipp.com</a>.</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">15 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">$64.99</h4>
                                <h4><a href="#">Second Product</a>
                                </h4>
                                <p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">12 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">$74.99</h4>
                                <h4><a href="#">Third Product</a>
                                </h4>
                                <p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">31 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">$84.99</h4>
                                <h4><a href="#">Fourth Product</a>
                                </h4>
                                <p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">6 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">$94.99</h4>
                                <h4><a href="#">Fifth Product</a>
                                </h4>
                                <p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">18 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <h4><a href="#">Like this template?</a>
                        </h4>
                        <p>If you like this template, then check out <a target="_blank" href="http://maxoffsky.com/code-blog/laravel-shop-tutorial-1-building-a-review-system/">this tutorial</a> on how to build a working review system for your online store!</p>
                        <a class="btn btn-primary" target="_blank" href="http://maxoffsky.com/code-blog/laravel-shop-tutorial-1-building-a-review-system/">View Tutorial</a>
                    </div>

                </div>

            </div>
			<div class="login-panel panel panel-default" style="float: left; margin-left: 50px; margin-top: 50px;">
                <!-- <div id="panel-heading">
                	<h3 class="panel-title"> Please Sign In</h3>
                </div> -->
                <div id="panel-body">
                	<form role="form">
                		<fieldset>
                			<div class="form-group">
                				<input class="form-control" placeholder="ID" name="userid" type="text" autofocus>
                			</div>
                			<div class="form-group">
                				<input class="form-control" placeholder="Password" name="password" type="password">
                			</div>
                			<div class="checkbox">
                				<a href="#" class="btn btn-lg btn-success btn-block">Login</a>
                			</div>
                		</fieldset>
                	</form>
         </div>
			
        </div>

    </div>

<script type="text/javascript">


	$(function() {
		$('#login').click(function() {
			bom.login();
		});
		$('#admin').click(function() {
			admin.checkAdmin();
		});
		
	});
	
	var bom = {};
	bom.popup = function() { //크롬에서 팝업으로 새로운창 띄우기.
		var url = "${context}/member/login.do?";
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
	bom.login = function() {
		
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
