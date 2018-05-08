<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp"%>
<c:set var="title" value="나의 여행 블로그" />
<c:if test="${not empty sessionScope.id && sessionScope.grade=='A'}">
	<c:set var="title" value="관리자 페이지 입니다." />
</c:if>
<c:choose>
	<c:when test="${empty sessionScope.id}">
		<c:set var="str" value="메인 페이지 입니다." />
	</c:when>
	<c:otherwise>
		<c:set var="str" value="${sessionScope.id}님 환영합니다" />
	</c:otherwise>
</c:choose>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);

* {
	font-family: 'Nanum Pen Script', sans-serif;
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<div class="center-block" style="text-align: center;">

			${title}<br>

			${str}<br> <img src="images/main.jpg" width='100%'><br>
			<br>
			<c:choose>
				<c:when test="${empty session.id}">
					<button type="button" class="btn btn-primary"
						onclick="location.href='member/loginForm.jsp'">로그인</button>
				</c:when>
				<c:otherwise>
					<button type="button" class="btn btn-primary"
						onclick="location.href='member/logout.jsp'">로그아웃</button>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>
