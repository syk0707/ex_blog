<%@ page contentType="text/html; charset=UTF-8" %> 
 <% request.setCharacterEncoding("utf-8"); %>
<%@ include file="/ssi/ssi.jsp" %> 
 
<!-- dao, dto 객체 2개를 생성했다. 범위가 있다. -->
<!-- dto에는 setter getter가 있는데 setter를 호출 할 수 있다. setter가 호출되었다. 그리고 request.getParameter를 포함하고 있다. 변수명이 다를때는 param(parameter)를 추가한다. 
	* asterisk로 모든 변수 등록 가능하다. -->    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
</style>
<link href = " ${root}/css/style.css" rel = "stylesheet" />
<script type = "text/javascript">
function alist(){
	var url = "list.do";
	location.href=url;
}
function acreate(){
	var url = "createForm.do";
	location.href= url;
}
</script>
</head>

<body>

<c:choose>
<c:when test="${flag}">등록성공입니다
</c:when>
<c:otherwise>
등록실패입니다.
</c:otherwise>
</c:choose>

<div class = content>

</div>
<div class = "bottom">
<br>
<button class="button" onclick="acreate()"> 계속 등록 </button>
<button class="button" onclick="alist()"> 목록 </button>

<br>
</div>
</body>
</html>