<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="${root}/css/style.css"/>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<script>
	$(function() {
		var trigger = $('#trigger');
		var menu = $('nav ul');
		$(trigger).on('click', function(e) {
			e.preventDefault();
			menu.slideToggle();
		});
		$(window).resize(function() {
			var w = $(window).width();
			if (w > 320 && menu.is(':hidden')) {
				menu.removeAttr('style');
			}
		});
	});
</script>
<body>
<div class="container">
	<!-- 상단 메뉴 -->
<div class="center-block">
		<table class="table">
			<tr>
				<td class="td"><img src="${root}/template/images/main-03.jpg"
					width='100%' height='100%'></td>
			</tr>

		</table>

		<nav class="navbar navbar-light" style="background-color: #8be5b7;"">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="${root}/index.do">홈</a>
				</div>
				<ul class="nav navbar-nav">

							<li><a href="${root}/team/createForm.do">&nbsp;회원가입</a></li>
							<li><a href="${root}/team/list.do">&nbsp;회원목록</a></li>

				</ul>

		</div>
		</nav>
</div>
</div>

	<!-- 상단 메뉴 끝 -->



	<!-- 내용 시작 -->

</body>
</html>
